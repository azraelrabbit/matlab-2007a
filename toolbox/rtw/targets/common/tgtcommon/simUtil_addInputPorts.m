function simUtil_addInputPorts(system, portNames, position)
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
    block = horzcat(get_param(system, 'parent'), '/', get_param(system, 'Name'));
    % 25 27
    inportSrc = 'built-in/Inport';
    % 27 29
    inportsPaths = find_system(block, 'LookUnderMasks', 'all', 'blocktype', 'Inport');
    inportsHandles = get_param(inportsPaths, 'handle');
    inportsHandles = ctranspose(horzcat(inportsHandles{:}));
    inportsNames = get_param(inportsPaths, 'name');
    % 32 34
    inportsHandlesToDelete = inportsHandles;
    % 34 36
    for i=1.0:length(portNames)
        istr = int2str(i);
        destName = portNames{i};
        % 38 41
        % 39 41
        idx = find(strcmp(destName, inportsNames));
        if not(isempty(idx))
            % 42 44
            dest = inportsHandles(idx(1.0));
            set_param(dest, 'Port', int2str(i));
            inportsHandlesToDelete = setdiff(inportsHandlesToDelete, inportsHandles(idx));
        else
            % 47 49
            dest = horzcat(block, '/', destName);
            add_block(inportSrc, dest);
            set_param(dest, 'Port', int2str(i));
        end % if
        simUtil_setPosition(dest, position, [0.0 40.0], i);
        % 53 55
    end % for
    % 55 57
    deleteBlocks(inportsHandlesToDelete);
end % function
function ports = addOutputPorts(block, portNames, position)
    % 59 79
    % 60 79
    % 61 79
    % 62 79
    % 63 79
    % 64 79
    % 65 79
    % 66 79
    % 67 79
    % 68 79
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    outportSrc = 'built-in/Outport';
    % 79 81
    outportsPaths = find_system(block, 'LookUnderMasks', 'all', 'blocktype', 'Outport');
    outportsHandles = get_param(outportsPaths, 'handle');
    outportsHandles = ctranspose(horzcat(outportsHandles{:}));
    outportsNames = get_param(outportsPaths, 'name');
    % 84 86
    outportsHandlesToDelete = outportsHandles;
    % 86 88
    for i=1.0:length(portNames)
        istr = int2str(i);
        destName = portNames{i};
        % 90 93
        % 91 93
        idx = find(strcmp(destName, outportsNames));
        if not(isempty(idx))
            % 94 96
            dest = outportsHandles(idx(1.0));
            set_param(dest, 'Port', int2str(i));
            outportsHandlesToDelete = setdiff(outportsHandlesToDelete, outportsHandles(idx));
        else
            % 99 101
            dest = horzcat(block, '/', destName);
            add_block(outportSrc, dest);
            set_param(dest, 'Port', int2str(i));
        end % if
        setpos(dest, position, [0.0 50.0], i);
        % 105 107
    end % for
    % 107 109
    deleteBlocks(outportsHandlesToDelete);
end % function
