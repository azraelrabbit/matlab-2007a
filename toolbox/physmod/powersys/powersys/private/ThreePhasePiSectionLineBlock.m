function [sps, Multimeter, NewNode] = ThreePhasePiSectionLineBlock(nl, sps, Multimeter, NewNode)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    idx = nl.filter_type('Three-Phase PI Section Line');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        [f, R10, L10, C10, long] = getSPSmaskvalues(block, {'Frequency','Resistances','Inductances','Capacitances','Length'});
        blocinit(block, cellhorzcat(f, R10, L10, C10, long));
        w = mtimes(6.283185307179586, f);
        [z_ser1, y_sh1] = etazline(long, R10(1.0), mtimes(L10(1.0), w), mtimes(C10(1.0), w));
        [z_ser0, y_sh0] = etazline(long, R10(2.0), mtimes(L10(2.0), w), mtimes(C10(2.0), w));
        R1 = real(z_ser1);
        L1 = mrdivide(imag(z_ser1), w);
        C1 = mrdivide(imag(y_sh1), w);
        R0 = real(z_ser0);
        L0 = mrdivide(imag(z_ser0), w);
        C0 = mrdivide(imag(y_sh0), w);
        Rs = mrdivide(plus(mtimes(2.0, R1), R0), 3.0);
        Ls = mtimes(mrdivide(plus(mtimes(2.0, L1), L0), 3.0), 1000.0);
        Rm = mrdivide(minus(R0, R1), 3.0);
        Lm = mtimes(mrdivide(minus(L0, L1), 3.0), 1000.0);
        Cp = mtimes(C1, 1e+06);
        Cn = mtimes(mrdivide(mtimes(mtimes(3.0, C1), C0), minus(C1, C0)), 1e+06);
        % 34 37
        % 35 37
        % 36 37
        nodes = nl.block_nodes(block);
        BranchType = 3.0;
        if eq(Rm, 0.0) && eq(Lm, 0.0)
            BranchType = 0.0;
        end % if
        % 42 43
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(4.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_A: ', BlockNom);
        % 45 46
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(2.0), nodes(5.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_B: ', BlockNom);
        % 48 49
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(3.0), nodes(6.0), BranchType, Rs, Ls, 0.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('phase_C: ', BlockNom);
        % 51 52
        if eq(BranchType, 3.0)
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(NewNode, nodes(4.0), 0.0, Rm, Lm, 0.0);
            NewNode = plus(NewNode, 1.0);
            sps.rlcnames{plus(end, 1.0)} = horzcat('mutual: ', BlockNom);
        end % if
        % 57 58
        sps.rlc(plus(end, 1.0):plus(end, 4.0), 1.0:6.0) = vertcat(horzcat(nodes(1.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(nodes(2.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(nodes(3.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(NewNode, 0.0, 0.0, 0.0, 0.0, Cn));
        % 59 63
        % 60 63
        % 61 63
        % 62 63
        NewNode = plus(NewNode, 1.0);
        sps.rlc(plus(end, 1.0):plus(end, 4.0), 1.0:6.0) = vertcat(horzcat(nodes(4.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(nodes(5.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(nodes(6.0), NewNode, 0.0, 0.0, 0.0, Cp), horzcat(NewNode, 0.0, 0.0, 0.0, 0.0, Cn));
        % 65 69
        % 66 69
        % 67 69
        % 68 69
        NewNode = plus(NewNode, 1.0);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_in_A: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_in_B: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_in_C: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cgnd_in: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_out_A: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_out_B: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cp_out_C: ', BlockNom);
        sps.rlcnames{plus(end, 1.0)} = horzcat('Cgnd_out: ', BlockNom);
    end % for
end % function
