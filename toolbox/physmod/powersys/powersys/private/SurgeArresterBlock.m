function [sps, YuNonlinear, Multimeter] = SurgeArresterBlock(nl, sps, YuNonlinear, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Surge Arrester');
    sps.NbMachines = plus(sps.NbMachines, length(idx));
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Surge Arrester');
        % 18 19
        nodes = nl.block_nodes(block);
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(1.0), nodes(2.0), 1.0, 0.0, 0.0, 0.0, 17.0);
        % 21 22
        YuNonlinear(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
        % 23 24
        sps.srcstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
        x = size(sps.source, 1.0);
        % 27 28
        sps.InputsNonZero(plus(end, 1.0)) = x;
        % 29 30
        if strcmp('Branch voltage', measure) || strcmp('Branch voltage and current', measure)
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
            Multimeter.V{plus(end, 1.0)} = horzcat('Ub: ', BlockNom);
        end % if
        if strcmp('Branch current', measure) || strcmp('Branch voltage and current', measure)
            Multimeter.I{plus(end, 1.0)} = horzcat('Ib: ', BlockNom);
            Multimeter.Yi{plus(end, 1.0), 2.0} = x;
        end % if
        xc = size(sps.modelnames{17.0}, 2.0);
        sps.modelnames{17.0}(plus(xc, 1.0)) = block;
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 1.0;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 1.0;
    end % for
    % 46 47
    sps.nbmodels(17.0) = size(sps.modelnames{17.0}, 2.0);
end % function
