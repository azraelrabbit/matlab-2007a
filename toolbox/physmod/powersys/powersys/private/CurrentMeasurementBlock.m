function [sps, Ycurr, MesuresCourants] = CurrentMeasurementBlock(nl, sps, Ycurr, MesuresCourants)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Current Measurement');
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        % 14 15
        if sps.PowerguiInfo.HookPort
            if sps.PowerguiInfo.Phasor
                set_param(BlockName, 'PhasorSimulation', 'on');
                set_param(BlockName, 'MaskEnables', {'on','on','on'});
            else
                set_param(BlockName, 'PhasorSimulation', 'off');
                set_param(BlockName, 'MaskEnables', {'on','off','on'});
            end % if
        end % if
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        MesuresCourants{plus(end, 1.0), 1.0} = block;
        nodes = nl.block_nodes(block);
        Ycurr(plus(end, 1.0), 1.0:2.0) = horzcat(nodes(1.0), nodes(2.0));
        sps.outstr{plus(end, 1.0)} = horzcat('I_', BlockNom);
        sps.measurenames(plus(end, 1.0), 1.0) = block;
        sps.CurrentMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/source'), 'GotoTag');
        sps.CurrentMeasurement.Demux(plus(end, 1.0)) = 1.0;
    end % for
end % function
