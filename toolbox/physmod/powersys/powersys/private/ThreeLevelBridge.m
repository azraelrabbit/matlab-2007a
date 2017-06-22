function [BlockCount, sps, Multimeter, Yu, dcvf, NewNode] = ThreeLevelBridge(nl, block, sps, Multimeter, Yu, dcvf, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    SPSVerifyLinkStatus(block);
    DeviceIndice = 6.0;
    BlockName = getfullname(block);
    BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
    % 13 14
    NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Three-Level Bridge');
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    mesurerequest = get_param(block, 'Measurements');
    AllCurrents = strcmp(mesurerequest, 'All device currents');
    AllVoltages = strcmp(mesurerequest, 'Phase-to-Neutral and DC voltages');
    AllVoltCurr = strcmp(mesurerequest, 'All voltages and currents');
    % 23 25
    % 24 25
    [v1, Rs, Cs, DeviceType, Ron, ForwardVoltages] = getSPSmaskvalues(block, {'Arms','SnubberResistance','SbubberCapacitance','Device','Ron','ForwardVoltages'});
    arm1 = strcmp(get_param(block, 'Arms'), '1');
    arm2 = strcmp(get_param(block, 'Arms'), '2');
    arm3 = strcmp(get_param(block, 'Arms'), '3');
    if eq(Ron, 0.0)
        psberror(horzcat('The internal resistance (Ron) of the Three-Level Bridge named ''', block, ''' is set to zero . You need to specify Ron > 0.'), 'Parameter error');
    end % if
    Vfdevice = ForwardVoltages(1.0);
    Vfdiode = ForwardVoltages(2.0);
    if eq(DeviceType, 2.0)
        Vfdevice = 0.0;
        Vfdiode = 0.0;
    end % if
    bras = plus(plus(mtimes(arm1, 1.0), mtimes(arm2, 2.0)), mtimes(arm3, 3.0));
    NumberOfSwitches = plus(mtimes(4.0, bras), mtimes(2.0, bras));
    BlockCount = NumberOfSwitches;
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    nodes = nl.block_nodes(block);
    AA = nodes(1.0);
    BB = nodes(2.0);
    CC = nodes(3.0);
    POSI = nodes(4.0);
    NEUT = nodes(5.0);
    NEGA = nodes(6.0);
    % 58 60
    % 59 60
    AAPLUS = NewNode;
    BBPLUS = plus(NewNode, 1.0);
    CCPLUS = plus(NewNode, 2.0);
    AAMOIN = plus(NewNode, 3.0);
    BBMOIN = plus(NewNode, 4.0);
    CCMOIN = plus(NewNode, 5.0);
    NewNode = plus(NewNode, 6.0);
    % 67 69
    % 68 69
    if eq(Rs, Inf) || eq(Cs, 0.0)
    else
        % 71 72
        Css = Cs;
        if eq(Cs, Inf)
            Css = 0.0;
        end % if
        % 76 77
        sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, AAPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AAPLUS, AA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AA, AAMOIN, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AAMOIN, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(NEUT, AAPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AAMOIN, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
        % 78 86
        % 79 86
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
        % 85 86
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_4_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_5_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_6_arm_1: ', BlockNom);
        % 92 93
        if arm2 || arm3
            sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, BBPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BBPLUS, BB, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BB, BBMOIN, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BBMOIN, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(NEUT, BBPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BBMOIN, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
            % 95 103
            % 96 103
            % 97 103
            % 98 103
            % 99 103
            % 100 103
            % 101 103
            % 102 103
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_4_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_5_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_6_arm_2: ', BlockNom);
        end % if
        % 110 111
        if arm3
            sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, CCPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CCPLUS, CC, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CC, CCMOIN, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CCMOIN, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(NEUT, CCPLUS, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CCMOIN, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
            % 113 121
            % 114 121
            % 115 121
            % 116 121
            % 117 121
            % 118 121
            % 119 121
            % 120 121
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_4_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_5_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_6_arm_3: ', BlockNom);
        end % if
    end % if
    % 129 131
    % 130 131
    if Vfdevice || Vfdiode
        % 132 134
        % 133 134
        AAPLUSVF = NewNode;
        BBPLUSVF = plus(NewNode, 1.0);
        CCPLUSVF = plus(NewNode, 2.0);
        AAVF = plus(NewNode, 3.0);
        BBVF = plus(NewNode, 4.0);
        CCVF = plus(NewNode, 5.0);
        AAMOINVF = plus(NewNode, 6.0);
        BBMOINVF = plus(NewNode, 7.0);
        CCMOINVF = plus(NewNode, 8.0);
        NEGAAVF = plus(NewNode, 9.0);
        NEGABVF = plus(NewNode, 10.0);
        NEGACVF = plus(NewNode, 11.0);
        NEUTAAPLUSVF = plus(NewNode, 12.0);
        NEUTAAMOINVF = plus(NewNode, 13.0);
        NEUTBBPLUSVF = plus(NewNode, 14.0);
        NEUTBBMOINVF = plus(NewNode, 15.0);
        NEUTCCPLUSVF = plus(NewNode, 16.0);
        NEUTCCMOINVF = plus(NewNode, 17.0);
        NewNode = plus(NewNode, 18.0);
        % 153 154
        dcvf.source = vertcat(horzcat(dcvf.source), horzcat(AAPLUSVF, AAPLUS, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(AAVF, AA, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(AAMOINVF, AAMOIN, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEGAAVF, NEGA, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEUT, NEUTAAPLUSVF, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(AAMOIN, NEUTAAMOINVF, 0.0, Vfdevice, 0.0, 0.0, 21.0));
        % 155 163
        % 156 163
        % 157 163
        % 158 163
        % 159 163
        % 160 163
        % 161 163
        % 162 163
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_1: ', BlockNom);
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_2: ', BlockNom);
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_3: ', BlockNom);
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_4: ', BlockNom);
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_5: ', BlockNom);
        dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_6: ', BlockNom);
        dcvf.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
        % 170 171
        if arm2 || arm3
            % 172 173
            dcvf.source = vertcat(horzcat(dcvf.source), horzcat(BBPLUSVF, BBPLUS, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(BBVF, BB, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(BBMOINVF, BBMOIN, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEGABVF, NEGA, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEUT, NEUTBBPLUSVF, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(BBMOIN, NEUTBBMOINVF, 0.0, Vfdevice, 0.0, 0.0, 21.0));
            % 174 182
            % 175 182
            % 176 182
            % 177 182
            % 178 182
            % 179 182
            % 180 182
            % 181 182
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_7: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_8: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_9: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_10: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_11: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_12: ', BlockNom);
            dcvf.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
            % 189 190
        end % if
        % 191 192
        if arm3
            % 193 194
            dcvf.source = vertcat(horzcat(dcvf.source), horzcat(CCPLUSVF, CCPLUS, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(CCVF, CC, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(CCMOINVF, CCMOIN, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEGACVF, NEGA, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(NEUT, NEUTCCPLUSVF, 0.0, Vfdevice, 0.0, 0.0, 21.0), horzcat(CCMOIN, NEUTCCMOINVF, 0.0, Vfdevice, 0.0, 0.0, 21.0));
            % 195 203
            % 196 203
            % 197 203
            % 198 203
            % 199 203
            % 200 203
            % 201 203
            % 202 203
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_13: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_14: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_15: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_16: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_17: ', BlockNom);
            dcvf.srcstr{plus(end, 1.0)} = horzcat('U_Vf_18: ', BlockNom);
            dcvf.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
            % 210 211
        end % if
        % 212 214
        % 213 214
        sps.VF.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/VF'), 'GotoTag');
        sps.VF.Mux(plus(end, 1.0)) = NumberOfSwitches;
    else
        % 217 218
        AAPLUSVF = AAPLUS;
        BBPLUSVF = BBPLUS;
        CCPLUSVF = CCPLUS;
        AAVF = AA;
        BBVF = BB;
        CCVF = CC;
        AAMOINVF = AAMOIN;
        BBMOINVF = BBMOIN;
        CCMOINVF = CCMOIN;
        NEGAAVF = NEGA;
        NEGABVF = NEGA;
        NEGACVF = NEGA;
        NEUTAAPLUSVF = NEUT;
        NEUTAAMOINVF = AAMOIN;
        NEUTBBPLUSVF = NEUT;
        NEUTBBMOINVF = BBMOIN;
        NEUTCCPLUSVF = NEUT;
        NEUTCCMOINVF = CCMOIN;
    end % if
    % 237 239
    % 238 239
    sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, AAPLUSVF, 0.0, Ron, 0.0), horzcat(AAPLUS, AAVF, 0.0, Ron, 0.0), horzcat(AA, AAMOINVF, 0.0, Ron, 0.0), horzcat(AAMOIN, NEGAAVF, 0.0, Ron, 0.0), horzcat(NEUTAAPLUSVF, AAPLUS, 0.0, Ron, 0.0), horzcat(NEUTAAMOINVF, NEUT, 0.0, Ron, 0.0));
    % 240 248
    % 241 248
    % 242 248
    % 243 248
    % 244 248
    % 245 248
    % 246 248
    % 247 248
    sps.source = vertcat(horzcat(sps.source), horzcat(POSI, AAPLUSVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(AAPLUS, AAVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(AA, AAMOINVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(AAMOIN, NEGAAVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTAAPLUSVF, AAPLUS, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTAAMOINVF, NEUT, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
    % 249 257
    % 250 257
    % 251 257
    % 252 257
    % 253 257
    % 254 257
    % 255 257
    % 256 257
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_1: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_2: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_3: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_4: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_5: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_6: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_1: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_2: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_3: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_4: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_5: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_6: ', BlockNom);
    % 269 270
    Yu = vertcat(Yu, horzcat(POSI, AAPLUSVF), horzcat(AAPLUS, AAVF), horzcat(AA, AAMOINVF), horzcat(AAMOIN, NEGAAVF), horzcat(NEUTAAPLUSVF, AAPLUS), horzcat(NEUTAAMOINVF, NEUT));
    % 271 279
    % 272 279
    % 273 279
    % 274 279
    % 275 279
    % 276 279
    % 277 279
    % 278 279
    sps.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
    % 280 282
    % 281 282
    sps.SwitchType(plus(end, 1.0):plus(end, 6.0)) = [7.0 7.0 7.0 7.0 3.0 3.0];
    % 283 285
    % 284 285
    if AllCurrents || AllVoltCurr
        % 286 288
        % 287 288
        y = size(sps.source, 1.0);
        LengthI = length(Multimeter.I);
        for s=1.0:4.0
            Multimeter.I{plus(end, 1.0)} = horzcat('IQ', num2str(s), 'a: ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
            Multimeter.Q1Q4(plus(end, 1.0)) = plus(LengthI, s);
        end % for
        for s=1.0:4.0
            Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'a: ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
            Multimeter.D1D4(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
        end % for
        for s=5.0:6.0
            Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'a: ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
            Multimeter.D5D6(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
        end % for
    end % if
    if AllVoltages || AllVoltCurr
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(AA, NEUT);
        Multimeter.V{plus(end, 1.0)} = horzcat('Uan: ', BlockNom);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(POSI, NEUT);
        Multimeter.V{plus(end, 1.0)} = horzcat('Udc+: ', BlockNom);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(NEGA, NEUT);
        Multimeter.V{plus(end, 1.0)} = horzcat('Udc-: ', BlockNom);
    end % if
    % 314 316
    % 315 316
    if arm2 || arm3
        % 317 319
        % 318 319
        sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, BBPLUSVF, 0.0, Ron, 0.0), horzcat(BBPLUS, BBVF, 0.0, Ron, 0.0), horzcat(BB, BBMOINVF, 0.0, Ron, 0.0), horzcat(BBMOIN, NEGABVF, 0.0, Ron, 0.0), horzcat(NEUTBBPLUSVF, BBPLUS, 0.0, Ron, 0.0), horzcat(NEUTBBMOINVF, NEUT, 0.0, Ron, 0.0));
        % 320 328
        % 321 328
        % 322 328
        % 323 328
        % 324 328
        % 325 328
        % 326 328
        % 327 328
        sps.source = vertcat(horzcat(sps.source), horzcat(POSI, BBPLUSVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(BBPLUS, BBVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(BB, BBMOINVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(BBMOIN, NEGABVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTBBPLUSVF, BBPLUS, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTBBMOINVF, NEUT, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
        % 329 337
        % 330 337
        % 331 337
        % 332 337
        % 333 337
        % 334 337
        % 335 337
        % 336 337
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_1: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_3: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_4: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_5: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_6: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_1: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_3: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_4: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_5: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_6: ', BlockNom);
        % 349 350
        Yu = vertcat(Yu, horzcat(POSI, BBPLUSVF), horzcat(BBPLUS, BBVF), horzcat(BB, BBMOINVF), horzcat(BBMOIN, NEGABVF), horzcat(NEUTBBPLUSVF, BBPLUS), horzcat(NEUTBBMOINVF, NEUT));
        % 351 358
        % 352 358
        % 353 358
        % 354 358
        % 355 358
        % 356 358
        % 357 358
        sps.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
        % 359 360
        sps.SwitchType(plus(end, 1.0):plus(end, 6.0)) = [7.0 7.0 7.0 7.0 3.0 3.0];
        % 361 363
        % 362 363
        if AllCurrents || AllVoltCurr
            y = size(sps.source, 1.0);
            LengthI = length(Multimeter.I);
            for s=1.0:4.0
                Multimeter.I{plus(end, 1.0)} = horzcat('IQ', num2str(s), 'b: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.Q1Q4(plus(end, 1.0)) = plus(LengthI, s);
            end % for
            for s=1.0:4.0
                Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'b: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.D1D4(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
            end % for
            for s=5.0:6.0
                Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'b: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.D5D6(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
            end % for
        end % if
        if AllVoltages || AllVoltCurr
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(BB, NEUT);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ubn: ', BlockNom);
        end % if
    end % if
    % 387 388
    if arm3
        % 389 391
        % 390 391
        sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, CCPLUSVF, 0.0, Ron, 0.0), horzcat(CCPLUS, CCVF, 0.0, Ron, 0.0), horzcat(CC, CCMOINVF, 0.0, Ron, 0.0), horzcat(CCMOIN, NEGACVF, 0.0, Ron, 0.0), horzcat(NEUTCCPLUSVF, CCPLUS, 0.0, Ron, 0.0), horzcat(NEUTCCMOINVF, NEUT, 0.0, Ron, 0.0));
        % 392 400
        % 393 400
        % 394 400
        % 395 400
        % 396 400
        % 397 400
        % 398 400
        % 399 400
        sps.source = vertcat(horzcat(sps.source), horzcat(POSI, CCPLUSVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(CCPLUS, CCVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(CC, CCMOINVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(CCMOIN, NEGACVF, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTCCPLUSVF, CCPLUS, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUTCCMOINVF, NEUT, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
        % 401 409
        % 402 409
        % 403 409
        % 404 409
        % 405 409
        % 406 409
        % 407 409
        % 408 409
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_1: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_3: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_4: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_5: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_6: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_1: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_3: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_4: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_5: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_6: ', BlockNom);
        % 421 422
        Yu = vertcat(Yu, horzcat(POSI, CCPLUSVF), horzcat(CCPLUS, CCVF), horzcat(CC, CCMOINVF), horzcat(CCMOIN, NEGACVF), horzcat(NEUTCCPLUSVF, CCPLUS), horzcat(NEUTCCMOINVF, NEUT));
        % 423 430
        % 424 430
        % 425 430
        % 426 430
        % 427 430
        % 428 430
        % 429 430
        sps.sourcenames(plus(end, 1.0):plus(end, 6.0), 1.0) = mtimes(ones(6.0, 1.0), block);
        % 431 432
        sps.SwitchType(plus(end, 1.0):plus(end, 6.0)) = [7.0 7.0 7.0 7.0 3.0 3.0];
        % 433 435
        % 434 435
        if AllCurrents || AllVoltCurr
            y = size(sps.source, 1.0);
            LengthI = length(Multimeter.I);
            for s=1.0:4.0
                Multimeter.I{plus(end, 1.0)} = horzcat('IQ', num2str(s), 'c: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.Q1Q4(plus(end, 1.0)) = plus(LengthI, s);
            end % for
            for s=1.0:4.0
                Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'c: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.D1D4(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
            end % for
            for s=5.0:6.0
                Multimeter.I{plus(end, 1.0)} = horzcat('ID', num2str(s), 'c: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 2.0} = plus(minus(y, 6.0), s);
                Multimeter.D5D6(plus(end, 1.0)) = plus(plus(LengthI, 4.0), s);
            end % for
        end % if
        if AllVoltages || AllVoltCurr
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(CC, NEUT);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ucn: ', BlockNom);
        end % if
    end % if
    % 459 460
    sps.Rswitch(plus(end, 1.0):plus(end, NumberOfSwitches)) = mtimes(ones(1.0, NumberOfSwitches), Ron);
    % 461 463
    % 462 463
    sps.Status.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Status'), 'GotoTag');
    sps.Status.Demux(plus(end, 1.0)) = NumberOfSwitches;
    sps.Gates.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
    sps.Gates.Mux(plus(end, 1.0)) = NumberOfSwitches;
    sps.ITAIL.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/ITAIL'), 'GotoTag');
    sps.ITAIL.Mux(plus(end, 1.0)) = NumberOfSwitches;
    sps.SwitchDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Uswitch'), 'GotoTag');
    sps.SwitchDevices.Demux(plus(end, 1.0)) = NumberOfSwitches;
    sps.SwitchGateInitialValue(plus(end, 1.0):plus(end, NumberOfSwitches)) = zeros(1.0, NumberOfSwitches);
    sps.SwitchDevices.total = plus(sps.SwitchDevices.total, NumberOfSwitches);
end % function
