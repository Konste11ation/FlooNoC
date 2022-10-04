// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Tim Fischer <fischeti@iis.ee.ethz.ch>

module floo_synth_mesh
  import floo_pkg::*;
  import floo_flit_pkg::*;
  import floo_param_pkg::*;
  (
    input logic clk_i,
    input logic rst_ni,
    input  logic  [NumX-1:0][NumY-1:0][NumVirtChannels-1:0]  valid_i,
    output logic  [NumX-1:0][NumY-1:0][NumVirtChannels-1:0]  ready_o,
    input  flit_t [NumX-1:0][NumY-1:0][NumPhysChannels-1:0]  data_i,

    output logic  [NumX-1:0][NumY-1:0][NumVirtChannels-1:0] valid_o,
    input  logic  [NumX-1:0][NumY-1:0][NumVirtChannels-1:0] ready_i,
    output flit_t [NumX-1:0][NumY-1:0][NumPhysChannels-1:0] data_o
  );

  floo_mesh #(
    .NumX             ( NumX            ),
    .NumY             ( NumY            ),
    .NumVirtChannels  ( NumVirtChannels ),
    .NumPhysChannels  ( NumPhysChannels ),
    .RouteAlgo        ( RouteAlgo       ),
    .flit_t           ( flit_t          ),
    .xy_id_t          ( xy_id_t         )
  ) i_floo_mesh (
    .*
  );

endmodule
