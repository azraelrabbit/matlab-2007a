function ACSourceInit(block, PowerguiBlockName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(exist('PowerguiBlockName', 'var'))
        PowerguiInfo = getPowerguiInfo(bdroot(block));
    else
        PowerguiInfo = getPowerguiInfo(bdroot(block), [], [], PowerguiBlockName);
    end % if
    PhasorBlock = strcmp(get_param(horzcat(block, '/Source'), 'BlockType'), 'Constant');
    % 15 16
    if PowerguiInfo.Phasor && not(PhasorBlock)
        load_system('powerlib_models');
        replace_block(block, 'Followlinks', 'on', 'Name', 'Source', 'powerlib_models/Sources/ACSource_Cmplx', 'noprompt');
    end % if
    if not(PowerguiInfo.Phasor) && PhasorBlock
        load_system('powerlib_models');
        replace_block(block, 'Followlinks', 'on', 'Name', 'Source', 'powerlib_models/Sources/ACSource', 'noprompt');
    end % if
end % function
