function [sps, Multimeter] = DCVoltageSourceBlock(nl, sps, Multimeter)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('DC Voltage Source');
    % 9 11
    for i=1.0:length(idx)
        % 11 13
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        measure = get_param(block, 'Measurements');
        % 17 19
        Amplitude = getSPSmaskvalues(block, {'Amplitude'});
        blocinit(block, cellhorzcat(Amplitude));
        % 20 24
        % 21 24
        % 22 24
        nodes = nl.block_nodes(block);
        % 24 26
        sps.source(plus(end, 1.0), 1.0:7.0) = horzcat(nodes(2.0), nodes(1.0), 0.0, Amplitude, 0.0, 0.0, 21.0);
        sps.srcstr{plus(end, 1.0)} = horzcat('U_', BlockNom);
        % 27 30
        % 28 30
        if not(sps.PowerguiInfo.Phasor)
            ysrc = size(sps.source, 1.0);
            % 31 33
            sps.InputsNonZero(plus(end, 1.0)) = ysrc;
        end % if
        % 34 36
        sps.GotoSources{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        % 36 39
        % 37 39
        switch measure
        case 'Voltage'
            Multimeter.Yu(plus(end, 1.0), 1.0:2.0) = sps.source(end, 1.0:2.0);
            Multimeter.V{plus(end, 1.0)} = horzcat('Usrc: ', BlockNom);
        end % switch
        % 43 45
        sps.modelnames{plus(sps.basicnonlinearmodels, 1.0)}{plus(end, 1.0)} = block;
        sps.nbmodels(plus(sps.basicnonlinearmodels, 1.0)) = plus(sps.nbmodels(plus(sps.basicnonlinearmodels, 1.0)), 1.0);
        sps.sourcenames(plus(end, 1.0), 1.0) = block;
        sps.blksrcnames{plus(end, 1.0)} = BlockNom;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 1.0;
    end % for
