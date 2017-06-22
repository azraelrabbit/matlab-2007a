function hObj = LibraryDatabase
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
    persistent H_OBJ;
    % 12 14
    mlock;
    % 14 16
    if isempty(H_OBJ)
        % 16 18
        H_OBJ = PmSli.LibraryDatabase;
        H_OBJ.Entries = [];
        H_OBJ.Listener = handle.listener(H_OBJ, findprop(H_OBJ, 'Entries'), 'PropertyPreGet', @lEntriesPreGet);
        % 20 24
        % 21 24
        % 22 24
        H_OBJ.Listener.CallbackTarget = H_OBJ;
        % 24 26
    end
    % 26 28
    hObj = H_OBJ;
    % 28 30
end
function lEntriesPreGet(hObj, event)
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    if isempty(hObj.Entries)
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        lInitializeDatabase(hObj);
    end
    % 44 46
end
function lInitializeDatabase(hObj)
    % 47 51
    % 48 51
    % 49 51
    PM_LIBDEF = 'pm_libdef';
    libDefs = which(PM_LIBDEF, '-all');
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    libDefDirs = cell(size(libDefs));
    for i=1.0:length(libDefs)
        libDefDirs{i} = fileparts(libDefs{i});
    end % for
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    libDefDirs = unique(libDefDirs);
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    hObj.Entries = struct;
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    for i=1.0:length(libDefDirs)
        fcn = pm_pathtofunctionhandle(libDefDirs{i}, PM_LIBDEF);
        fcnInfo = functions(fcn);
        try
            entry = fcn();
        catch
            % 81 86
            % 82 86
            % 83 86
            % 84 86
            lastError = lasterror;
            pm_warning('pm_sli:PmSli:LibraryDatabase:ErrorRegisteringEntry', fcnInfo.file, lastError.message);
            % 87 93
            % 88 93
            % 89 93
            % 90 93
            % 91 93
            continue;
        end % try
        % 94 96
        expType = 'PmSli.LibraryEntry';
        if ~(isa(entry, expType))
            % 97 102
            % 98 102
            % 99 102
            % 100 102
            pm_warning('pm_sli:PmSli:LibraryDatabase:InvalidLibraryEntry', fcnInfo.file, expType);
        else
            if isfield(hObj.Entries, entry.Name)
                % 104 108
                % 105 108
                % 106 108
                pm_warning('pm_sli:PmSli:LibraryDatabase:DuplicateLibraryEntry', fcnInfo.file, hObj.Entries.(entry.Name).RegistrationFile, entry.Name);
                % 108 112
                % 109 112
                % 110 112
            end
        end
        % 113 118
        % 114 118
        % 115 118
        % 116 118
        entry.RegistrationFile = fcnInfo.file;
        hObj.Entries.(entry.Name) = entry;
    end % for
end
