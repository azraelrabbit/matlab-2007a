function [sps, Multimeter] = SeriesRLCBranchBlock(nl, sps, Multimeter)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    idx = nl.filter_type('Series RLC Branch');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BranchType = get_param(block, 'BranchType');
        % 15 17
        nodes = nl.block_nodes(block);
        if ne(nodes(1.0), nodes(2.0)) && not(strcmp(BranchType, 'Open circuit'))
            % 18 20
            BlockName = getfullname(block);
            [R, L, C] = getSPSmaskvalues(block, {'Resistance','Inductance','Capacitance'});
            switch BranchType
            case 'R'
                L = 0.0;
                C = Inf;
            case 'L'
                R = 0.0;
                C = Inf;
            case 'C'
                L = 0.0;
                R = 0.0;
            case 'RL'
                C = Inf;
            case 'RC'
                L = 0.0;
            case 'LC'
                R = 0.0;
            end % switch
            blocinit(block, cellhorzcat(R, L, C));
            if eq(C, Inf)
                C = 0.0;
            end % if
            sps.rlc(plus(end, 1.0), 1.0:6.0) = horzcat(nodes(1.0), nodes(2.0), 0.0, R, mtimes(L, 1000.0), mtimes(C, 1e+06));
            sps.rlcnames{plus(end, 1.0)} = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
            Multimeter = BlockMeasurements(block, sps.rlc, Multimeter);
            if ne(C, 0.0)
                switch get_param(block, 'Setx0')
                case 'on'
                    InitialVoltage = getSPSmaskvalues(block, {'InitialVoltage'});
                    sps.BlockInitialState.value{plus(end, 1.0)} = InitialVoltage;
                case 'off'
                    sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                    % 52 55
                    % 53 55
                end % switch
                sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Uc_', sps.rlcnames{end});
                sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
                sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial voltage';
            end % if
            % 59 62
            % 60 62
            if ne(L, 0.0)
                switch get_param(block, 'SetiL0')
                case 'on'
                    InitialCurrent = getSPSmaskvalues(block, {'InitialCurrent'});
                    sps.BlockInitialState.value{plus(end, 1.0)} = InitialCurrent;
                case 'off'
                    sps.BlockInitialState.value{plus(end, 1.0)} = NaN;
                    % 68 71
                    % 69 71
                end % switch
                sps.BlockInitialState.state{plus(end, 1.0)} = horzcat('Il_', sps.rlcnames{end});
                sps.BlockInitialState.block{plus(end, 1.0)} = BlockName;
                sps.BlockInitialState.type{plus(end, 1.0)} = 'Initial current';
            end % if
            % 75 77
        end % if
    end % for
