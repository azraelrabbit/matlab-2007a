function blockSetup(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 10 13
    % 11 13
    % 12 13
    pil_interface = h.getPILInterface;
    % 14 15
    if isempty(pil_interface)
        error('PIL Interface is unavailable.');
    end % if
    % 18 20
    % 19 20
    i_resizeBlock(h, pil_interface);
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    try
        appExe = pil_interface.getApplicationExecutable;
    catch
        [lastMsg, lastId] = lasterr;
        switch lastId
        case pil_get_error_id('errorApplicationOutOfDate')
            % 33 34
            appExe = [];
        otherwise
            rethrow(lasterror);
        end % switch
    end % try
    if not(isempty(appExe))
        % 40 41
        h.Block.MSfun = pil_interface.getMSfunction;
        % 42 43
        i_setMaskDisplay(h, pil_interface);
    end % if
end % function
function i_setMaskDisplay(h, pil_interface)
    % 47 50
    % 48 50
    % 49 50
    maskDisplay = horzcat('fprintf(''PIL\n%s'', ''(', h.PILConfiguration, ')'')');
    % 51 52
    desc = pil_interface.getInterfaceDescription;
    % 53 54
    inportLabels = i_processPorts(desc.input, 'input');
    % 55 56
    outportLabels = i_processPorts(desc.output, 'output');
    % 57 58
    maskDisplay = horzcat(maskDisplay, sprintf('\n'), inportLabels, outportLabels);
    % 59 60
    set_param(h.Block.Handle, 'MaskDisplayParam', maskDisplay);
end % function
function portLabelStr = i_processPorts(ports, type)
    % 63 66
    % 64 66
    % 65 66
    portLabelStr = [];
    % 67 68
    for i=1.0:length(ports)
        % 69 70
        portname = ports(i).portname;
        portLabelStr = horzcat(portLabelStr, 'port_label(''', type, ''',', num2str(i), ',''', portname, ''')', sprintf('\n'));
        % 72 75
        % 73 75
        % 74 75
    end % for
end % function
function i_resizeBlock(h, pil_interface)
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    [rootModel, systemPath] = pil_interface.getSystemPath;
    % 83 85
    % 84 85
    if not(isempty(systemPath))
        % 86 87
        fullSystemPath = horzcat(rootModel, systemPath);
        % 88 90
        % 89 90
        try
            % 91 93
            % 92 93
            find_system(fullSystemPath, 'SearchDepth', 0.0);
            fullSystemPathValid = true;
        catch
            fullSystemPathValid = false;
        end % try
        if fullSystemPathValid
            % 99 100
            pilAlgPos = get_param(fullSystemPath, 'Position');
            pilAlgWidth = minus(pilAlgPos(3.0), pilAlgPos(1.0));
            pilAlgHeight = minus(pilAlgPos(4.0), pilAlgPos(2.0));
            pilAlgOrientation = get_param(fullSystemPath, 'Orientation');
            % 104 105
            pilBlockPos = get_param(h.Block.Handle, 'Position');
            pilBlockX = pilBlockPos(1.0);
            pilBlockY = pilBlockPos(2.0);
            % 108 109
            set_param(h.Block.Handle, 'Position', horzcat(pilBlockX, pilBlockY, plus(pilBlockX, pilAlgWidth), plus(pilBlockY, pilAlgHeight)));
            % 110 114
            % 111 114
            % 112 114
            % 113 114
            set_param(h.Block.Handle, 'Orientation', pilAlgOrientation);
            % 115 116
        end % if
    end % if
end % function
