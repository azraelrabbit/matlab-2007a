function ports = simUtil_addOutputPorts(block, portNames, position)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    block = horzcat(get_param(block, 'parent'), '/', get_param(block, 'Name'));
    % 26 27
    outportSrc = 'built-in/Outport';
    % 28 29
    outportsPaths = find_system(block, 'LookUnderMasks', 'all', 'blocktype', 'Outport');
    outportsHandles = get_param(outportsPaths, 'handle');
    outportsHandles = ctranspose(horzcat(outportsHandles{:}));
    outportsNames = get_param(outportsPaths, 'name');
    % 33 34
    outportsHandlesToDelete = outportsHandles;
    % 35 36
    for i=1.0:length(portNames)
        istr = int2str(i);
        destName = portNames{i};
        % 39 41
        % 40 41
        idx = find(strcmp(destName, outportsNames));
        if not(isempty(idx))
            % 43 44
            dest = outportsHandles(idx(1.0));
            set_param(dest, 'Port', int2str(i));
            outportsHandlesToDelete = setdiff(outportsHandlesToDelete, outportsHandles(idx));
        else
            % 48 49
            dest = horzcat(block, '/', destName);
            add_block(outportSrc, dest);
            set_param(dest, 'Port', int2str(i));
        end % if
        simUtil_setPosition(dest, position, [0.0 50.0], i);
        % 54 55
    end % for
    % 56 57
    deleteBlocks(outportsHandlesToDelete);
end % function
