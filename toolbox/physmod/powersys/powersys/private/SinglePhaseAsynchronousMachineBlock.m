function [sps, YuNonlinear] = SinglePhaseAsynchronousMachineBlock(nl, sps, YuNonlinear)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Single Phase Asynchronous Machine');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Single Phase Asynchronous Machine');
        NominalParameters = getSPSmaskvalues(block, {'NominalParameters'});
        % 17 18
        IA0 = 0.0;
        phiA0 = 0.0;
        IB0 = 0.0;
        phiB0 = 0.0;
        freq = NominalParameters(3.0);
        % 23 25
        % 24 25
        nodes = nl.block_nodes(block);
        N1 = nodes(1.0);
        N2 = nodes(2.0);
        % 28 29
        MachineType = get_param(block, 'MachineType');
        switch MachineType
        case 'Main & auxiliary windings'
            N3 = nodes(3.0);
            N4 = nodes(4.0);
        otherwise
            N3 = N1;
            N4 = N2;
        end % switch
        % 38 39
        sps.source = vertcat(horzcat(sps.source), horzcat(N1, N2, 1.0, IA0, phiA0, freq, NaN), horzcat(N3, N4, 1.0, IB0, phiB0, freq, NaN));
        % 40 42
        % 41 42
        YuNonlinear(plus(end, 1.0):plus(end, 2.0), 1.0:2.0) = vertcat(horzcat(N1, N2), horzcat(N3, N4));
        % 43 44
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 2.0;
        sps.U.Mux(plus(end, 1.0)) = 2.0;
        sps.srcstr{plus(end, 1.0)} = horzcat('I_A: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_B: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_A: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_B: ', BlockNom);
        sps.sourcenames(plus(end, 1.0):plus(end, 2.0), 1.0) = vertcat(block, block);
        % 51 53
        % 52 53
        ysrc = minus(size(sps.source, 1.0), 1.0);
        sps.InputsNonZero(plus(end, 1.0):plus(end, 2.0)) = horzcat(ysrc, plus(ysrc, 1.0));
        % 55 56
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
    end % for
end % function
