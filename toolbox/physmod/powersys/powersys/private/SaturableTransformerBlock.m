function [sps, YuNonlinear, Multimeter, TransfoNumber, NewNode] = SaturableTransformerBlock(nl, sps, YuNonlinear, Multimeter, NewNode)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    idx = nl.filter_type('Saturable Transformer');
    TransfoNumber = 1.0;
    % 12 14
    for i=1.0:length(idx)
        % 14 16
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        % 17 19
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        ThreeWindings = strcmp('on', get_param(block, 'ThreeWindings'));
        SimulateHysteresis = strcmp('on', get_param(block, 'Hysteresis'));
        % 23 26
        % 24 26
        puUnits = strcmp('pu', get_param(block, 'UNITS'));
        % 26 28
        NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Saturable Transformer');
        % 28 30
        if SimulateHysteresis
            set_param(block, 'TransfoNumber', num2str(TransfoNumber));
            TransfoNumber = plus(TransfoNumber, 1.0);
        else
            set_param(block, 'TransfoNumber', '1');
        end % if
        % 35 37
        [NominalPower, Winding1, Winding2, Winding3, CoreLoss, Saturation] = getSPSmaskvalues(block, {'NominalPower','Winding1','Winding2','Winding3','CoreLoss','Saturation'});
        % 37 39
        blocinit(block, cellhorzcat(NominalPower, Winding1, Winding2, ThreeWindings, Winding3, Saturation, CoreLoss));
        % 39 41
        Pnom = NominalPower(1.0);
        freq = NominalPower(2.0);
        Rmag = CoreLoss(1.0);
        % 43 53
        % 44 53
        % 45 53
        % 46 53
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        nodes = nl.block_nodes(block);
        % 53 56
        % 54 56
        if puUnits
            R = mrdivide(mtimes(Winding1(2.0), mpower(Winding1(1.0), 2.0)), Pnom);
            L = mtimes(mrdivide(mrdivide(mtimes(Winding1(3.0), mpower(Winding1(1.0), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            R = Winding1(2.0);
            L = mtimes(Winding1(3.0), 1000.0);
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 2.0, R, L, Winding1(1.0));
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_1: ', BlockNom);
        % 64 67
        % 65 67
        if puUnits
            R = mrdivide(mtimes(Winding2(2.0), mpower(Winding2(1.0), 2.0)), Pnom);
            L = mtimes(mrdivide(mrdivide(mtimes(Winding2(3.0), mpower(Winding2(1.0), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            R = Winding2(2.0);
            L = mtimes(Winding2(3.0), 1000.0);
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(3.0), nodes(4.0), 2.0, R, L, Winding2(1.0));
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_2: ', BlockNom);
        % 75 78
        % 76 78
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
        % 78 81
        % 79 81
        if ThreeWindings
            % 81 83
            if puUnits
                R = mrdivide(mtimes(Winding3(2.0), mpower(Winding3(1.0), 2.0)), Pnom);
                L = mtimes(mrdivide(mrdivide(mtimes(Winding3(3.0), mpower(Winding3(1.0), 2.0)), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
            else
                R = Winding3(2.0);
                L = mtimes(Winding3(3.0), 1000.0);
            end % if
            % 89 91
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(5.0), nodes(6.0), 2.0, R, L, Winding3(1.0));
            sps.rlcnames{plus(end, 1.0)} = horzcat('winding_3: ', BlockNom);
            % 92 95
            % 93 95
            x = size(sps.rlc, 1.0);
            if strcmp('Winding voltages', measure) || strcmp('All measurements (V I Flux)', measure)
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(end, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('Uw3: ', BlockNom);
            end % if
            if strcmp('Winding currents', measure) || strcmp('All measurements (V I Flux)', measure)
                Multimeter.I{plus(end, 1.0)} = horzcat('Iw3: ', BlockNom);
                Multimeter.Yi{plus(end, 1.0), 1.0} = x;
            end % if
            % 103 105
        end % if
        % 105 107
        if puUnits
            R = mrdivide(mtimes(Rmag(1.0), mpower(Winding1(1.0), 2.0)), Pnom);
        else
            R = Rmag(1.0);
        end % if
        % 111 113
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(NewNode, nodes(2.0), 1.0, R, 0.0, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Lm: ', BlockNom);
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(NewNode, nodes(2.0), 1.0, 0.0, 0.0, 0.0, 18.0);
        YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(NewNode, nodes(2.0));
        NewNode = plus(NewNode, 1.0);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_core: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_core: ', BlockNom);
        % 119 122
        % 120 122
        if eq(length(CoreLoss), 1.0)
            % 122 124
            sps.SaturableTransfo(plus(end, 1.0)).Name = BlockName;
            sps.SaturableTransfo(end).Output = length(sps.outstr);
            sps.SaturableTransfo(end).Type = 'Single-Phase';
        end % if
        % 127 130
        % 128 130
        x = size(sps.rlc, 1.0);
        y = size(sps.source, 1.0);
        % 131 134
        % 132 134
        sps.InputsNonZero(plus(end, 1.0)) = y;
        % 134 136
        sps.mesureFluxes(1.0, plus(end, 1.0)) = 0.0;
        % 136 138
        switch measure
        case 'Flux and excitation current ( Imag + IRm )'
            Multimeter.Yi{plus(end, 1.0), 1.0} = x;
            Multimeter.Yi{end, 2.0} = y;
            Multimeter.I{plus(end, 1.0)} = horzcat('Iexc: ', BlockNom);
            Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
            sps.mesureFluxes(1.0, end) = 1.0;
        case 'Flux and magnetization current ( Imag )'
            % 145 147
            Multimeter.Yi{plus(end, 1.0), 2.0} = y;
            Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
            Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
            sps.mesureFluxes(1.0, end) = 1.0;
        case 'All measurements (V I Flux)'
            % 151 153
            Multimeter.Yi{plus(end, 1.0), 1.0} = x;
            Multimeter.Yi{end, 2.0} = y;
            Multimeter.I{plus(end, 1.0)} = horzcat('Iexc: ', BlockNom);
            Multimeter.F{plus(end, 1.0)} = horzcat('Flux: ', BlockNom);
            sps.mesureFluxes(1.0, end) = 1.0;
            Multimeter.Yi{plus(end, 1.0), 2.0} = y;
            Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
            % 159 161
        end % switch
        % 161 163
        sps.modelnames{18.0}(plus(end, 1.0)) = block;
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        % 164 166
        if strcmp(get_param(horzcat(BlockName, '/Goto21'), 'BlockType'), 'Goto')
            sps.Flux.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto21'), 'GotoTag');
            sps.Flux.Mux(plus(end, 1.0)) = 1.0;
        end % if
        % 169 171
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From1'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 1.0;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto11'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 1.0;
        % 174 176
    end % for
    % 176 178
    sps.nbmodels(18.0) = size(sps.modelnames{18.0}, 2.0);
