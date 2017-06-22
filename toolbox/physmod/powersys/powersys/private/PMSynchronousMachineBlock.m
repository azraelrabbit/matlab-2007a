function [sps, YuNonlinear] = PMSynchronousMachineBlock(nl, sps, YuNonlinear)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Permanent Magnet Synchronous Machine');
    sps.NbMachines = plus(sps.NbMachines, length(idx));
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'PM Synchronous Machine');
        % 17 21
        % 18 21
        % 19 21
        % 20 21
        nodes = nl.block_nodes(block);
        sps.source(plus(end, 1.0):plus(end, 2.0), 1.0:7.0) = vertcat(horzcat(nodes(1.0), nodes(3.0), 1.0, 0.0, 0.0, 0.0, 16.0), horzcat(nodes(2.0), nodes(3.0), 1.0, 0.0, 0.0, 0.0, 16.0));
        % 23 26
        % 24 26
        % 25 26
        ysrc = minus(size(sps.source, 1.0), 1.0);
        sps.InputsNonZero(plus(end, 1.0):plus(end, 2.0)) = horzcat(ysrc, plus(ysrc, 1.0));
        % 28 29
        sps.srcstr{plus(end, 1.0)} = horzcat('I_A: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_B: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_AB: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_BC: ', BlockNom);
        sps.sourcenames(plus(end, 1.0):plus(end, 2.0), 1.0) = vertcat(block, block);
        % 34 35
        xc = size(sps.modelnames{16.0}, 2.0);
        sps.modelnames{16.0}(plus(xc, 1.0)) = block;
        % 37 38
        YuNonlinear(plus(end, 1.0):plus(end, 2.0), 1.0:2.0) = vertcat(horzcat(nodes(1.0), nodes(2.0)), horzcat(nodes(2.0), nodes(3.0)));
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 2.0;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 2.0;
    end % for
    sps.nbmodels(16.0) = size(sps.modelnames{16.0}, 2.0);
end % function
