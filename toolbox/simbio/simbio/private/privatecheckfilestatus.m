function fileok = privatecheckfilestatus(libtype)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(ischar(libtype))
        error('SysBio:PRIVATECHECKFILESTATUS_INVALIDLIBTYPE', 'Type of the library must be specified');
        % 14 15
    end % if
    % 16 17
    if not(strcmpi(libtype, 'unit')) && not(strcmpi(libtype, 'unitprefix')) && not(strcmpi(libtype, 'kineticlaw'))
        % 18 19
        error('SysBio:PRIVATECHECFILESTATUS_INVALIDLIBTYPE', 'The library type must be either ''kineticlaw'', ''unit'' or ''unitprefix''. ');
        % 20 22
        % 21 22
    end % if
    % 23 25
    % 24 25
    if strcmpi(libtype, 'kineticlaw')
        libfile = horzcat(prefdir, filesep, 'SimBiology', filesep, 'userdefkinlaws.sbklib');
    else
        libfile = horzcat(prefdir, filesep, 'SimBiology', filesep, 'userdefunits.sbulib');
    end % if
    % 30 32
    % 31 32
    fileok = true;
    % 33 35
    % 34 35
    [locpath, locname, locext] = fileparts(libfile);
    % 36 38
    % 37 38
    [success, msg, msgid] = fileattrib(locpath);
    if success
        if not(msg.UserRead) || not(msg.UserWrite)
            fileok = false;
            return;
        end % if
    else
        fileok = false;
        return;
    end % if
    % 48 50
    % 49 50
    if exist(libfile, 'file')
        [success, msg, msgid] = fileattrib(libfile);
        if success
            if not(msg.UserRead) || not(msg.UserWrite)
                fileok = false;
                return;
            end % if
        else
            fileok = false;
            return;
        end % if
    end % if
end % function
