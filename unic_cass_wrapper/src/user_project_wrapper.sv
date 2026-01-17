// SPDX-FileCopyrightText: © 2025 Leo Moser
// SPDX-License-Identifier: Apache-2.0

module user_project_wrapper (
    inout wire io_clock_PAD,
    inout wire io_reset_PAD,
    inout wire [16:0] ui_PAD,
    inout wire [16:0] uo_PAD
);
    wire io_clock_p2c;
    wire io_reset_p2c;
    wire [16:0] ui_PAD2CORE;
    wire [16:0] uo_CORE2PAD;

    //assign uo_CORE2PAD = ui_PAD2CORE; // Direct connection for testing

    // Power/Ground IO pad instances
    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_south ();
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_south ();

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_east ();
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_east ();

    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadVss_north ();
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadVdd_north ();

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_west ();
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_west ();

    // Power/Ground IO pad IO instances
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_south ();
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_south ();

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_east ();
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_east ();

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_north ();
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_north ();

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_west ();
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_west ();

    sg13g2_IOPadIn sg13g2_IOPad_io_clock (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD),
        `endif
        .p2c (io_clock_p2c), //o
        .pad (io_clock_PAD)  //~
    );

    sg13g2_IOPadIn sg13g2_IOPad_io_reset (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD),
        `endif
        .p2c (io_reset_p2c), //o
        .pad (io_reset_PAD)  //~
    );

    generate
    for (genvar i=0; i<17; i++) begin : sg13g2_IOPadIn_ui
        sg13g2_IOPadIn ui (
            .p2c (ui_PAD2CORE[i]),
            .pad (ui_PAD[i])
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<17; i++) begin : sg13g2_IOPadOut30mA_uo
        sg13g2_IOPadOut30mA uo (
            .c2p (uo_CORE2PAD[i]),
            .pad (uo_PAD[i])
        );
    end
    endgenerate

    user_project_example user_project_example_inst (
        `ifdef USE_POWER_PINS
        .VPWR   (VDD),
        .VGND   (VSS),
        `endif
        .clk_i  (io_clock_p2c),
        .rst_ni (io_reset_p2c),
        .ui_PAD2CORE (ui_PAD2CORE),
        .uo_CORE2PAD (uo_CORE2PAD)
    );

endmodule


