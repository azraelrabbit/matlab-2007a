function ThreePhaseVIMeasurementCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    PhasorSimulation = strcmp(get_param(block, 'PhasorSimulation'), 'on');
    VoltageMeasurements = get_param(block, 'VoltageMeasurement');
    MeasureVoltage = not(strcmp('no', VoltageMeasurements));
    MeasureCurrent = strcmp('yes', get_param(block, 'CurrentMeasurement'));
    WantVlabel = strcmp('on', get_param(block, 'SetLabelV'));
    WantIlabel = strcmp('on', get_param(block, 'SetLabelI'));
    WantVpu = strcmp('on', get_param(block, 'Vpu'));
    WantIpu = strcmp('on', get_param(block, 'Ipu'));
    % 16 19
    % 17 19
    Vabc = get_param(horzcat(block, '/Vabc'), 'Blocktype');
    Iabc = get_param(horzcat(block, '/Iabc'), 'Blocktype');
    % 20 23
    % 21 23
    if PhasorSimulation
        set_param(block, 'Maskenables', {'on','on','on','on','on','on','on','on','on','on','on','on','on'});
    else
        set_param(block, 'Maskenables', {'on','on','on','on','on','on','on','on','on','on','off','on','on'});
    end % if
    % 27 30
    % 28 30
    v{1.0} = 'on';
    v{2.0} = 'off';
    v{3.0} = 'off';
    v{4.0} = 'off';
    v{5.0} = 'on';
    v{6.0} = 'off';
    v{7.0} = 'off';
    v{8.0} = 'off';
    v{9.0} = 'off';
    v{10.0} = 'off';
    if MeasureVoltage
        v{2.0} = 'on';
        if WantVlabel
            v{3.0} = 'on';
        end % if
        v{4.0} = 'on';
        if WantVpu
            v{10.0} = 'on';
        end % if
    end % if
    if MeasureCurrent
        v{6.0} = 'on';
        if WantIlabel
            v{7.0} = 'on';
        end % if
        v{8.0} = 'on';
        if WantIpu
            v{9.0} = 'on';
            v{10.0} = 'on';
        end % if
    end % if
    v{11.0} = 'on';
    v{12.0} = 'off';
    v{13.0} = 'off';
    set_param(block, 'maskvisibilities', v);
    if strcmp(VoltageMeasurements, 'no')
        if not(strcmp(Vabc, 'Terminator'))
            replace_block(block, 'Followlinks', 'on', 'Name', 'Vabc', 'Terminator', 'noprompt');
        end % if
    else
        if WantVlabel
            if not(strcmp(Vabc, 'Goto'))
                replace_block(block, 'Followlinks', 'on', 'Name', 'Vabc', 'goto', 'noprompt');
            end % if
            TagGoto = get_param(block, 'LabelV');
            set_param(horzcat(block, '/Vabc'), 'GotoTag', TagGoto, 'TagVisibility', 'Global');
        else
            if not(strcmp(Vabc, 'Outport'))
                replace_block(block, 'Followlinks', 'on', 'Name', 'Vabc', 'Outport', 'noprompt');
                if strcmp(Iabc, 'Outport')
                    set_param(horzcat(block, '/Vabc'), 'Port', '1');
                end % if
            end % if
        end % if
    end % if
    if MeasureCurrent
        if WantIlabel
            if not(strcmp(Iabc, 'Goto'))
                replace_block(block, 'Followlinks', 'on', 'Name', 'Iabc', 'goto', 'noprompt');
            end % if
            TagGoto = get_param(block, 'LabelI');
            set_param(horzcat(block, '/Iabc'), 'GotoTag', TagGoto, 'TagVisibility', 'Global');
        else
            if not(strcmp(Iabc, 'Outport'))
                replace_block(block, 'Followlinks', 'on', 'Name', 'Iabc', 'Outport', 'noprompt');
            end % if
        end % if
    else
        if not(strcmp(Iabc, 'Terminator'))
            replace_block(block, 'Followlinks', 'on', 'Name', 'Iabc', 'Terminator', 'noprompt');
        end % if
    end % if
end % function
