// SPDX-FileCopyrightText: © 2025 Leo Moser
// SPDX-License-Identifier: Apache-2.0

module user_project_wrapper (
    inout wire io_clock_PAD,
    inout wire io_reset_PAD,
    inout wire [15:0] ui_PAD,
    inout wire [15:0] uo_PAD,
    inout wire analog_io_0,
    inout wire analog_io_1
);
    wire io_clock_p2c;
    wire io_reset_p2c;
    wire analog_io_0_padres;
    wire analog_io_1_padres;
    wire [15:0] ui_PAD2CORE;
    wire [15:0] uo_CORE2PAD;

    assign uo_CORE2PAD = ui_PAD2CORE; // Direct connection for testing

    // Power/Ground IO pad instances
    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadVss_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadVdd_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    // Power/Ground IO pad IO instances
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIn sg13g2_IOPad_io_clock (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD),
        `endif
        .p2c (io_clock_p2c), //o
        .pad (io_clock_PAD)  //~
    );

    (* keep *) sg13g2_IOPadIn sg13g2_IOPad_io_reset (
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
    for (genvar i=0; i<16; i++) begin : sg13g2_IOPadIn_ui
        sg13g2_IOPadIn ui (
            `ifdef USE_POWER_PINS
            .vss    (VSS),
            .vdd    (VDD),
            .iovss  (IOVSS),
            .iovdd  (IOVDD),
            `endif
            .p2c (ui_PAD2CORE[i]),
            .pad (ui_PAD[i])
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<16; i++) begin : sg13g2_IOPadOut30mA_uo
        sg13g2_IOPadOut30mA uo (
            `ifdef USE_POWER_PINS
            .vss    (VSS),
            .vdd    (VDD),
            .iovss  (IOVSS),
            .iovdd  (IOVDD),
            `endif  
            .c2p (uo_CORE2PAD[i]),
            .pad (uo_PAD[i])
        );
    end
    endgenerate

    (* keep *) sg13g2_IOPadAnalog sg13g2_IOPad_analog_io_0 (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD),
        `endif
        .padres (analog_io_0_padres), //o
        .pad (analog_io_0)  //~
    );

    (* keep *) sg13g2_IOPadAnalog sg13g2_IOPad_analog_io_1 (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD),
        `endif
        .padres (analog_io_1_padres), //o
        .pad (analog_io_1)  //~
    );

endmodule


