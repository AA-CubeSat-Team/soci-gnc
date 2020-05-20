  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtP)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtP.fswParams
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% rtP.Normalization2_Bias
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.Normalization3_Bias
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.Normalization5_Bias
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtP.Normalization_Bias
	  section.data(4).logicalSrcIdx = 4;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtP.Normalization1_Bias
	  section.data(5).logicalSrcIdx = 5;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtP.Normalization4_Bias
	  section.data(6).logicalSrcIdx = 6;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtP.CompareToConstant_const
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 135;
      section.data(135)  = dumData; %prealloc
      
	  ;% rtP.Merge_InitialOutput
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.Constant_Value
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.Gain2_Gain
	  section.data(3).logicalSrcIdx = 10;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtP.Gain_Gain
	  section.data(4).logicalSrcIdx = 11;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtP.Gain1_Gain
	  section.data(5).logicalSrcIdx = 12;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtP.Gain_Gain_pi5uhcql0z
	  section.data(6).logicalSrcIdx = 13;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtP.Constant_Value_l5mn50z5cq
	  section.data(7).logicalSrcIdx = 14;
	  section.data(7).dtTransOffset = 6;
	
	  ;% rtP.Gain2_Gain_a5r1lslwra
	  section.data(8).logicalSrcIdx = 15;
	  section.data(8).dtTransOffset = 7;
	
	  ;% rtP.Gain1_Gain_fhzwrqpxwn
	  section.data(9).logicalSrcIdx = 16;
	  section.data(9).dtTransOffset = 8;
	
	  ;% rtP.Gain_Gain_lliryqv0lr
	  section.data(10).logicalSrcIdx = 17;
	  section.data(10).dtTransOffset = 9;
	
	  ;% rtP.Gain1_Gain_jqcyn3sr2w
	  section.data(11).logicalSrcIdx = 18;
	  section.data(11).dtTransOffset = 10;
	
	  ;% rtP.Constant_Value_lrvooetugt
	  section.data(12).logicalSrcIdx = 19;
	  section.data(12).dtTransOffset = 11;
	
	  ;% rtP.Gain2_Gain_gplc4ydenu
	  section.data(13).logicalSrcIdx = 20;
	  section.data(13).dtTransOffset = 12;
	
	  ;% rtP.Constant_Value_c5k4awpww5
	  section.data(14).logicalSrcIdx = 21;
	  section.data(14).dtTransOffset = 13;
	
	  ;% rtP.Gain2_Gain_lxqqvcp1dv
	  section.data(15).logicalSrcIdx = 22;
	  section.data(15).dtTransOffset = 14;
	
	  ;% rtP.Gain_Gain_igquidva0x
	  section.data(16).logicalSrcIdx = 23;
	  section.data(16).dtTransOffset = 15;
	
	  ;% rtP.Gain1_Gain_gutlcr5n0l
	  section.data(17).logicalSrcIdx = 24;
	  section.data(17).dtTransOffset = 16;
	
	  ;% rtP.Gain_Gain_ivgqmscmom
	  section.data(18).logicalSrcIdx = 25;
	  section.data(18).dtTransOffset = 17;
	
	  ;% rtP.Constant_Value_ecblqlsacg
	  section.data(19).logicalSrcIdx = 26;
	  section.data(19).dtTransOffset = 18;
	
	  ;% rtP.Gain2_Gain_a5mzwuqcxa
	  section.data(20).logicalSrcIdx = 27;
	  section.data(20).dtTransOffset = 19;
	
	  ;% rtP.Gain1_Gain_erhzz1d1jc
	  section.data(21).logicalSrcIdx = 28;
	  section.data(21).dtTransOffset = 20;
	
	  ;% rtP.Gain_Gain_m4fytnehbd
	  section.data(22).logicalSrcIdx = 29;
	  section.data(22).dtTransOffset = 21;
	
	  ;% rtP.Gain1_Gain_nlppff24em
	  section.data(23).logicalSrcIdx = 30;
	  section.data(23).dtTransOffset = 22;
	
	  ;% rtP.Constant_Value_iqmtoqh2vp
	  section.data(24).logicalSrcIdx = 31;
	  section.data(24).dtTransOffset = 23;
	
	  ;% rtP.Gain2_Gain_dnlg4rbf3l
	  section.data(25).logicalSrcIdx = 32;
	  section.data(25).dtTransOffset = 24;
	
	  ;% rtP.Constant1_Value
	  section.data(26).logicalSrcIdx = 33;
	  section.data(26).dtTransOffset = 25;
	
	  ;% rtP.Gain3_Gain
	  section.data(27).logicalSrcIdx = 34;
	  section.data(27).dtTransOffset = 26;
	
	  ;% rtP.Gain4_Gain
	  section.data(28).logicalSrcIdx = 35;
	  section.data(28).dtTransOffset = 27;
	
	  ;% rtP.Constant2_Value
	  section.data(29).logicalSrcIdx = 36;
	  section.data(29).dtTransOffset = 28;
	
	  ;% rtP.Gain1_Gain_eay2spzcgy
	  section.data(30).logicalSrcIdx = 37;
	  section.data(30).dtTransOffset = 29;
	
	  ;% rtP.Constant3_Value
	  section.data(31).logicalSrcIdx = 38;
	  section.data(31).dtTransOffset = 30;
	
	  ;% rtP.Constant1_Value_gywsazy05k
	  section.data(32).logicalSrcIdx = 39;
	  section.data(32).dtTransOffset = 31;
	
	  ;% rtP.Gain3_Gain_ebexp5cpru
	  section.data(33).logicalSrcIdx = 40;
	  section.data(33).dtTransOffset = 32;
	
	  ;% rtP.Gain4_Gain_jsw1usbw51
	  section.data(34).logicalSrcIdx = 41;
	  section.data(34).dtTransOffset = 33;
	
	  ;% rtP.Constant2_Value_ht5ssv34ga
	  section.data(35).logicalSrcIdx = 42;
	  section.data(35).dtTransOffset = 34;
	
	  ;% rtP.Gain1_Gain_hinlh1vqa3
	  section.data(36).logicalSrcIdx = 43;
	  section.data(36).dtTransOffset = 35;
	
	  ;% rtP.Constant3_Value_ftknmtr0cr
	  section.data(37).logicalSrcIdx = 44;
	  section.data(37).dtTransOffset = 36;
	
	  ;% rtP.Constant2_Value_i4dkrdfott
	  section.data(38).logicalSrcIdx = 45;
	  section.data(38).dtTransOffset = 37;
	
	  ;% rtP.Constant1_Value_c2dxafuacz
	  section.data(39).logicalSrcIdx = 46;
	  section.data(39).dtTransOffset = 46;
	
	  ;% rtP.Gain_Gain_d2ee5bjups
	  section.data(40).logicalSrcIdx = 47;
	  section.data(40).dtTransOffset = 55;
	
	  ;% rtP.Gain1_Gain_gukw2z34vg
	  section.data(41).logicalSrcIdx = 48;
	  section.data(41).dtTransOffset = 56;
	
	  ;% rtP.Gain2_Gain_fd1hdrny0i
	  section.data(42).logicalSrcIdx = 49;
	  section.data(42).dtTransOffset = 57;
	
	  ;% rtP.Gain3_Gain_df4fissmij
	  section.data(43).logicalSrcIdx = 50;
	  section.data(43).dtTransOffset = 58;
	
	  ;% rtP.Gain4_Gain_jqdgqgtsq5
	  section.data(44).logicalSrcIdx = 51;
	  section.data(44).dtTransOffset = 59;
	
	  ;% rtP.Gain5_Gain
	  section.data(45).logicalSrcIdx = 52;
	  section.data(45).dtTransOffset = 60;
	
	  ;% rtP.Gain6_Gain
	  section.data(46).logicalSrcIdx = 53;
	  section.data(46).dtTransOffset = 61;
	
	  ;% rtP.Constant_Value_hteor4a5kn
	  section.data(47).logicalSrcIdx = 54;
	  section.data(47).dtTransOffset = 62;
	
	  ;% rtP.Constant1_Value_buy3qqwwhi
	  section.data(48).logicalSrcIdx = 55;
	  section.data(48).dtTransOffset = 63;
	
	  ;% rtP.Constant2_Value_lzwp0qxwab
	  section.data(49).logicalSrcIdx = 56;
	  section.data(49).dtTransOffset = 64;
	
	  ;% rtP.Constant_Value_adgfdn1zan
	  section.data(50).logicalSrcIdx = 57;
	  section.data(50).dtTransOffset = 65;
	
	  ;% rtP.AngularVelo_Y0
	  section.data(51).logicalSrcIdx = 58;
	  section.data(51).dtTransOffset = 66;
	
	  ;% rtP.uSigmaBounds_Y0
	  section.data(52).logicalSrcIdx = 59;
	  section.data(52).dtTransOffset = 67;
	
	  ;% rtP.flag_out_Y0
	  section.data(53).logicalSrcIdx = 60;
	  section.data(53).dtTransOffset = 68;
	
	  ;% rtP.UnitDelay2_InitialCondition
	  section.data(54).logicalSrcIdx = 61;
	  section.data(54).dtTransOffset = 69;
	
	  ;% rtP.UnitDelay2_InitialCondition_e5yh3e2aq2
	  section.data(55).logicalSrcIdx = 62;
	  section.data(55).dtTransOffset = 70;
	
	  ;% rtP.q_plusmerge_InitialOutput
	  section.data(56).logicalSrcIdx = 63;
	  section.data(56).dtTransOffset = 74;
	
	  ;% rtP.Constant1_Value_jmutz103sv
	  section.data(57).logicalSrcIdx = 64;
	  section.data(57).dtTransOffset = 75;
	
	  ;% rtP.BiasMerge_InitialOutput
	  section.data(58).logicalSrcIdx = 65;
	  section.data(58).dtTransOffset = 76;
	
	  ;% rtP.Constant_Value_jdndcrmtkc
	  section.data(59).logicalSrcIdx = 66;
	  section.data(59).dtTransOffset = 77;
	
	  ;% rtP.P_plusmerge_InitialOutput
	  section.data(60).logicalSrcIdx = 67;
	  section.data(60).dtTransOffset = 80;
	
	  ;% rtP.SwitchesdependingonifGyroisoffline_Threshold
	  section.data(61).logicalSrcIdx = 68;
	  section.data(61).dtTransOffset = 81;
	
	  ;% rtP.Constant1_Value_h0nyb23dyo
	  section.data(62).logicalSrcIdx = 69;
	  section.data(62).dtTransOffset = 82;
	
	  ;% rtP.Gain_Gain_izh1wtguao
	  section.data(63).logicalSrcIdx = 70;
	  section.data(63).dtTransOffset = 83;
	
	  ;% rtP.Gain3_Gain_l235frcyp2
	  section.data(64).logicalSrcIdx = 71;
	  section.data(64).dtTransOffset = 84;
	
	  ;% rtP.Constant2_Value_enlht0un1m
	  section.data(65).logicalSrcIdx = 72;
	  section.data(65).dtTransOffset = 85;
	
	  ;% rtP.Gain1_Gain_nitzlnqw2a
	  section.data(66).logicalSrcIdx = 73;
	  section.data(66).dtTransOffset = 86;
	
	  ;% rtP.Constant3_Value_guvepryqpw
	  section.data(67).logicalSrcIdx = 74;
	  section.data(67).dtTransOffset = 87;
	
	  ;% rtP.Constant1_Value_f35hg154j0
	  section.data(68).logicalSrcIdx = 75;
	  section.data(68).dtTransOffset = 88;
	
	  ;% rtP.Constant2_Value_e5s0xhvsmx
	  section.data(69).logicalSrcIdx = 76;
	  section.data(69).dtTransOffset = 89;
	
	  ;% rtP.Constant3_Value_b5l2r3ghc5
	  section.data(70).logicalSrcIdx = 77;
	  section.data(70).dtTransOffset = 90;
	
	  ;% rtP.Gain_Gain_ddqwqhx5tx
	  section.data(71).logicalSrcIdx = 78;
	  section.data(71).dtTransOffset = 91;
	
	  ;% rtP.Gain1_Gain_ly5pvjnqag
	  section.data(72).logicalSrcIdx = 79;
	  section.data(72).dtTransOffset = 92;
	
	  ;% rtP.Gain3_Gain_enevc5eimy
	  section.data(73).logicalSrcIdx = 80;
	  section.data(73).dtTransOffset = 93;
	
	  ;% rtP.Constant_Value_ib2ewpsxpl
	  section.data(74).logicalSrcIdx = 81;
	  section.data(74).dtTransOffset = 94;
	
	  ;% rtP.Gain_Gain_mumivssi3t
	  section.data(75).logicalSrcIdx = 82;
	  section.data(75).dtTransOffset = 95;
	
	  ;% rtP.Constant_Value_gxmqunm0u0
	  section.data(76).logicalSrcIdx = 83;
	  section.data(76).dtTransOffset = 96;
	
	  ;% rtP.Constant1_Value_kpkyenjwdq
	  section.data(77).logicalSrcIdx = 84;
	  section.data(77).dtTransOffset = 99;
	
	  ;% rtP.RandomNumber_Mean
	  section.data(78).logicalSrcIdx = 85;
	  section.data(78).dtTransOffset = 102;
	
	  ;% rtP.RandomNumber_StdDev
	  section.data(79).logicalSrcIdx = 86;
	  section.data(79).dtTransOffset = 103;
	
	  ;% rtP.RandomNumber_Seed
	  section.data(80).logicalSrcIdx = 87;
	  section.data(80).dtTransOffset = 106;
	
	  ;% rtP.Constant2_Value_chs5tmnkek
	  section.data(81).logicalSrcIdx = 88;
	  section.data(81).dtTransOffset = 107;
	
	  ;% rtP.DiscreteTimeIntegrator_gainval
	  section.data(82).logicalSrcIdx = 89;
	  section.data(82).dtTransOffset = 110;
	
	  ;% rtP.DiscreteTimeIntegrator_IC
	  section.data(83).logicalSrcIdx = 90;
	  section.data(83).dtTransOffset = 111;
	
	  ;% rtP.Constant_Value_otz3nmwoqv
	  section.data(84).logicalSrcIdx = 91;
	  section.data(84).dtTransOffset = 115;
	
	  ;% rtP.Gain2_Gain_cnsd3b5ouu
	  section.data(85).logicalSrcIdx = 92;
	  section.data(85).dtTransOffset = 116;
	
	  ;% rtP.Gain_Gain_klyu41lrfn
	  section.data(86).logicalSrcIdx = 93;
	  section.data(86).dtTransOffset = 117;
	
	  ;% rtP.Gain1_Gain_diuflnffrx
	  section.data(87).logicalSrcIdx = 94;
	  section.data(87).dtTransOffset = 118;
	
	  ;% rtP.Gain_Gain_jhze2kqkab
	  section.data(88).logicalSrcIdx = 95;
	  section.data(88).dtTransOffset = 119;
	
	  ;% rtP.Constant_Value_gztnxshksk
	  section.data(89).logicalSrcIdx = 96;
	  section.data(89).dtTransOffset = 120;
	
	  ;% rtP.Gain2_Gain_no1j2ourve
	  section.data(90).logicalSrcIdx = 97;
	  section.data(90).dtTransOffset = 121;
	
	  ;% rtP.Gain1_Gain_mcq3nfgl5y
	  section.data(91).logicalSrcIdx = 98;
	  section.data(91).dtTransOffset = 122;
	
	  ;% rtP.Gain_Gain_d3m0eipbk4
	  section.data(92).logicalSrcIdx = 99;
	  section.data(92).dtTransOffset = 123;
	
	  ;% rtP.Gain1_Gain_eukkukzdsc
	  section.data(93).logicalSrcIdx = 100;
	  section.data(93).dtTransOffset = 124;
	
	  ;% rtP.Constant_Value_jc32hza5ok
	  section.data(94).logicalSrcIdx = 101;
	  section.data(94).dtTransOffset = 125;
	
	  ;% rtP.Gain2_Gain_aqxl3lkkkb
	  section.data(95).logicalSrcIdx = 102;
	  section.data(95).dtTransOffset = 126;
	
	  ;% rtP.RandomNumber1_Mean
	  section.data(96).logicalSrcIdx = 103;
	  section.data(96).dtTransOffset = 127;
	
	  ;% rtP.RandomNumber1_StdDev
	  section.data(97).logicalSrcIdx = 104;
	  section.data(97).dtTransOffset = 128;
	
	  ;% rtP.RandomNumber1_Seed
	  section.data(98).logicalSrcIdx = 105;
	  section.data(98).dtTransOffset = 131;
	
	  ;% rtP.Constant3_Value_b1f4zjlmmk
	  section.data(99).logicalSrcIdx = 106;
	  section.data(99).dtTransOffset = 132;
	
	  ;% rtP.Constant_Value_ong43hwtad
	  section.data(100).logicalSrcIdx = 107;
	  section.data(100).dtTransOffset = 135;
	
	  ;% rtP.Gain2_Gain_eugrs2j5w1
	  section.data(101).logicalSrcIdx = 108;
	  section.data(101).dtTransOffset = 136;
	
	  ;% rtP.Gain_Gain_chibgsrp3r
	  section.data(102).logicalSrcIdx = 109;
	  section.data(102).dtTransOffset = 137;
	
	  ;% rtP.Gain1_Gain_iwfebhm2do
	  section.data(103).logicalSrcIdx = 110;
	  section.data(103).dtTransOffset = 138;
	
	  ;% rtP.Gain_Gain_ag0mpz4kyf
	  section.data(104).logicalSrcIdx = 111;
	  section.data(104).dtTransOffset = 139;
	
	  ;% rtP.Constant_Value_hf4lqdwccu
	  section.data(105).logicalSrcIdx = 112;
	  section.data(105).dtTransOffset = 140;
	
	  ;% rtP.Gain2_Gain_pdua0qf4rh
	  section.data(106).logicalSrcIdx = 113;
	  section.data(106).dtTransOffset = 141;
	
	  ;% rtP.Gain1_Gain_denqfwp1iw
	  section.data(107).logicalSrcIdx = 114;
	  section.data(107).dtTransOffset = 142;
	
	  ;% rtP.Gain_Gain_iiknapd0gg
	  section.data(108).logicalSrcIdx = 115;
	  section.data(108).dtTransOffset = 143;
	
	  ;% rtP.Gain1_Gain_hi2t442oxb
	  section.data(109).logicalSrcIdx = 116;
	  section.data(109).dtTransOffset = 144;
	
	  ;% rtP.Constant_Value_imftmnjmib
	  section.data(110).logicalSrcIdx = 117;
	  section.data(110).dtTransOffset = 145;
	
	  ;% rtP.Gain2_Gain_k4jcurr4zm
	  section.data(111).logicalSrcIdx = 118;
	  section.data(111).dtTransOffset = 146;
	
	  ;% rtP.Constant4_Value
	  section.data(112).logicalSrcIdx = 119;
	  section.data(112).dtTransOffset = 147;
	
	  ;% rtP.Constant6_Value
	  section.data(113).logicalSrcIdx = 120;
	  section.data(113).dtTransOffset = 150;
	
	  ;% rtP.Constant7_Value
	  section.data(114).logicalSrcIdx = 121;
	  section.data(114).dtTransOffset = 151;
	
	  ;% rtP.Constant10_Value
	  section.data(115).logicalSrcIdx = 122;
	  section.data(115).dtTransOffset = 152;
	
	  ;% rtP.Constant5_Value
	  section.data(116).logicalSrcIdx = 123;
	  section.data(116).dtTransOffset = 153;
	
	  ;% rtP.Constant9_Value
	  section.data(117).logicalSrcIdx = 124;
	  section.data(117).dtTransOffset = 154;
	
	  ;% rtP.Gain3_Gain_g31whpxaxh
	  section.data(118).logicalSrcIdx = 125;
	  section.data(118).dtTransOffset = 155;
	
	  ;% rtP.Gain1_Gain_dwko2h5myg
	  section.data(119).logicalSrcIdx = 126;
	  section.data(119).dtTransOffset = 156;
	
	  ;% rtP.Gain_Gain_efmbe4yoj3
	  section.data(120).logicalSrcIdx = 127;
	  section.data(120).dtTransOffset = 157;
	
	  ;% rtP.Gain2_Gain_dndn2znysv
	  section.data(121).logicalSrcIdx = 128;
	  section.data(121).dtTransOffset = 158;
	
	  ;% rtP.Constant8_Value
	  section.data(122).logicalSrcIdx = 129;
	  section.data(122).dtTransOffset = 159;
	
	  ;% rtP.Constant_Value_e04ikljkmv
	  section.data(123).logicalSrcIdx = 130;
	  section.data(123).dtTransOffset = 162;
	
	  ;% rtP.Gain2_Gain_op03fmkcim
	  section.data(124).logicalSrcIdx = 131;
	  section.data(124).dtTransOffset = 163;
	
	  ;% rtP.Gain_Gain_bhwu5bylct
	  section.data(125).logicalSrcIdx = 132;
	  section.data(125).dtTransOffset = 164;
	
	  ;% rtP.Gain1_Gain_ppz2nua2un
	  section.data(126).logicalSrcIdx = 133;
	  section.data(126).dtTransOffset = 165;
	
	  ;% rtP.Gain_Gain_ovw33ojfgh
	  section.data(127).logicalSrcIdx = 134;
	  section.data(127).dtTransOffset = 166;
	
	  ;% rtP.Constant_Value_b41hk0kxkh
	  section.data(128).logicalSrcIdx = 135;
	  section.data(128).dtTransOffset = 167;
	
	  ;% rtP.Gain2_Gain_flvppo5uo3
	  section.data(129).logicalSrcIdx = 136;
	  section.data(129).dtTransOffset = 168;
	
	  ;% rtP.Gain1_Gain_dsq2lkmbcs
	  section.data(130).logicalSrcIdx = 137;
	  section.data(130).dtTransOffset = 169;
	
	  ;% rtP.Gain_Gain_irsqnwliiv
	  section.data(131).logicalSrcIdx = 138;
	  section.data(131).dtTransOffset = 170;
	
	  ;% rtP.Gain1_Gain_jwm5cb1c12
	  section.data(132).logicalSrcIdx = 139;
	  section.data(132).dtTransOffset = 171;
	
	  ;% rtP.Constant_Value_oc2s014i34
	  section.data(133).logicalSrcIdx = 140;
	  section.data(133).dtTransOffset = 172;
	
	  ;% rtP.Gain2_Gain_if0kcnigpw
	  section.data(134).logicalSrcIdx = 141;
	  section.data(134).dtTransOffset = 173;
	
	  ;% rtP.Gain1_Gain_mgka3jhv0b
	  section.data(135).logicalSrcIdx = 142;
	  section.data(135).dtTransOffset = 174;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtP.Memory_InitialCondition
	  section.data(1).logicalSrcIdx = 143;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtB)
    ;%
      section.nData     = 42;
      section.data(42)  = dumData; %prealloc
      
	  ;% rtB.evb2ami2f5
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.l33vh4jdca
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.dejmsjiytm
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtB.bzlumtv1jw
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtB.h1pvfyoead
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtB.k3ubjuj4xo
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtB.bwa10aik04
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% rtB.jzkvyvyuee
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% rtB.ohsor4jyhe
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 10;
	
	  ;% rtB.fd5wmraa51
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 11;
	
	  ;% rtB.kehzuzhs35
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 12;
	
	  ;% rtB.lhspd1b5b3
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 13;
	
	  ;% rtB.b3z40kptxq
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 16;
	
	  ;% rtB.hlzyk2zeiu
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 17;
	
	  ;% rtB.jnsdiecjvo
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 18;
	
	  ;% rtB.dmo32unafg
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 19;
	
	  ;% rtB.dgj40kd3c4
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 20;
	
	  ;% rtB.ifm2ensjiv
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 24;
	
	  ;% rtB.cuhw0sczh3
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 25;
	
	  ;% rtB.gz2mbgxqth
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 26;
	
	  ;% rtB.ps1qixq3zf
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 27;
	
	  ;% rtB.fj45fplo2h
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 28;
	
	  ;% rtB.i0j31orab3
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 29;
	
	  ;% rtB.fzubazngl3
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 30;
	
	  ;% rtB.gbtlnwgalm
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 31;
	
	  ;% rtB.mxfdp2ltan
	  section.data(26).logicalSrcIdx = 26;
	  section.data(26).dtTransOffset = 35;
	
	  ;% rtB.k3ljcleoid
	  section.data(27).logicalSrcIdx = 27;
	  section.data(27).dtTransOffset = 39;
	
	  ;% rtB.obpruepjlb
	  section.data(28).logicalSrcIdx = 28;
	  section.data(28).dtTransOffset = 43;
	
	  ;% rtB.nt5aet3d3s
	  section.data(29).logicalSrcIdx = 29;
	  section.data(29).dtTransOffset = 47;
	
	  ;% rtB.mqrllrhknp
	  section.data(30).logicalSrcIdx = 30;
	  section.data(30).dtTransOffset = 50;
	
	  ;% rtB.es152orfgm
	  section.data(31).logicalSrcIdx = 31;
	  section.data(31).dtTransOffset = 86;
	
	  ;% rtB.chwubaiywm
	  section.data(32).logicalSrcIdx = 32;
	  section.data(32).dtTransOffset = 89;
	
	  ;% rtB.ida2tctgp2
	  section.data(33).logicalSrcIdx = 33;
	  section.data(33).dtTransOffset = 92;
	
	  ;% rtB.epk34rzqnu
	  section.data(34).logicalSrcIdx = 34;
	  section.data(34).dtTransOffset = 128;
	
	  ;% rtB.ee30l0u33u
	  section.data(35).logicalSrcIdx = 35;
	  section.data(35).dtTransOffset = 137;
	
	  ;% rtB.i1fwhqeosf
	  section.data(36).logicalSrcIdx = 36;
	  section.data(36).dtTransOffset = 138;
	
	  ;% rtB.fzvlmbe2x0
	  section.data(37).logicalSrcIdx = 37;
	  section.data(37).dtTransOffset = 139;
	
	  ;% rtB.mh2krcrgw3
	  section.data(38).logicalSrcIdx = 38;
	  section.data(38).dtTransOffset = 140;
	
	  ;% rtB.c1klcpas2f
	  section.data(39).logicalSrcIdx = 39;
	  section.data(39).dtTransOffset = 141;
	
	  ;% rtB.edjk3wh4gd
	  section.data(40).logicalSrcIdx = 40;
	  section.data(40).dtTransOffset = 142;
	
	  ;% rtB.loo5xvtgsh
	  section.data(41).logicalSrcIdx = 41;
	  section.data(41).dtTransOffset = 160;
	
	  ;% rtB.igtrb0xxov
	  section.data(42).logicalSrcIdx = 42;
	  section.data(42).dtTransOffset = 164;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% rtB.p0unimm1k0
	  section.data(1).logicalSrcIdx = 43;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.dlusutdiez
	  section.data(2).logicalSrcIdx = 44;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.of1r505p3n
	  section.data(3).logicalSrcIdx = 45;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtDW)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% rtDW.eo2izelnsp
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.ic3jrlr0jz
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 4;
	
	  ;% rtDW.jr51z3zb5d
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 5;
	
	  ;% rtDW.ismukjvadj
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 9;
	
	  ;% rtDW.lq50dyklp4
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 45;
	
	  ;% rtDW.fa0uzeqpit
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 48;
	
	  ;% rtDW.hmtmt5gwtt
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 52;
	
	  ;% rtDW.jk5uei3ei4
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 55;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 22;
      section.data(22)  = dumData; %prealloc
      
	  ;% rtDW.ckpfh3kyyy.LoggedData
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.nswqmnl2rr.LoggedData
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 4;
	
	  ;% rtDW.mlxpoqjkwx.LoggedData
	  section.data(3).logicalSrcIdx = 10;
	  section.data(3).dtTransOffset = 8;
	
	  ;% rtDW.jq3woon32o.LoggedData
	  section.data(4).logicalSrcIdx = 11;
	  section.data(4).dtTransOffset = 10;
	
	  ;% rtDW.oa3iy3mn5r.LoggedData
	  section.data(5).logicalSrcIdx = 12;
	  section.data(5).dtTransOffset = 11;
	
	  ;% rtDW.abdpz0fqfb.LoggedData
	  section.data(6).logicalSrcIdx = 13;
	  section.data(6).dtTransOffset = 13;
	
	  ;% rtDW.c1nk03yorp.LoggedData
	  section.data(7).logicalSrcIdx = 14;
	  section.data(7).dtTransOffset = 14;
	
	  ;% rtDW.hr4v0t5lss.LoggedData
	  section.data(8).logicalSrcIdx = 15;
	  section.data(8).dtTransOffset = 15;
	
	  ;% rtDW.mxhe5vgezu.LoggedData
	  section.data(9).logicalSrcIdx = 16;
	  section.data(9).dtTransOffset = 16;
	
	  ;% rtDW.nqwzk20w5b.LoggedData
	  section.data(10).logicalSrcIdx = 17;
	  section.data(10).dtTransOffset = 19;
	
	  ;% rtDW.dfovtl4aod.LoggedData
	  section.data(11).logicalSrcIdx = 18;
	  section.data(11).dtTransOffset = 22;
	
	  ;% rtDW.jkdospy4g4.LoggedData
	  section.data(12).logicalSrcIdx = 19;
	  section.data(12).dtTransOffset = 23;
	
	  ;% rtDW.kventh31jz.LoggedData
	  section.data(13).logicalSrcIdx = 20;
	  section.data(13).dtTransOffset = 24;
	
	  ;% rtDW.ovtumj1mmt.LoggedData
	  section.data(14).logicalSrcIdx = 21;
	  section.data(14).dtTransOffset = 27;
	
	  ;% rtDW.jusku22gak.LoggedData
	  section.data(15).logicalSrcIdx = 22;
	  section.data(15).dtTransOffset = 28;
	
	  ;% rtDW.daqvko5rwj.LoggedData
	  section.data(16).logicalSrcIdx = 23;
	  section.data(16).dtTransOffset = 31;
	
	  ;% rtDW.av12353yoh.LoggedData
	  section.data(17).logicalSrcIdx = 24;
	  section.data(17).dtTransOffset = 34;
	
	  ;% rtDW.ldey3dgpc3.LoggedData
	  section.data(18).logicalSrcIdx = 25;
	  section.data(18).dtTransOffset = 37;
	
	  ;% rtDW.mxeldapvtc.LoggedData
	  section.data(19).logicalSrcIdx = 26;
	  section.data(19).dtTransOffset = 38;
	
	  ;% rtDW.imtm502gug.LoggedData
	  section.data(20).logicalSrcIdx = 27;
	  section.data(20).dtTransOffset = 39;
	
	  ;% rtDW.egdg3y2mmu.LoggedData
	  section.data(21).logicalSrcIdx = 28;
	  section.data(21).dtTransOffset = 42;
	
	  ;% rtDW.kkzeps2143.LoggedData
	  section.data(22).logicalSrcIdx = 29;
	  section.data(22).dtTransOffset = 43;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% rtDW.owi0qnn13s
	  section.data(1).logicalSrcIdx = 30;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.nn2tfrewz5
	  section.data(2).logicalSrcIdx = 31;
	  section.data(2).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 10;
      section.data(10)  = dumData; %prealloc
      
	  ;% rtDW.hsldxkjyqe
	  section.data(1).logicalSrcIdx = 32;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.ek3tkvtgck
	  section.data(2).logicalSrcIdx = 33;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDW.be2p4vgwja
	  section.data(3).logicalSrcIdx = 34;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtDW.f44n4zoqaq
	  section.data(4).logicalSrcIdx = 35;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtDW.pacgymw5aw
	  section.data(5).logicalSrcIdx = 36;
	  section.data(5).dtTransOffset = 4;
	
	  ;% rtDW.itbgldrtmn
	  section.data(6).logicalSrcIdx = 37;
	  section.data(6).dtTransOffset = 5;
	
	  ;% rtDW.eoo2421vkh
	  section.data(7).logicalSrcIdx = 38;
	  section.data(7).dtTransOffset = 6;
	
	  ;% rtDW.l023zsos0w
	  section.data(8).logicalSrcIdx = 39;
	  section.data(8).dtTransOffset = 7;
	
	  ;% rtDW.bpgaewctmf
	  section.data(9).logicalSrcIdx = 40;
	  section.data(9).dtTransOffset = 8;
	
	  ;% rtDW.d55jaht4oo
	  section.data(10).logicalSrcIdx = 41;
	  section.data(10).dtTransOffset = 9;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% rtDW.gdylcuu45e
	  section.data(1).logicalSrcIdx = 42;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.ilthyfodyf
	  section.data(2).logicalSrcIdx = 43;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 2311783776;
  targMap.checksum1 = 2513219590;
  targMap.checksum2 = 126627232;
  targMap.checksum3 = 2807901779;

