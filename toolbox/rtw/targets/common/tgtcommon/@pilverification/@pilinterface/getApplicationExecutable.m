function exe = getApplicationExecutable(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    try
        error(nargchk(1.0, 1.0, nargin, 'struct'));
        % 12 13
        APPLICATION_DIR = h.getApplicationDir;
        % 14 15
        appBuildObjPath = fullfile(APPLICATION_DIR, 'buildInfo.mat');
        % 16 18
        % 17 18
        if not(exist(appBuildObjPath, 'file'))
            error(pil_get_error_id('errorApplicationOutOfDate'), 'Application build object does not exist.');
            % 20 21
        end % if
        % 22 23
        exe = h.a_getApplicationExecutable(appBuildObjPath);
        % 24 25
        if not(exist(exe, 'file'))
            error(pil_get_error_id('errorApplicationOutOfDate'), 'Application executable "%s" does not exist.', exe);
            % 27 29
            % 28 29
        end % if
        % 30 33
        % 31 33
        % 32 33
        [desc, interface_file_path] = h.getInterfaceDescription;
        % 34 36
        % 35 36
        exeStruct = dir(exe);
        exeDate = exeStruct.date;
        % 38 39
        interfaceStruct = dir(interface_file_path);
        interfaceDate = interfaceStruct.date;
        % 41 42
        if gt(datenum(interfaceDate), datenum(exeDate))
            % 43 45
            % 44 45
            error(pil_get_error_id('errorApplicationOutOfDate'), 'PIL Interface file is more recent than the PIL Application');
            % 46 47
        end % if
    catch
        [lastMsg, lastId] = lasterr;
        switch lastId
        case pil_get_error_id('errorApplicationOutOfDate')
            % 52 53
            rethrow(lasterror);
        otherwise
            % 55 65
            % 56 65
            % 57 65
            % 58 65
            % 59 65
            % 60 65
            % 61 65
            % 62 65
            % 63 65
            % 64 65
            error(pil_get_error_id('errorApplicationOutOfDate'), '%s', lastMsg);
            % 66 67
        end % switch
    end % try
end % function
