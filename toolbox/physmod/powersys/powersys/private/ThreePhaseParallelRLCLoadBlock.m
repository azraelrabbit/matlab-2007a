function [sps, Multimeter, NewNode] = ThreePhaseParallelRLCLoadBlock(nl, sps, Multimeter, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Three-Phase Parallel RLC Load');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        Configuration = get_param(block, 'Configuration');
        [Vb, fn, Pn, Ql, Qc] = getSPSmaskvalues(block, {'NominalVoltage','NominalFrequency','ActivePower','InductivePower','CapacitivePower'});
        blocinit(block, cellhorzcat(Vb, fn, Pn, Ql, Qc));
        Vb = mrdivide(Vb, sqrt(3.0));
        Pn = mrdivide(Pn, 3.0);
        Ql = mrdivide(Ql, 3.0);
        Qc = mrdivide(Qc, 3.0);
        if eq(Pn, 0.0)
            R = 0.0;
        else
            R = mrdivide(mtimes(Vb, Vb), Pn);
        end % if
        if eq(Ql, 0.0)
            L = 0.0;
        else
            L = mtimes(mrdivide(mtimes(Vb, Vb), mtimes(mtimes(6.283185307179586, fn), Ql)), 1000.0);
        end % if
        % 31 33
        nodes = nl.block_nodes(block);
        C = mtimes(mrdivide(Qc, mtimes(mtimes(mtimes(6.283185307179586, fn), Vb), Vb)), 1e+06);
        switch Configuration
        case 'Y (grounded)'
            An = 0.0;
            Bn = 0.0;
            Cn = 0.0;
            motA = 'g';
            motB = 'g';
            motC = 'g';
        case 'Y (floating)'
            An = NewNode;
            Bn = NewNode;
            Cn = NewNode;
            NewNode = plus(NewNode, 1.0);
            motA = 'n';
            motB = 'n';
            motC = 'n';
        case 'Y (neutral)'
            An = nodes(4.0);
            Bn = nodes(4.0);
            Cn = nodes(4.0);
            motA = 'n';
            motB = 'n';
            motC = 'n';
        case 'Delta'
            An = nodes(2.0);
            Bn = nodes(3.0);
            Cn = nodes(1.0);
            R = mtimes(3.0, R);
            L = mtimes(3.0, L);
            C = mrdivide(C, 3.0);
            motA = 'b';
            motB = 'c';
            motC = 'a';
        end % switch
        sps.rlc(plus(end, 1.0):plus(end, 3.0), 1.0:6.0) = vertcat(horzcat(nodes(1.0), An, 1.0, R, L, C), horzcat(nodes(2.0), Bn, 1.0, R, L, C), horzcat(nodes(3.0), Cn, 1.0, R, L, C));
        if strcmp(Configuration, 'Delta')
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_AB: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_BC: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_CA: ', BlockNom);
        else
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B: ', BlockNom);
            sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C: ', BlockNom);
        end % if
        BrancheC = size(sps.rlc, 1.0);
        BrancheB = minus(BrancheC, 1.0);
        BrancheA = minus(BrancheB, 1.0);
        Measurements = get_param(block, 'Measurements');
        if strcmp(Measurements, 'Branch voltages') || strcmp(Measurements, 'Branch voltages and currents')
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), An);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ua', motA, ': ', BlockNom);
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(2.0), Bn);
            Multimeter.V{plus(end, 1.0)} = horzcat('Ub', motB, ': ', BlockNom);
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(3.0), Cn);
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
