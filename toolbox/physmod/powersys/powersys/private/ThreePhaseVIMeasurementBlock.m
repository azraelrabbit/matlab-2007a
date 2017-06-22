function [sps, YuMeasurement, Ycurr, MesuresTensions, MesuresCourants] = ThreePhaseVIMeasurementBlock(nl, sps, YuMeasurement, MesuresTensions)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Three-Phase VI Measurement');
    Ioutstr = {};
    MesuresCourants = {};
    Ycurr = zeros(0.0, 7.0);
    % 13 14
    for i=1.0:length(idx)
        % 15 16
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        % 19 20
        if sps.PowerguiInfo.HookPort
            EnabledParameters = get_param(BlockName, 'MaskEnables');
            if sps.PowerguiInfo.Phasor
                set_param(BlockName, 'PhasorSimulation', 'on');
                EnabledParameters{11.0} = 'on';
            else
                set_param(BlockName, 'PhasorSimulation', 'off');
                EnabledParameters{11.0} = 'off';
            end % if
            set_param(BlockName, 'MaskEnables', EnabledParameters);
        end % if
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        nodes = nl.block_nodes(block);
        % 33 34
        VChoice = get_param(block, 'VoltageMeasurement');
        % 35 38
        % 36 38
        % 37 38
        if strcmp(VChoice, 'phase-to-ground')
            YuMeasurement(plus(end, 1.0):plus(end, 3.0), 1.0:2.0) = vertcat(horzcat(nodes(4.0), 0.0), horzcat(nodes(5.0), 0.0), horzcat(nodes(6.0), 0.0));
        else
            YuMeasurement(plus(end, 1.0):plus(end, 3.0), 1.0:2.0) = vertcat(horzcat(nodes(4.0), nodes(5.0)), horzcat(nodes(5.0), nodes(6.0)), horzcat(nodes(6.0), nodes(4.0)));
        end % if
        % 43 44
        sps.outstr{plus(end, 1.0)} = horzcat('U_A: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_B: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_C: ', BlockNom);
        % 47 48
        blockAv = block;
        blockBv = get_param(horzcat(BlockName, '/Vb'), 'handle');
        blockCv = get_param(horzcat(BlockName, '/Vc'), 'handle');
        % 51 52
        if isempty(MesuresTensions)
            MesuresTensions = vertcat(cellhorzcat(blockAv), cellhorzcat(blockBv), cellhorzcat(blockCv));
        else
            MesuresTensions(plus(end, 1.0):plus(end, 3.0), 1.0) = vertcat(cellhorzcat(blockAv), cellhorzcat(blockBv), cellhorzcat(blockCv));
        end % if
        % 57 59
        % 58 59
        Ycurr(plus(end, 1.0):plus(end, 3.0), 1.0:2.0) = vertcat(horzcat(nodes(1.0), nodes(4.0)), horzcat(nodes(2.0), nodes(5.0)), horzcat(nodes(3.0), nodes(6.0)));
        % 60 61
        Ioutstr{plus(end, 1.0)} = horzcat('I_A: ', BlockNom);
        Ioutstr{plus(end, 1.0)} = horzcat('I_B: ', BlockNom);
        Ioutstr{plus(end, 1.0)} = horzcat('I_C: ', BlockNom);
        % 64 65
        blockAi = get_param(horzcat(BlockName, '/Ia'), 'handle');
        blockBi = get_param(horzcat(BlockName, '/Ib'), 'handle');
        blockCi = get_param(horzcat(BlockName, '/Ic'), 'handle');
        % 68 69
        if isempty(MesuresCourants)
            MesuresCourants = vertcat(cellhorzcat(blockAi), cellhorzcat(blockBi), cellhorzcat(blockCi));
        else
            MesuresCourants(plus(end, 1.0):plus(end, 3.0), 1.0) = vertcat(cellhorzcat(blockAi), cellhorzcat(blockBi), cellhorzcat(blockCi));
        end % if
        % 74 76
        % 75 76
        sps.VoltageMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/source'), 'GotoTag');
        sps.VoltageMeasurement.Demux(plus(end, 1.0)) = 1.0;
        sps.VoltageMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Vb/source'), 'GotoTag');
        sps.VoltageMeasurement.Demux(plus(end, 1.0)) = 1.0;
        sps.VoltageMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Vc/source'), 'GotoTag');
        sps.VoltageMeasurement.Demux(plus(end, 1.0)) = 1.0;
        sps.CurrentMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Ia/source'), 'GotoTag');
        sps.CurrentMeasurement.Demux(plus(end, 1.0)) = 1.0;
        sps.CurrentMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Ib/source'), 'GotoTag');
        sps.CurrentMeasurement.Demux(plus(end, 1.0)) = 1.0;
        sps.CurrentMeasurement.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Ic/source'), 'GotoTag');
        sps.CurrentMeasurement.Demux(plus(end, 1.0)) = 1.0;
        % 88 89
    end % for
    % 90 91
    sps.outstr = horzcat(sps.outstr, Ioutstr);
end % function
