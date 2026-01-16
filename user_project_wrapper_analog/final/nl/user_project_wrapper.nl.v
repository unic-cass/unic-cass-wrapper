module user_project_wrapper (analog_io_0,
    analog_io_1,
    io_clock_PAD,
    io_reset_PAD,
    ui_PAD,
    uo_PAD,
    VDD,
    VSS,
    IOVDD,
    IOVSS);
 inout analog_io_0;
 inout analog_io_1;
 inout io_clock_PAD;
 inout io_reset_PAD;
 inout [15:0] ui_PAD;
 inout [15:0] uo_PAD;
 input VDD;
 input VSS;
 input IOVDD;
 input IOVSS;

 wire analog_io_0_padres;
 wire analog_io_1_padres;
 wire io_clock_p2c;
 wire io_reset_p2c;
 wire \ui_PAD2CORE[0] ;
 wire \ui_PAD2CORE[10] ;
 wire \ui_PAD2CORE[11] ;
 wire \ui_PAD2CORE[12] ;
 wire \ui_PAD2CORE[13] ;
 wire \ui_PAD2CORE[14] ;
 wire \ui_PAD2CORE[15] ;
 wire \ui_PAD2CORE[1] ;
 wire \ui_PAD2CORE[2] ;
 wire \ui_PAD2CORE[3] ;
 wire \ui_PAD2CORE[4] ;
 wire \ui_PAD2CORE[5] ;
 wire \ui_PAD2CORE[6] ;
 wire \ui_PAD2CORE[7] ;
 wire \ui_PAD2CORE[8] ;
 wire \ui_PAD2CORE[9] ;

 sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_east ();
 sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_north ();
 sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_south ();
 sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_west ();
 sg13g2_IOPadIOVss sg13g2_IOPadIOVss_east ();
 sg13g2_IOPadIOVss sg13g2_IOPadIOVss_north ();
 sg13g2_IOPadIOVss sg13g2_IOPadIOVss_south ();
 sg13g2_IOPadIOVss sg13g2_IOPadIOVss_west ();
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[0].ui  (.p2c(\ui_PAD2CORE[0] ),
    .pad(ui_PAD[0]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[10].ui  (.p2c(\ui_PAD2CORE[10] ),
    .pad(ui_PAD[10]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[11].ui  (.p2c(\ui_PAD2CORE[11] ),
    .pad(ui_PAD[11]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[12].ui  (.p2c(\ui_PAD2CORE[12] ),
    .pad(ui_PAD[12]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[13].ui  (.p2c(\ui_PAD2CORE[13] ),
    .pad(ui_PAD[13]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[14].ui  (.p2c(\ui_PAD2CORE[14] ),
    .pad(ui_PAD[14]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[15].ui  (.p2c(\ui_PAD2CORE[15] ),
    .pad(ui_PAD[15]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[1].ui  (.p2c(\ui_PAD2CORE[1] ),
    .pad(ui_PAD[1]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[2].ui  (.p2c(\ui_PAD2CORE[2] ),
    .pad(ui_PAD[2]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[3].ui  (.p2c(\ui_PAD2CORE[3] ),
    .pad(ui_PAD[3]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[4].ui  (.p2c(\ui_PAD2CORE[4] ),
    .pad(ui_PAD[4]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[5].ui  (.p2c(\ui_PAD2CORE[5] ),
    .pad(ui_PAD[5]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[6].ui  (.p2c(\ui_PAD2CORE[6] ),
    .pad(ui_PAD[6]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[7].ui  (.p2c(\ui_PAD2CORE[7] ),
    .pad(ui_PAD[7]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[8].ui  (.p2c(\ui_PAD2CORE[8] ),
    .pad(ui_PAD[8]));
 sg13g2_IOPadIn \sg13g2_IOPadIn_ui[9].ui  (.p2c(\ui_PAD2CORE[9] ),
    .pad(ui_PAD[9]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[0].uo  (.c2p(\ui_PAD2CORE[0] ),
    .pad(uo_PAD[0]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[10].uo  (.c2p(\ui_PAD2CORE[10] ),
    .pad(uo_PAD[10]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[11].uo  (.c2p(\ui_PAD2CORE[11] ),
    .pad(uo_PAD[11]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[12].uo  (.c2p(\ui_PAD2CORE[12] ),
    .pad(uo_PAD[12]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[13].uo  (.c2p(\ui_PAD2CORE[13] ),
    .pad(uo_PAD[13]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[14].uo  (.c2p(\ui_PAD2CORE[14] ),
    .pad(uo_PAD[14]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[15].uo  (.c2p(\ui_PAD2CORE[15] ),
    .pad(uo_PAD[15]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[1].uo  (.c2p(\ui_PAD2CORE[1] ),
    .pad(uo_PAD[1]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[2].uo  (.c2p(\ui_PAD2CORE[2] ),
    .pad(uo_PAD[2]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[3].uo  (.c2p(\ui_PAD2CORE[3] ),
    .pad(uo_PAD[3]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[4].uo  (.c2p(\ui_PAD2CORE[4] ),
    .pad(uo_PAD[4]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[5].uo  (.c2p(\ui_PAD2CORE[5] ),
    .pad(uo_PAD[5]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[6].uo  (.c2p(\ui_PAD2CORE[6] ),
    .pad(uo_PAD[6]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[7].uo  (.c2p(\ui_PAD2CORE[7] ),
    .pad(uo_PAD[7]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[8].uo  (.c2p(\ui_PAD2CORE[8] ),
    .pad(uo_PAD[8]));
 sg13g2_IOPadOut30mA \sg13g2_IOPadOut30mA_uo[9].uo  (.c2p(\ui_PAD2CORE[9] ),
    .pad(uo_PAD[9]));
 sg13g2_IOPadVdd sg13g2_IOPadVdd_east ();
 sg13g2_IOPadIOVdd sg13g2_IOPadVdd_north ();
 sg13g2_IOPadVdd sg13g2_IOPadVdd_south ();
 sg13g2_IOPadVdd sg13g2_IOPadVdd_west ();
 sg13g2_IOPadVss sg13g2_IOPadVss_east ();
 sg13g2_IOPadIOVss sg13g2_IOPadVss_north ();
 sg13g2_IOPadVss sg13g2_IOPadVss_south ();
 sg13g2_IOPadVss sg13g2_IOPadVss_west ();
 sg13g2_IOPadAnalog sg13g2_IOPad_analog_io_0 (.pad(analog_io_0),
    .padres(analog_io_0_padres));
 sg13g2_IOPadAnalog sg13g2_IOPad_analog_io_1 (.pad(analog_io_1),
    .padres(analog_io_1_padres));
 sg13g2_IOPadIn sg13g2_IOPad_io_clock (.p2c(io_clock_p2c),
    .pad(io_clock_PAD));
 sg13g2_IOPadIn sg13g2_IOPad_io_reset (.p2c(io_reset_p2c),
    .pad(io_reset_PAD));
 sg13g2_Corner IO_CORNER_NORTH_WEST_INST ();
 sg13g2_Corner IO_CORNER_NORTH_EAST_INST ();
 sg13g2_Corner IO_CORNER_SOUTH_WEST_INST ();
 sg13g2_Corner IO_CORNER_SOUTH_EAST_INST ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_0_0 ();
 sg13g2_Filler1000 IO_FILL_IO_NORTH_0_20 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_0_25 ();
 sg13g2_Filler200 IO_FILL_IO_NORTH_0_27 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_1_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_1_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_2_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_2_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_3_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_3_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_4_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_4_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_5_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_5_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_6_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_6_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_7_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_7_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_8_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_8_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_9_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_9_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_10_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_10_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_11_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_11_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_12_0 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_12_20 ();
 sg13g2_Filler4000 IO_FILL_IO_NORTH_13_0 ();
 sg13g2_Filler1000 IO_FILL_IO_NORTH_13_20 ();
 sg13g2_Filler400 IO_FILL_IO_NORTH_13_25 ();
 sg13g2_Filler200 IO_FILL_IO_NORTH_13_27 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_0_0 ();
 sg13g2_Filler1000 IO_FILL_IO_SOUTH_0_20 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_0_25 ();
 sg13g2_Filler200 IO_FILL_IO_SOUTH_0_27 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_1_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_1_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_2_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_2_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_3_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_3_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_4_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_4_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_5_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_5_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_6_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_6_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_7_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_7_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_8_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_8_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_9_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_9_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_10_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_10_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_11_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_11_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_12_0 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_12_20 ();
 sg13g2_Filler4000 IO_FILL_IO_SOUTH_13_0 ();
 sg13g2_Filler1000 IO_FILL_IO_SOUTH_13_20 ();
 sg13g2_Filler400 IO_FILL_IO_SOUTH_13_25 ();
 sg13g2_Filler200 IO_FILL_IO_SOUTH_13_27 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_0_0 ();
 sg13g2_Filler1000 IO_FILL_IO_WEST_0_20 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_0_25 ();
 sg13g2_Filler200 IO_FILL_IO_WEST_0_27 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_1_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_1_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_2_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_2_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_3_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_3_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_4_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_4_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_5_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_5_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_6_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_6_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_7_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_7_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_8_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_8_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_9_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_9_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_10_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_10_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_11_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_11_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_12_0 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_12_20 ();
 sg13g2_Filler4000 IO_FILL_IO_WEST_13_0 ();
 sg13g2_Filler1000 IO_FILL_IO_WEST_13_20 ();
 sg13g2_Filler400 IO_FILL_IO_WEST_13_25 ();
 sg13g2_Filler200 IO_FILL_IO_WEST_13_27 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_0_0 ();
 sg13g2_Filler1000 IO_FILL_IO_EAST_0_20 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_0_25 ();
 sg13g2_Filler200 IO_FILL_IO_EAST_0_27 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_1_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_1_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_2_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_2_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_3_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_3_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_4_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_4_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_5_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_5_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_6_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_6_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_7_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_7_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_8_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_8_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_9_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_9_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_10_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_10_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_11_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_11_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_12_0 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_12_20 ();
 sg13g2_Filler4000 IO_FILL_IO_EAST_13_0 ();
 sg13g2_Filler1000 IO_FILL_IO_EAST_13_20 ();
 sg13g2_Filler400 IO_FILL_IO_EAST_13_25 ();
 sg13g2_Filler200 IO_FILL_IO_EAST_13_27 ();
 bondpad_70x70 IO_BOND_sg13g2_IOPadVdd_south (.pad(VDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVss_south (.pad(VSS));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[9].ui  (.pad(ui_PAD[9]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[10].ui  (.pad(ui_PAD[10]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[11].ui  (.pad(ui_PAD[11]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[12].ui  (.pad(ui_PAD[12]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[13].ui  (.pad(ui_PAD[13]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[14].ui  (.pad(ui_PAD[14]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[15].ui  (.pad(ui_PAD[15]));
 bondpad_70x70 IO_BOND_sg13g2_IOPad_analog_io_0 (.pad(analog_io_0));
 bondpad_70x70 IO_BOND_sg13g2_IOPad_io_clock (.pad(io_clock_PAD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVdd_south (.pad(IOVDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVss_south (.pad(IOVSS));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVdd_east (.pad(VDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVss_east (.pad(VSS));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[0].uo  (.pad(uo_PAD[0]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[1].uo  (.pad(uo_PAD[1]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[2].uo  (.pad(uo_PAD[2]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[3].uo  (.pad(uo_PAD[3]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[4].uo  (.pad(uo_PAD[4]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[5].uo  (.pad(uo_PAD[5]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[6].uo  (.pad(uo_PAD[6]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[7].uo  (.pad(uo_PAD[7]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[8].uo  (.pad(uo_PAD[8]));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVdd_east (.pad(IOVDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVss_east (.pad(IOVSS));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVdd_north (.pad(IOVDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVss_north (.pad(IOVSS));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[9].uo  (.pad(uo_PAD[9]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[10].uo  (.pad(uo_PAD[10]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[11].uo  (.pad(uo_PAD[11]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[12].uo  (.pad(uo_PAD[12]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[13].uo  (.pad(uo_PAD[13]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[14].uo  (.pad(uo_PAD[14]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadOut30mA_uo[15].uo  (.pad(uo_PAD[15]));
 bondpad_70x70 IO_BOND_sg13g2_IOPad_analog_io_1 (.pad(analog_io_1));
 bondpad_70x70 IO_BOND_sg13g2_IOPad_io_reset (.pad(io_reset_PAD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVdd_north (.pad(IOVDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVss_north (.pad(IOVSS));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVdd_west (.pad(VDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadVss_west (.pad(VSS));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[0].ui  (.pad(ui_PAD[0]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[1].ui  (.pad(ui_PAD[1]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[2].ui  (.pad(ui_PAD[2]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[3].ui  (.pad(ui_PAD[3]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[4].ui  (.pad(ui_PAD[4]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[5].ui  (.pad(ui_PAD[5]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[6].ui  (.pad(ui_PAD[6]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[7].ui  (.pad(ui_PAD[7]));
 bondpad_70x70 \IO_BOND_sg13g2_IOPadIn_ui[8].ui  (.pad(ui_PAD[8]));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVdd_west (.pad(IOVDD));
 bondpad_70x70 IO_BOND_sg13g2_IOPadIOVss_west (.pad(IOVSS));
endmodule
