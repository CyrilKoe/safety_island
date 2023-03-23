// Copyright 2023 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

package safety_island_pkg;

  typedef enum logic [1:0] {
    Jtag = 2'b0,
    Preloaded = 2'b01
  } bootmode_e;

  parameter int unsigned GlobalAddrWidth       = 32;
  parameter bit [GlobalAddrWidth-1:0] BaseAddr = 32'h0000_0000;
  localparam bit [31:0] BaseAddr32             = BaseAddr[31:0]; // TODO check this
  parameter bit [31:0] AddrRange               = 32'h0080_0000;
  parameter bit [31:0] MemOffset               = 32'h0000_0000;
  parameter bit [31:0] PeriphOffset            = 32'h0020_0000;

  // Base addresses
  localparam bit[31:0] PeriphBaseAddr = BaseAddr32+PeriphOffset;
  localparam bit [31:0] DmBaseAddr    = PeriphBaseAddr+32'h0000_3000;
  localparam bit [31:0] ClicBaseAddr  = PeriphBaseAddr+32'h0001_0000;

  typedef struct packed {
    int unsigned              HartId;
    int unsigned              BankNumBytes;
    int unsigned              PulpJtagIdCode;
    // CV32RT configuration
    int unsigned              UseClic;
    int unsigned              UseFastIrq; // TODO
    int unsigned              UseFpu;
    int unsigned              UseIntegerCluster;
    int unsigned              UseXPulp;
    int unsigned              UseZfinx;
    int unsigned              NumInterrupts;
    int unsigned              NumMhpmCounters;
  } safety_island_cfg_t;

  localparam safety_island_cfg_t SafetyIslandDefaultConfig = '{
    HartId:            32'd0,
    BankNumBytes:      32'h0001_0000,
    // JTAG ID code:
    // LSB                        [0]:     1'h1
    // PULP Platform Manufacturer [11:1]:  11'h6d9
    // Part Number                [27:12]: 16'h0000 --> TBD!
    // Version                    [31:28]: 4'h1
    PulpJtagIdCode:    32'h1_0000_db3,
    UseClic:           1,
    UseFastIrq:        0,
    UseFpu:            0,
    UseIntegerCluster: 0,
    UseXPulp:          1,
    UseZfinx:          0,
    NumInterrupts:     256,
    NumMhpmCounters:   1
  };

endpackage
