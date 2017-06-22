function [sps, Multimeter, NewNode] = LinearTransformerBlock(nl, sps, Multimeter, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Linear Transformer');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        ThreeWindings = strcmp('on', get_param(block, 'ThreeWindings'));
        % 16 18
        puUnits = strcmp('pu', get_param(block, 'UNITS'));
        % 18 20
        [NominalPower, winding1, winding2, winding3, RmLm] = getSPSmaskvalues(block, {'NominalPower','winding1','winding2','winding3','RmLm'});
        blocinit(block, cellhorzcat(NominalPower, winding1, winding2, ThreeWindings, winding3, RmLm));
        Pnom = NominalPower(1.0);
        freq = NominalPower(2.0);
        % 23 29
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        nodes = nl.block_nodes(block);
        % 29 32
        % 30 32
        if puUnits
            Vbase2 = mpower(winding1(1.0), 2.0);
            R = mrdivide(mtimes(winding1(2.0), Vbase2), Pnom);
            L = mtimes(mrdivide(mrdivide(mtimes(winding1(3.0), Vbase2), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            R = winding1(2.0);
            L = mtimes(winding1(3.0), 1000.0);
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 2.0, R, L, winding1(1.0));
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_1: ', BlockNom);
        % 41 43
        if puUnits
            Vbase2 = mpower(winding2(1.0), 2.0);
            R = mrdivide(mtimes(winding2(2.0), Vbase2), Pnom);
            L = mtimes(mrdivide(mrdivide(mtimes(winding2(3.0), Vbase2), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            R = winding2(2.0);
            L = mtimes(winding2(3.0), 1000.0);
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(3.0), nodes(4.0), 2.0, R, L, winding2(1.0));
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_2: ', BlockNom);
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
        % 53 55
        if ThreeWindings
            if puUnits
                Vbase2 = mpower(winding3(1.0), 2.0);
                R = mrdivide(mtimes(winding3(2.0), Vbase2), Pnom);
                L = mtimes(mrdivide(mrdivide(mtimes(winding3(3.0), Vbase2), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
            else
                R = winding3(2.0);
                L = mtimes(winding3(3.0), 1000.0);
            end % if
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(5.0), nodes(6.0), 2.0, R, L, winding3(1.0));
            sps.rlcnames{plus(end, 1.0)} = horzcat('winding_3: ', BlockNom);
            x = size(sps.rlc, 1.0);
            if strcmp('Winding voltages', measure) || strcmp('All voltages and currents', measure)
                Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.rlc(x, 1.0:2.0);
                Multimeter.V{plus(end, 1.0)} = horzcat('Uw3: ', BlockNom);
            end % if
            if strcmp('Winding currents', measure) || strcmp('All voltages and currents', measure)
                Multimeter.Yi{plus(end, 1.0), 1.0} = x;
                Multimeter.I{plus(end, 1.0)} = horzcat('Iw3: ', BlockNom);
            end % if
        end % if
        % 75 77
        if puUnits
            Vbase2 = mpower(winding1(1.0), 2.0);
            R = mrdivide(mtimes(RmLm(1.0), Vbase2), Pnom);
            L = mtimes(mrdivide(mrdivide(mtimes(RmLm(2.0), Vbase2), Pnom), mtimes(6.283185307179586, freq)), 1000.0);
        else
            R = RmLm(1.0);
            L = mtimes(RmLm(2.0), 1000.0);
        end % if
        if eq(L, Inf)
            L = 0.0;
        end % if
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(NewNode, nodes(2.0), 1.0, R, L, 0.0);
        NewNode = plus(NewNode, 1.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Lm: ', BlockNom);
        switch measure
        case {'Magnetization current','All voltages and currents'}
            Multimeter.Yi{plus(end, 1.0), 1.0} = size(sps.rlc, 1.0);
            Multimeter.I{plus(end, 1.0)} = horzcat('Imag: ', BlockNom);
        end % switch
    end % for
