function [BlockCount, sps, Multimeter, Yu, dcvf, NewNode] = ThreeLevelSwitchBridge(nl, block, sps, Multimeter, Yu, dcvf, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    DeviceIndice = 1.0;
    BlockName = getfullname(block);
    BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
    % 11 13
    NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Three-Level Bridge');
    % 13 15
    mesurerequest = get_param(block, 'Measurements');
    [v1, v2, v3, v4, v5, v6] = getSPSmaskvalues(block, {'Arms','SnubberResistance','SbubberCapacitance','Device','Ron','ForwardVoltages'});
    arm1 = strcmp(get_param(block, 'Arms'), '1');
    arm2 = strcmp(get_param(block, 'Arms'), '2');
    arm3 = strcmp(get_param(block, 'Arms'), '3');
    % 19 22
    % 20 22
    Rs = v2;
    Cs = v3;
    % 23 26
    % 24 26
    Ron = v5;
    % 26 28
    if eq(Ron, 0.0)
        psberror(horzcat('The internal resistance (Ron) of the Three-Level Bridge named ''', block, ''' is set to zero . You need to specify Ron > 0.'), 'Parameter error');
    end % if
    % 30 43
    % 31 43
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    nodes = nl.block_nodes(block);
    % 43 45
    AA = nodes(1.0);
    BB = nodes(2.0);
    CC = nodes(3.0);
    POSI = nodes(4.0);
    NEUT = nodes(5.0);
    NEGA = nodes(6.0);
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    if eq(Rs, Inf) || eq(Cs, 0.0)
    else
        % 56 58
        Css = Cs;
        if eq(Cs, Inf)
            Css = 0.0;
        end % if
        % 61 63
        sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, AA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AA, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(AA, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_1: ', BlockNom);
        % 70 72
        if arm2 || arm3
            sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, BB, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BB, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(BB, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
            % 73 77
            % 74 77
            % 75 77
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_2: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_2: ', BlockNom);
        end % if
        % 80 82
        if arm3
            sps.rlc = vertcat(horzcat(sps.rlc), horzcat(POSI, CC, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CC, NEGA, 0.0, Rs, 0.0, mtimes(Css, 1e+06)), horzcat(CC, NEUT, 0.0, Rs, 0.0, mtimes(Css, 1e+06)));
            % 83 87
            % 84 87
            % 85 87
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_1_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_2_arm_3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('snubber_3_arm_3: ', BlockNom);
        end % if
    end % if
    % 91 93
    sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, AA, 0.0, Ron, 0.0), horzcat(NEUT, AA, 0.0, Ron, 0.0), horzcat(AA, NEGA, 0.0, Ron, 0.0));
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    sps.source = vertcat(horzcat(sps.source), horzcat(POSI, AA, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUT, AA, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(AA, NEGA, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_1: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_2: ', BlockNom);
    sps.srcstr{plus(end, 1.0)} = horzcat('I_arm1_3: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_1: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_2: ', BlockNom);
    sps.outstr{plus(end, 1.0)} = horzcat('U_arm1_3: ', BlockNom);
    Yu = vertcat(Yu, horzcat(POSI, AA), horzcat(NEUT, AA), horzcat(AA, NEGA));
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    sps.sourcenames(plus(end, 1.0):plus(end, 3.0), 1.0) = mtimes(ones(3.0, 1.0), block);
    % 116 118
    if arm2 || arm3
        % 118 120
        sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, BB, 0.0, Ron, 0.0), horzcat(NEUT, BB, 0.0, Ron, 0.0), horzcat(BB, NEGA, 0.0, Ron, 0.0));
        % 120 126
        % 121 126
        % 122 126
        % 123 126
        % 124 126
        sps.source = vertcat(horzcat(sps.source), horzcat(POSI, BB, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUT, BB, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(BB, NEGA, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
        % 126 132
        % 127 132
        % 128 132
        % 129 132
        % 130 132
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_1: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm2_3: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_1: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm2_3: ', BlockNom);
        Yu = vertcat(Yu, horzcat(POSI, BB), horzcat(NEUT, BB), horzcat(BB, NEGA));
        % 138 143
        % 139 143
        % 140 143
        % 141 143
        sps.sourcenames(plus(end, 1.0):plus(end, 3.0), 1.0) = mtimes(ones(3.0, 1.0), block);
        % 143 145
    end % if
    % 145 147
    if arm3
        % 147 149
        sps.switches = vertcat(horzcat(sps.switches), horzcat(POSI, CC, 0.0, Ron, 0.0), horzcat(NEUT, CC, 0.0, Ron, 0.0), horzcat(CC, NEGA, 0.0, Ron, 0.0));
        % 149 155
        % 150 155
        % 151 155
        % 152 155
        % 153 155
        sps.source = vertcat(horzcat(sps.source), horzcat(POSI, CC, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(NEUT, CC, 1.0, 0.0, 0.0, 0.0, DeviceIndice), horzcat(CC, NEGA, 1.0, 0.0, 0.0, 0.0, DeviceIndice));
        % 155 161
        % 156 161
        % 157 161
        % 158 161
        % 159 161
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_1: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_arm3_3: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_1: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_arm3_3: ', BlockNom);
        Yu = vertcat(Yu, horzcat(POSI, CC), horzcat(NEUT, CC), horzcat(CC, NEGA));
        % 167 172
        % 168 172
        % 169 172
        % 170 172
        sps.sourcenames(plus(end, 1.0):plus(end, 3.0), 1.0) = mtimes(ones(3.0, 1.0), block);
        % 172 174
    end % if
    % 174 176
    bras = plus(plus(mtimes(arm1, 1.0), mtimes(arm2, 2.0)), mtimes(arm3, 3.0));
    NumberOfSwitches = mtimes(3.0, bras);
    BlockCount = NumberOfSwitches;
    sps.Rswitch(plus(end, 1.0):plus(end, NumberOfSwitches)) = mtimes(ones(1.0, NumberOfSwitches), Ron);
    % 179 182
    % 180 182
    sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
    sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
    sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
    if arm2 || arm3
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
    end % if
    if arm3
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
        sps.modelnames{DeviceIndice}(plus(end, 1.0)) = block;
    end % if
    % 194 197
    % 195 197
    sps.SwitchType(plus(end, 1.0):plus(end, NumberOfSwitches)) = mtimes(1.0, ones(1.0, NumberOfSwitches));
    sps.Status.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Status'), 'GotoTag');
    sps.Status.Demux(plus(end, 1.0)) = NumberOfSwitches;
    sps.Gates.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
    sps.Gates.Mux(plus(end, 1.0)) = NumberOfSwitches;
    sps.SwitchDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Uswitch'), 'GotoTag');
    sps.SwitchDevices.Demux(plus(end, 1.0)) = NumberOfSwitches;
    sps.SwitchGateInitialValue(plus(end, 1.0):plus(end, NumberOfSwitches)) = zeros(1.0, NumberOfSwitches);
    sps.SwitchDevices.qty = plus(sps.SwitchDevices.qty, NumberOfSwitches);
    % 205 208
    % 206 208
    y = size(sps.source, 1.0);
    AllCurrents = strcmp(mesurerequest, 'All device currents');
    AllVoltages = strcmp(mesurerequest, 'Phase-to-Neutral and DC voltages');
    AllVoltCurr = strcmp(mesurerequest, 'All voltages and currents');
    % 211 213
    if AllCurrents || AllVoltCurr
        % 213 215
        if arm1
            Coffset = 2.0;
            sps.y3LevelCurrents(plus(end, 1.0)) = 3.0;
        else
            if arm2
                Coffset = 5.0;
                sps.y3LevelCurrents(plus(end, 1.0)) = 6.0;
            else
                Coffset = 8.0;
                sps.y3LevelCurrents(plus(end, 1.0)) = 9.0;
            end % if
        end % if
        sps.y3LevelDevice(plus(end, 1.0)) = 1.0;
        if arm1 || arm2 || arm3
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw1a: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw2a: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw3a: ', BlockNom);
            % 231 234
            % 232 234
            Multimeter.YL{plus(end, 1.0), 1.0} = minus(y, Coffset);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 1.0);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 2.0);
        end % if
        if arm2 || arm3
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw1b: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw2b: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw3b: ', BlockNom);
            % 241 244
            % 242 244
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 3.0);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 4.0);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 5.0);
        end % if
        if arm3
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw1c: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw2c: ', BlockNom);
            Multimeter.L{plus(end, 1.0)} = horzcat('ISw3c: ', BlockNom);
            % 251 254
            % 252 254
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 6.0);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 7.0);
            Multimeter.YL{plus(end, 1.0), 1.0} = plus(minus(y, Coffset), 8.0);
        end % if
    end % if
    % 258 260
    if AllVoltages || AllVoltCurr
        % 260 262
        if arm1 || arm2 || arm3
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(AA, NEUT);
            Multimeter.V{plus(end, 1.0)} = horzcat('Uan: ', BlockNom);
        end % if
        if arm2 || arm3
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(BB, NEUT);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ubn: ', BlockNom);
        end % if
        if arm3
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(CC, NEUT);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ucn: ', BlockNom);
        end % if
        % 273 275
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(POSI, NEUT);
        Multimeter.V{plus(end, 1.0)} = horzcat('Udc+: ', BlockNom);
        Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(NEGA, NEUT);
        Multimeter.V{plus(end, 1.0)} = horzcat('Udc-: ', BlockNom);
    end % if
