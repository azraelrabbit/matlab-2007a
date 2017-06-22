function [sps, Multimeter] = ThreePhaseParallelRLCBranchBlock(nl, sps, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Three-Phase Parallel RLC Branch');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        [R, L, C] = getSPSmaskvalues(block, {'Resistance','Inductance','Capacitance'});
        BranchType = get_param(block, 'BranchType');
        switch BranchType
        case 'R'
            L = Inf;
            C = 0.0;
        case 'L'
            R = Inf;
            C = 0.0;
        case 'C'
            L = Inf;
            R = Inf;
        case 'RL'
            C = 0.0;
        case 'RC'
            L = Inf;
        case 'LC'
            R = Inf;
        end % switch
        blocinit(block, cellhorzcat(R, L, C));
        if eq(R, Inf)
            R = 0.0;
        end % if
        if eq(L, Inf)
            L = 0.0;
        end % if
        nodes = nl.block_nodes(block);
        sps.rlc(plus(end, 1.0):plus(end, 3.0), 1.0:6.0) = vertcat(horzcat(nodes(1.0), nodes(4.0), 1.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)), horzcat(nodes(2.0), nodes(5.0), 1.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)), horzcat(nodes(3.0), nodes(6.0), 1.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06)));
        % 42 44
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C: ', BlockNom);
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
    end % for
