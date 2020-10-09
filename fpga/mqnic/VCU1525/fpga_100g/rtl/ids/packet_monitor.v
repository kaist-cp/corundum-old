`timescale 1ns / 1ps

module packet_monitor#(
    // DMA RAM segment count
    parameter SEG_COUNT=2,
    // DMA RAM segment data width
    parameter SEG_DATA_WIDTH=64,
    // Width of AXIS stream interfaces in bits (Default: 256)
    parameter AXIS_DATA_WIDTH=SEG_DATA_WIDTH*SEG_COUNT/2,
    // DMA length field width
    parameter DMA_LEN_WIDTH=16,
    // Width of length field
    parameter LEN_WIDTH=16,
    // Use AXI stream tkeep signal
    parameter AXIS_KEEP_ENABLE = (AXIS_DATA_WIDTH>8),
    // AXI stream tkeep signal width (words per cycle)
    parameter AXIS_KEEP_WIDTH=(AXIS_DATA_WIDTH/8)    
)
(
    input clk,
    input [AXIS_DATA_WIDTH-1:0] axis_packet_data,   // Actual packet data being rxed (in little endian)
    input axis_packet_ready,                        // Whether if incoming data exists
    input axis_packet_valid,                        // Whether if incoming data is valid packet segment
    input axis_packet_last,                         // Whether if incoming data is last segment of the packet
    input [DMA_LEN_WIDTH-1:0] axis_descriptor_len,  // Length of DMA buffer descriptor
    input axis_descriptor_ready,                    // Whetehr DMA buffer descriptor is ready
    input axis_descriptor_valid                     // Whether DMA buffer descriptor information is valid
    
    // TODO may define all input/output regarding AXI Stream interface?
        // Since all signals regarding rx packet(like packet itself, descriptor) should be controlled.
    );
    
    localparam [1:0]
        STATE_IDLE=2'd0,        // Waiting for packet segments to be rxed.
        STATE_WRITE=2'd1,       // Packets segments are valid, and good to read.
        STATE_DROP_DATA=2'd2;   // Packet segments are invalid, and needs to be dropped.

    parameter AXIS_KEEP_WIDTH_INT = AXIS_KEEP_ENABLE?AXIS_KEEP_WIDTH:1;
    parameter CYCLE_COUNT_WIDTH = LEN_WIDTH - $clog2(AXIS_KEEP_WIDTH_INT) + 1;
    
    // "*_next" registers are temporary registers to update original register upon positive edge of clock signal
    reg [10:0] packet_no = 0, packet_no_next;       // Number of packets rxed (counter)
    reg [10:0] segment_no = 0, segment_no_next;     // Index number of segment on current packet
    reg [10:0] cycle_count = 0, cycle_count_next;   // Number of pakcet segments left on current packet
    reg [1:0] last_cycle=0, last_cycle_next;        // Whether if current packet segment is last one for the packet
    reg [1:0] state=STATE_IDLE, state_next;         // Current state on packet reading
    reg [1:0] valid_packet=0;
    
    ila_ram ila_monitor_inst (
        .clk(clk),
        .trig_out(),
        .trig_out_ack(1'b0),
        .trig_in(1'b0),
        .trig_in_ack(),
        .probe0(state),
        .probe1(axis_packet_last),
        .probe2(last_cycle),
        .probe3(cycle_count),
        .probe4(packet_no),
        .probe5(axis_packet_data)
    );

    // string_matching_engine sme_inst (
    //     .clk_in(clk),
    //     .axis_packet_data(axis_packet_data),
    //     .packet_segment_no(segment_no)
    // );
    
    always @* begin
        state_next=STATE_IDLE;
        cycle_count_next=cycle_count;
        last_cycle_next=last_cycle;
        packet_no_next=packet_no;
    
    
        // State logic is simplified version of dma_client_axis_sink.v L253-394
        case (state)
            STATE_IDLE: begin
                cycle_count_next = (axis_descriptor_len - 1) >> 3;
                last_cycle_next=cycle_count_next==0;
                
                if (axis_descriptor_ready && axis_descriptor_valid) begin
                    state_next=STATE_WRITE;
                    valid_packet=1;
                end
            end
            
            STATE_WRITE: begin
                if (axis_packet_ready && axis_packet_valid) begin
                    cycle_count_next = cycle_count - 1;
                    last_cycle_next = cycle_count == 0;
                    
                    if (axis_packet_last) begin
                        packet_no_next = packet_no_next+1;
                        state_next=STATE_IDLE;
                        valid_packet=0;
                    end else begin
                        state_next=STATE_WRITE;
                        // TODO: continue inspecting packet
                    end
                    // TODO: Is STATE_DROPDATA needed?
                end
            end
        endcase
    end
    
    // Update registers on positive edge of clock
    always @(posedge clk) begin
        state <= state_next;
        last_cycle<=last_cycle_next;
        cycle_count<=cycle_count_next;
        packet_no<=packet_no_next;
    end
endmodule
