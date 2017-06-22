function WorkDir = getWorkDir(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if gt(nargin, 1.0)
        CheckOnly = strcmp(varargin{1.0}, 'CheckOnly');
    else
        CheckOnly = false;
    end % if
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    rtw_checkdir;
    % 17 20
    % 18 20
    rtwprivate('modelrefutil', '', 'rtw_checkslprjdir', pwd);
    % 20 22
    if not(CheckOnly)
        try
            rtwprivate('modelrefutil', '', 'createSlprjMarkerFile', pwd);
        catch
            disp(lasterr);
            DAStudio.error('Simulink:tools:MANeedWrittableWorkDir', pwd);
        end % try
    end % if
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    pathArray = {};
    parentSystem = get_param(this.System, 'Parent');
    pathArray{1.0} = modeladvisorprivate('HTMLjsencode', get_param(this.System, 'Name'), 'encode');
    pathArray{1.0} = horzcat(pathArray{1.0}{:});
        while not(isempty(parentSystem))
        pathArray{plus(end, 1.0)} = modeladvisorprivate('HTMLjsencode', get_param(parentSystem, 'Name'), 'encode');
        pathArray{end} = horzcat(pathArray{end}{:});
        parentSystem = get_param(parentSystem, 'Parent');
    end % while
    % 46 48
    if not(CheckOnly)
        WorkDir = rtwprivate('rtw_create_directory_path', pwd, 'slprj', 'modeladvisor', pathArray{end:-1.0:1.0});
    else
        WorkDir = fullfile(pwd, 'slprj', 'modeladvisor', pathArray{end:-1.0:1.0});
        return;
    end % if
    % 53 56
    % 54 56
    srcPicture = fullfile(matlabroot, 'toolbox', 'simulink', 'simulink', 'modeladvisor', 'private', '*.png');
    if not(exist(fullfile(WorkDir, 'folder.png'), 'file'))
        copyfile(srcPicture, WorkDir);
        % 58 60
        vandvMatSrc = fullfile(matlabroot, 'toolbox', 'simulink', 'simulink', 'private', 'sigbuilder_images.mat');
        if eq(exist(vandvMatSrc, 'file'), 2.0)
            load(vandvMatSrc);
            imwrite(stvbmp.vnv_btn, fullfile(WorkDir, 'vandv.png'), 'PNG');
        else
            copyfile(fullfile(WorkDir, 'vandvback.png'), fullfile(WorkDir, 'vandv.png'));
        end % if
    end % if
    % 67 69
    return;
    % 69 72
    % 70 72
    if isunix
        [status, uid] = system('whoami');
        uid = strrep(uid, sprintf('\n'), '');
        WorkDir = fullfile(tempdir, uid, 'modeladvisor');
    else
        WorkDir = fullfile(tempdir, 'modeladvisor');
    end % if
    if not(exist(WorkDir))
        [parentDir, subDir] = fileparts(WorkDir);
        mkdir(parentDir, subDir);
    end % if
function createWorkingDir
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    testdir = tempname;
    seps = findstr(testdir, filesep);
    testdir = horzcat(testdir(1.0:seps(end)), 'search_', testdir(plus(seps(end), 1.0):end));
        while exist(testdir)
        testdir = tempname;
        seps = findstr(testdir, filesep);
        testdir = horzcat(testdir(1.0:seps(end)), 'search_', testdir(plus(seps(end), 1.0):end));
    end % while
    % 95 97
    [status, msg] = mkdir(tempdir, strrep(testdir, tempdir, ''));
