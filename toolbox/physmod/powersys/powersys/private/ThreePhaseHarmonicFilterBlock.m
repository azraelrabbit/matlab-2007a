function [sps, Multimeter, NewNode] = ThreePhaseHarmonicFilterBlock(nl, sps, Multimeter, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Three-Phase Harmonic Filter');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        Measurements = get_param(block, 'Measurements');
        % 16 17
        [FilterType, FilterConnection, ParNom, Qc, Fr, Frd, Q] = getSPSmaskvalues(block, {'FilterType','FilterConnection','ParNom','Qc','Fr','Frd','Q'});
        blocinit(block, cellhorzcat(ParNom, Qc, Fr, Frd, Q));
        % 19 20
        Vn = ParNom(1.0);
        Fn = ParNom(2.0);
        wn = mtimes(6.283185307179586, Fn);
        % 23 27
        % 24 27
        % 25 27
        % 26 27
        nodes = nl.block_nodes(block);
        % 28 29
        switch FilterConnection
        case 1.0
            YA = 0.0;
            YB = 0.0;
            YC = 0.0;
            motA = 'g';
            motB = 'g';
            motC = 'g';
        case 2.0
            YA = NewNode;
            YB = NewNode;
            YC = NewNode;
            motA = 'n';
            motB = 'n';
            motC = 'n';
            NewNode = plus(NewNode, 1.0);
        case 3.0
            YA = nodes(4.0);
            YB = nodes(4.0);
            YC = nodes(4.0);
            motA = 'n';
            motB = 'n';
            motC = 'n';
        case 4.0
            Qc = mrdivide(Qc, 3.0);
            YA = nodes(2.0);
            YB = nodes(3.0);
            YC = nodes(1.0);
            motA = 'b';
            motB = 'c';
            motC = 'a';
        end % switch
        switch FilterType
        case 1.0
            wr1 = mtimes(6.283185307179586, Fr);
            R1 = 0.0;
            L1 = mrdivide(mtimes(uminus(mpower(Vn, 2.0)), wn), mtimes(Qc, minus(mpower(wn, 2.0), mpower(wr1, 2.0))));
            C1 = mrdivide(1.0, mtimes(mpower(wr1, 2.0), L1));
            R2 = mrdivide(mtimes(wr1, L1), Q);
            L2 = 0.0;
            C2 = 0.0;
        case 2.0
            wr1 = mtimes(6.283185307179586, Frd(1.0));
            wr2 = mtimes(6.283185307179586, Frd(2.0));
            La = mrdivide(mtimes(uminus(mpower(Vn, 2.0)), wn), mtimes(mrdivide(Qc, 2.0), minus(mpower(wn, 2.0), mpower(wr1, 2.0))));
            Ca = mrdivide(1.0, mtimes(mpower(wr1, 2.0), La));
            % 75 76
            Lb = mrdivide(mtimes(uminus(mpower(Vn, 2.0)), wn), mtimes(mrdivide(Qc, 2.0), minus(mpower(wn, 2.0), mpower(wr2, 2.0))));
            Cb = mrdivide(1.0, mtimes(mpower(wr2, 2.0), Lb));
            % 78 79
            R1 = 0.0;
            L1 = mrdivide(mtimes(La, Lb), plus(La, Lb));
            C1 = plus(Ca, Cb);
            R2 = 0.0;
            L2 = mrdivide(mrdivide(mpower(minus(mtimes(La, Ca), mtimes(Lb, Cb)), 2.0), mpower(plus(Ca, Cb), 2.0)), plus(La, Lb));
            C2 = mrdivide(mtimes(mtimes(mtimes(Ca, Cb), plus(Ca, Cb)), mpower(plus(La, Lb), 2.0)), mpower(minus(mtimes(La, Ca), mtimes(Lb, Cb)), 2.0));
            R3 = mtimes(Q, sqrt(mrdivide(L2, C2)));
            L3 = 0.0;
            C3 = 0.0;
        case 3.0
            wr1 = mtimes(6.283185307179586, Fr);
            R1 = 0.0;
            L1 = 0.0;
            R2 = 0.0;
            C2 = 0.0;
            L2 = mrdivide(mtimes(uminus(mpower(Vn, 2.0)), wn), mtimes(Qc, minus(mpower(wn, 2.0), mpower(wr1, 2.0))));
            C1 = mrdivide(1.0, mtimes(mpower(wr1, 2.0), L2));
            R3 = mtimes(mtimes(wr1, L2), Q);
            L3 = 0.0;
            C3 = 0.0;
        case 4.0
            wr1 = mtimes(6.283185307179586, Fr);
            L1 = 0.0;
            L2 = 0.0;
            L3 = mrdivide(mtimes(uminus(mpower(Vn, 2.0)), wn), mtimes(Qc, minus(mpower(wn, 2.0), mpower(wr1, 2.0))));
            C1 = mrdivide(Qc, mtimes(mpower(Vn, 2.0), wn));
            C2 = 0.0;
            C3 = mrdivide(mrdivide(1.0, L3), mpower(wn, 2.0));
            R1 = 0.0;
            R2 = mtimes(mtimes(wr1, L3), Q);
            R3 = 0.0;
        end % switch
        XA = NewNode;
        XB = plus(NewNode, 1.0);
        XC = plus(NewNode, 2.0);
        NewNode = plus(NewNode, 3.0);
        % 115 116
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), XA, 0.0, R1, mtimes(L1, 1000.0), mtimes(C1, 1e+06));
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(2.0), XB, 0.0, R1, mtimes(L1, 1000.0), mtimes(C1, 1e+06));
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(3.0), XC, 0.0, R1, mtimes(L1, 1000.0), mtimes(C1, 1e+06));
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B1: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C1: ', BlockNom);
        BrancheC = size(sps.rlc, 1.0);
        BrancheB = minus(BrancheC, 1.0);
        BrancheA = minus(BrancheB, 1.0);
        % 125 126
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XA, YA, 1.0, R2, mtimes(L2, 1000.0), mtimes(C2, 1e+06));
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XB, YB, 1.0, R2, mtimes(L2, 1000.0), mtimes(C2, 1e+06));
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XC, YC, 1.0, R2, mtimes(L2, 1000.0), mtimes(C2, 1e+06));
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A2: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B2: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C2: ', BlockNom);
        % 132 133
        if ne(FilterType, 1.0)
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XA, YA, 0.0, R3, mtimes(L3, 1000.0), mtimes(C3, 1e+06));
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XB, YB, 0.0, R3, mtimes(L3, 1000.0), mtimes(C3, 1e+06));
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(XC, YC, 0.0, R3, mtimes(L3, 1000.0), mtimes(C3, 1e+06));
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B3: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C3: ', BlockNom);
        end % if
        % 141 142
        if strcmp(Measurements, 'Branch voltages') || strcmp(Measurements, 'Branch voltages and currents')
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), YA);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ua', motA, ': ', BlockNom);
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(2.0), YB);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ub', motB, ': ', BlockNom);
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(3.0), YC);
            Multimeter.V{plus(end, 1.0)} = horzcat('Uc', motC, ': ', BlockNom);
        end % if
        if strcmp(Measurements, 'Branch currents') || strcmp(Measurements, 'Branch voltages and currents')
            Multimeter.I{plus(end, 1.0)} = horzcat('Ia', motA, ': ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 1.0} = BrancheA;
            Multimeter.I{plus(end, 1.0)} = horzcat('Ib', motB, ': ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 1.0} = BrancheB;
            Multimeter.I{plus(end, 1.0)} = horzcat('Ic', motC, ': ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 1.0} = BrancheC;
        end % if
    end % for
end % function
