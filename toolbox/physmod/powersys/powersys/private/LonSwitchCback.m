function Ts = LonSwitchCback(Device, block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Lon = eval(get_param(block, 'Lon'), '0');
    ModelMaskType = get_param(horzcat(block, '/model'), 'MaskType');
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    Ts = PowerguiInfo.Ts;
    % 13 14
    if PowerguiInfo.Continuous
        if eq(Lon, 0.0) && not(strcmp('ContinuousModel', ModelMaskType))
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'Name', 'model', horzcat('powerlib_models/Continuous/', Device), 'noprompt');
        end % if
        if ne(Lon, 0.0) && not(strcmp('CurrentSourceModel', ModelMaskType))
            load_system('powerlib_models');
            replace_block(block, 'Followlinks', 'on', 'Name', 'model', horzcat('powerlib_models/Switch Current Source/', Device), 'noprompt');
        end % if
    end % if
    if PowerguiInfo.Discrete && not(strcmp('DiscreteModel', ModelMaskType))
        load_system('powerlib_models');
        replace_block(block, 'Followlinks', 'on', 'Name', 'model', horzcat('powerlib_models/Discrete/', Device), 'noprompt');
    end % if
end % function
