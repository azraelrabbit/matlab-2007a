function drive_update(model, modelnew)
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
    warnstat = warning('off');
    [lastmsg, lastid] = lastwarn;
    modelH = load_system(model);
    lastwarn(lastmsg, lastid);
    warning(warnstat);
    % 17 19
    % 18 19
    locked = strcmp(get_param(modelH, 'Lock'), 'on');
    if locked
        set_param(modelH, 'Lock', 'off');
    end % if
    % 23 24
    drive_update_1_0_1(modelH);
    % 25 26
    if locked
        set_param(modelH, 'Lock', 'on');
    end % if
    % 29 32
    % 30 32
    % 31 32
    if lt(nargin, 2.0)
        modelnew = '';
    end % if
    local_save_updated_model(model, modelnew);
    % 36 37
    if eq(nargin, 2.0)
        close_system(modelH);
    end % if
end % function
function local_save_updated_model(model, modelnew)
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    [model_path, model_name, model_ext] = fileparts(which(model));
    % 47 48
    interactiveMode = isempty(modelnew);
    % 49 50
    doSaveModel = true;
    % 51 52
    if interactiveMode
        % 53 57
        % 54 57
        % 55 57
        % 56 57
        curr_path = pwd;
        cd(model_path);
        % 59 60
        warnstat = warning('off', 'backtrace');
        % 61 62
        open_system(model);
        warning(warnstat);
        % 64 65
        [filename, pathname] = uiputfile(horzcat(model_name, model_ext), 'Save as');
        cd(curr_path);
        % 67 68
        if isequal(filename, 0.0) || isequal(pathname, 0.0)
            doSaveModel = false;
        else
            modelnew = fullfile(pathname, filename);
        end % if
        % 73 74
    end % if
    % 75 76
    if doSaveModel
        save_system(model, modelnew);
    end % if
end % function
function issue_library_updates_warning(modelH, updateReferenceBlock, updateParName, updateParValueOld)
    % 81 89
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    % 88 89
    warnstat = warning('off');
    [lastmsg, lastid] = lastwarn;
    liblinks = find_system(modelH, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'ReferenceBlock', updateReferenceBlock, updateParName, updateParValueOld);
    % 92 94
    % 93 94
    lastwarn(lastmsg, lastid);
    warning(warnstat);
    % 96 98
    % 97 98
    libname = {};
    for i=1.0:length(liblinks)
        parent = get_param(liblinks(i), 'Parent');
            while not(strcmpi(get_param(parent, 'LinkStatus'), 'resolved'))
            parent = get_param(parent, 'Parent');
        end % while
        libname{plus(end, 1.0)} = bdroot(get_param(parent, 'ReferenceBlock'));
    end % for
    if not(isempty(libname))
        libname = unique(libname);
        msg = sprintf('This command has updated only the blocks in the model ''%s''.\nThe following libraries also contain old versions of SimDriveline blocks: \n', getfullname(modelH));
        % 109 111
        % 110 111
        for i=1.0:length(libname)
            msg = horzcat(msg, sprintf('    %s \n', which(libname{i})));
        end % for
        msg1 = sprintf('Run %s(library_name) to update each library.\n', mfilename);
        msg = horzcat(msg, msg1);
        % 116 117
        warn_stat = warning('query', 'backtrace');
        warning('off', 'backtrace');
        warning(msg)
        warning(warn_stat);
    end % if
end % function
function drive_update_1_0_1(modelH)
    % 124 132
    % 125 132
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    % 131 132
    updateParName = 'SimDrivelineLibraryVersion';
    updateParValueOld = '1.0.1';
    updateParValueNew = '1.1';
    % 135 137
    % 136 137
    updateReferenceBlock = 'driveline/Gears/Differential';
    gearRatioParName = 'R';
    % 139 141
    % 140 141
    warnstat = warning('off');
    [lastmsg, lastid] = lastwarn;
    blocks = find_system(modelH, 'LookUnderMasks', 'all', 'FollowLinks', 'off', 'ReferenceBlock', updateReferenceBlock, updateParName, updateParValueOld);
    % 144 146
    % 145 146
    lastwarn(lastmsg, lastid);
    warning(warnstat);
    % 148 149
    for i=1.0:length(blocks)
        oldGearRatio = get_param(blocks(i), gearRatioParName);
        newGearRatio = horzcat('(', oldGearRatio, ') * 2');
        set_param(blocks(i), updateParName, updateParValueNew, gearRatioParName, newGearRatio);
        % 153 154
    end % for
    % 155 157
    % 156 157
    issue_library_updates_warning(modelH, updateReferenceBlock, updateParName, updateParValueOld);
end % function
