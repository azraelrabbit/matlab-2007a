function [sps, Multimeter, NewNode] = ThreePhaseMutualInductanceBlock(nl, sps, Multimeter, NewNode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Three-Phase Mutual Inductance Z1-Z0');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        [RL1, RL0] = getSPSmaskvalues(block, {'PositiveSequence','ZeroSequence'});
        blocinit(block, cellhorzcat(RL1, RL0));
        Rs = mrdivide(plus(mtimes(2.0, RL1(1.0)), RL0(1.0)), 3.0);
        Ls = mrdivide(plus(mtimes(2.0, RL1(2.0)), RL0(2.0)), 3.0);
        Ls = mtimes(Ls, 1000.0);
        Rm = mrdivide(minus(RL0(1.0), RL1(1.0)), 3.0);
        Lm = mrdivide(minus(RL0(2.0), RL1(2.0)), 3.0);
        Lm = mtimes(Lm, 1000.0);
        BranchType = 3.0;
        if eq(Rm, 0.0) && eq(Lm, 0.0)
            BranchType = 0.0;
        end % if
        % 27 30
        % 28 30
        % 29 30
        nodes = nl.block_nodes(block);
        % 31 32
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(4.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_1: ', BlockNom);
        % 34 35
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(2.0), nodes(5.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_2: ', BlockNom);
        % 37 38
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(3.0), nodes(6.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('winding_3: ', BlockNom);
        % 40 41
        if eq(BranchType, 3.0)
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(NewNode, nodes(4.0), 0.0, Rm, Lm, 0.0);
            NewNode = plus(NewNode, 1.0);
            sps.rlcnames{plus(end, 1.0)} = horzcat('mut: ', BlockNom);
        end % if
    end % for
end % function
