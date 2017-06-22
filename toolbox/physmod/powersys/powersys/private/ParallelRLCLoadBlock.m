function [sps, Multimeter] = ParallelRLCLoadBlock(nl, sps, Multimeter)
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
    idx = nl.filter_type('Parallel RLC Load');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        [Vb, fn, Pn, Ql, Qc] = getSPSmaskvalues(block, {'NominalVoltage','NominalFrequency','ActivePower','InductivePower','CapacitivePower'});
        blocinit(block, cellhorzcat(Vb, fn, Pn, Ql, Qc));
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
        C = mtimes(mrdivide(Qc, mtimes(mtimes(mtimes(6.283185307179586, fn), Vb), Vb)), 1e+06);
        % 29 30
        nodes = nl.block_nodes(block);
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 1.0, R, L, C);
        sps.rlcnames{plus(end, 1.0)} = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
        % 34 36
        % 35 36
        if ne(C, 0.0)
            switch get_param(block, 'Setx0')
            case 'on'
                InitialVoltage = getSPSmaskvalues(block, {'InitialVoltage'});
                sps.BlockInitialState.value{plus(end, 1.0)} = InitialVoltage;
            case 'off'
                sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                % 43 45
                % 44 45
            end % switch
            sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Uc_', sps.rlcnames{end});
            sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
            sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial voltage';
        end % if
        % 50 52
        % 51 52
        if ne(L, 0.0)
            switch get_param(block, 'SetiL0')
            case 'on'
                InitialCurrent = getSPSmaskvalues(block, {'InitialCurrent'});
                sps.BlockInitialState.value{plus(end, 1.0)} = InitialCurrent;
            case 'off'
                sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                % 59 61
                % 60 61
            end % switch
            sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Il_', sps.rlcnames{end});
            sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
            sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial current';
        end % if
        % 66 67
    end % for
end % function
