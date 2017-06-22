function target_pil_replace_config_subsys(action, libName, srcBlkName, fullDstBlkName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    fullSrcBlkName = sprintf(horzcat(libName, '/', strrep(srcBlkName, '/', '//')));
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    dstModel = strtok(fullDstBlkName, '/');
    % 15 17
    load_system(dstModel);
    % 17 20
    % 18 20
    try
        find_system(fullDstBlkName, 'SearchDepth', 0.0);
    catch
        switch action
        case 'revert'
            blockToRemove = 'PIL configurable subsystem';
        case 'insert'
            blockToRemove = 'PIL original subsystem';
        otherwise
            error(horzcat('Unknown action: ', action));
        end % switch
        error(horzcat('Block (', blockToRemove, ') to be removed was not ', 'found in the model. It may have been deleted or already replaced.'));
        % 31 33
    end % try
    % 33 36
    % 34 36
    fullInsertBlkName = horzcat(get_param(fullDstBlkName, 'Parent'), '/', strrep(srcBlkName, '/', '//'));
    try
        find_system(fullInsertBlkName, 'SearchDepth', 0.0);
        block_found = true;
    catch
        block_found = false;
    end % try
    % 42 44
    if block_found
        switch action
        case 'revert'
            blockToInsert = 'PIL orignal subsystem';
        case 'insert'
            blockToInsert = 'PIL configurable subsystem';
        otherwise
            error(horzcat('Unknown action: ', action));
        end % switch
        error(horzcat('Block (', blockToInsert, ') to be inserted was ', 'found in the model.'));
        % 53 55
    end % if
    % 55 58
    % 56 58
    dstPos = get_param(fullDstBlkName, 'Position');
    dstParent = get_param(fullDstBlkName, 'Parent');
    % 59 62
    % 60 62
    open_system(dstParent);
    % 62 65
    % 63 65
    delete_block(fullDstBlkName);
    add_block(fullSrcBlkName, fullInsertBlkName, 'Position', dstPos);
    % 66 68
    switch action
    case 'insert'
    case 'revert'
        % 70 74
        % 71 74
        % 72 74
        if strcmp(get_param(fullSrcBlkName, 'LinkStatus'), 'none')
            set_param(fullInsertBlkName, 'LinkStatus', 'none');
        end % if
    end % switch
