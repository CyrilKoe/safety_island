// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package safety_soc_ctrl_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 4;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    logic [31:0] q;
  } safety_soc_ctrl_reg2hw_bootaddr_reg_t;

  typedef struct packed {
    logic        q;
  } safety_soc_ctrl_reg2hw_fetchen_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } safety_soc_ctrl_reg2hw_corestatus_reg_t;

  // Register -> HW type
  typedef struct packed {
    safety_soc_ctrl_reg2hw_bootaddr_reg_t bootaddr; // [64:33]
    safety_soc_ctrl_reg2hw_fetchen_reg_t fetchen; // [32:32]
    safety_soc_ctrl_reg2hw_corestatus_reg_t corestatus; // [31:0]
  } safety_soc_ctrl_reg2hw_t;

  // Register offsets
  parameter logic [BlockAw-1:0] SAFETY_SOC_CTRL_BOOTADDR_OFFSET = 4'h 0;
  parameter logic [BlockAw-1:0] SAFETY_SOC_CTRL_FETCHEN_OFFSET = 4'h 4;
  parameter logic [BlockAw-1:0] SAFETY_SOC_CTRL_CORESTATUS_OFFSET = 4'h 8;

  // Register index
  typedef enum int {
    SAFETY_SOC_CTRL_BOOTADDR,
    SAFETY_SOC_CTRL_FETCHEN,
    SAFETY_SOC_CTRL_CORESTATUS
  } safety_soc_ctrl_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] SAFETY_SOC_CTRL_PERMIT [3] = '{
    4'b 1111, // index[0] SAFETY_SOC_CTRL_BOOTADDR
    4'b 0001, // index[1] SAFETY_SOC_CTRL_FETCHEN
    4'b 1111  // index[2] SAFETY_SOC_CTRL_CORESTATUS
  };

endpackage

