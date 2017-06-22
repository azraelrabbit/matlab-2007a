function [sps, YuNonlinear] = SwitchedReluctanceMotorBlock(nl, sps, YuNonlinear)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    idx = nl.filter_type('Switched Reluctance Motor');
    % 11 12
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        % 17 19
        % 18 19
        nodes = nl.block_nodes(block);
        % 20 22
        % 21 22
        sps.source = vertcat(horzcat(sps.source), horzcat(nodes(1.0), nodes(2.0), 1.0, 0.0, 0.0, 0.0, NaN), horzcat(nodes(3.0), nodes(4.0), 1.0, 0.0, 0.0, 0.0, NaN), horzcat(nodes(5.0), nodes(6.0), 1.0, 0.0, 0.0, 0.0, NaN));
        % 23 26
        % 24 26
        % 25 26
        sps.srcstr{plus(end, 1.0)} = horzcat('I_A1A2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_B1B2: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_C1C2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_A1A2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_B1B2: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_C1C2: ', BlockNom);
        sps.sourcenames(plus(end, 1.0):plus(end, 3.0), 1.0) = vertcat(block, block, block);
        YuNonlinear(plus(end, 1.0):plus(end, 3.0), 1.0:2.0) = vertcat(horzcat(nodes(1.0), nodes(2.0)), horzcat(nodes(3.0), nodes(4.0)), horzcat(nodes(5.0), nodes(6.0)));
        % 34 36
        % 35 36
        MachineType = get_param(block, 'MachineType');
        switch MachineType
        case '6/4'
            % 39 40
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 3.0;
            sps.U.Mux(plus(end, 1.0)) = 3.0;
        case '8/6'
            % 43 44
            sps.source = vertcat(horzcat(sps.source), horzcat(nodes(7.0), nodes(8.0), 1.0, 0.0, 0.0, 0.0, NaN));
            % 45 46
            sps.srcstr{plus(end, 1.0)} = horzcat('I_D1D2: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_D1D2: ', BlockNom);
            sps.sourcenames(plus(end, 1.0), 1.0) = block;
            YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(7.0), nodes(8.0));
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 4.0;
            sps.U.Mux(plus(end, 1.0)) = 4.0;
        case '10/8'
            % 53 54
            sps.source = vertcat(horzcat(sps.source), horzcat(nodes(7.0), nodes(8.0), 1.0, 0.0, 0.0, 0.0, NaN), horzcat(nodes(9.0), nodes(10.0), 1.0, 0.0, 0.0, 0.0, NaN));
            % 55 57
            % 56 57
            sps.srcstr{plus(end, 1.0)} = horzcat('I_D1D2: ', BlockNom);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_E1E2: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_D1D2: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_E1E2: ', BlockNom);
            sps.sourcenames(plus(end, 1.0):plus(end, 2.0), 1.0) = vertcat(block, block);
            YuNonlinear(plus(end, 1.0):plus(end, 2.0), 1.0:2.0) = vertcat(horzcat(nodes(7.0), nodes(8.0)), horzcat(nodes(9.0), nodes(10.0)));
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 5.0;
            sps.U.Mux(plus(end, 1.0)) = 5.0;
        end % switch
        % 66 68
        % 67 68
        ysrc = minus(size(sps.source, 1.0), 1.0);
        sps.InputsNonZero(plus(end, 1.0):plus(end, 2.0)) = horzcat(ysrc, plus(ysrc, 1.0));
        % 70 71
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
    end % for
end % function
