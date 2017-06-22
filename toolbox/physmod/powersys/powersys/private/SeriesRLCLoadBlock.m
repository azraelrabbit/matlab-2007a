function [sps, Multimeter] = SeriesRLCLoadBlock(nl, sps, Multimeter)
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
    idx = nl.filter_type('Series RLC Load');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        [Vb, fn, Pn, Ql, Qc] = getSPSmaskvalues(block, {'NominalVoltage','NominalFrequency','ActivePower','InductivePower','CapacitivePower'});
        blocinit(block, cellhorzcat(Vb, fn, Pn, Ql, Qc));
        S = sqrt(plus(mpower(minus(Ql, Qc), 2.0), mpower(Pn, 2.0)));
        Ib = mrdivide(S, Vb);
        R = mrdivide(Pn, mtimes(Ib, Ib));
        L = mtimes(mrdivide(Ql, mtimes(mtimes(mtimes(mtimes(Ib, Ib), 2.0), 3.141592653589793), fn)), 1000.0);
        if eq(Qc, 0.0)
            C = 0.0;
        else
            C = mtimes(mrdivide(mtimes(Ib, Ib), mtimes(mtimes(6.283185307179586, fn), Qc)), 1e+06);
        end % if
        % 27 28
        nodes = nl.block_nodes(block);
        sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 0.0, R, L, C);
        sps.rlcnames{plus(end, 1.0)} = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
        % 32 34
        % 33 34
        if ne(C, 0.0)
            switch get_param(block, 'Setx0')
            case 'on'
                InitialVoltage = getSPSmaskvalues(block, {'InitialVoltage'});
                sps.BlockInitialState.value{plus(end, 1.0)} = InitialVoltage;
            case 'off'
                sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                % 41 43
                % 42 43
            end % switch
            sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Uc_', sps.rlcnames{end});
            sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
            sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial voltage';
        end % if
        % 48 50
        % 49 50
        if ne(L, 0.0)
            switch get_param(block, 'SetiL0')
            case 'on'
                InitialCurrent = getSPSmaskvalues(block, {'InitialCurrent'});
                sps.BlockInitialState.value{plus(end, 1.0)} = InitialCurrent;
            case 'off'
                sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                % 57 59
                % 58 59
            end % switch
            sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Il_', sps.rlcnames{end});
            sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
            sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial current';
        end % if
        % 64 65
    end % for
end % function
