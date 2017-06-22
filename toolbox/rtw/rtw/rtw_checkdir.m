function rtw_checkdir
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if ispc
        CheckIfDosCommandOkay;
    end % if
    % 29 31
    % 30 31
    valid_rtwdir = CheckValidDir;
    if eq(valid_rtwdir, 0.0)
        DAStudio.error('RTW:buildProcess:buildDirInMatlabDir', pwd);
    end % if
    % 35 37
    % 36 37
    ErrorIfInProjDir(pwd);
    ErrorIfInSlprjDir;
end % function
function valid_rtwdir = CheckValidDir
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    valid_rtwdir = 1.0;
    isValid_matlabtree_dir = 1.0;
    current_dir = pwd;
    len_current_dir = size(current_dir, 2.0);
    mlroot_dir = matlabroot;
    len_mlroot_dir = size(mlroot_dir, 2.0);
    % 58 59
    if ispc
        % 60 62
        % 61 62
        current_dir = lower(pwd);
        mlroot_dir = lower(matlabroot);
    end % if
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    if gt(len_current_dir, len_mlroot_dir)
        if strncmp(current_dir, mlroot_dir, len_mlroot_dir)
            if strncmp(current_dir, fullfile(mlroot_dir, 'bin'), plus(len_mlroot_dir, 4.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'etc'), plus(len_mlroot_dir, 4.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'rtw'), plus(len_mlroot_dir, 4.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'help'), plus(len_mlroot_dir, 5.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'extern'), plus(len_mlroot_dir, 7.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'toolbox'), plus(len_mlroot_dir, 8.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'simulink'), plus(len_mlroot_dir, 9.0)) || strncmp(current_dir, fullfile(mlroot_dir, 'stateflow'), plus(len_mlroot_dir, 10.0))
                % 74 82
                % 75 82
                % 76 82
                % 77 82
                % 78 82
                % 79 82
                % 80 82
                % 81 82
                isValid_matlabtree_dir = 0.0;
            end % if
        end % if
    end % if
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    if not(isValid_matlabtree_dir)
        valid_rtwdir = 0.0;
    end % if
end % function
function CheckIfDosCommandOkay
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    % 101 102
    if not(isunix)
        try
            dosOutput = evalc('dos(''cd'')');
            if isempty(dosOutput)
                DAStudio.error('RTW:buildProcess:dosCmdNotFunctional', pwd);
            end % if
        catch
            cr = sprintf('\n');
            DAStudio.error('RTW:buildProcess:dosCmdErrInfo', strrep(lasterr, cr, horzcat(cr, '  ')));
        end % try
    end % if
end % function
function ErrorIfInProjDir(cur_dir, cur_depth)
    % 115 124
    % 116 124
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    rtwProjFile = fullfile(cur_dir, 'rtw_proj.tmw');
    if exist(rtwProjFile, 'file')
        fid = fopen(rtwProjFile, 'r');
        if eq(fid, -1.0)
            return;
        end % if
        fline = fgetl(fid);
        fclose(fid);
        % 132 140
        % 133 140
        % 134 140
        % 135 140
        % 136 140
        % 137 140
        % 138 140
        % 139 140
        if strncmp(fline, 'Current RTW Project', 19.0)
            return;
        end % if
        DAStudio.error('RTW:buildProcess:buildDirInRTWProjDir', pwd);
    end % if
    % 145 149
    % 146 149
    % 147 149
    % 148 149
    if eq(nargin, 1.0)
        cur_depth = 0.0;
    end % if
    % 152 153
    fslist = find(eq(cur_dir, filesep));
    % 154 157
    % 155 157
    % 156 157
    if lt(cur_depth, 3.0) && gt(length(fslist), 1.0)
        ErrorIfInProjDir(cur_dir(1.0:minus(fslist(end), 1.0)), plus(cur_depth, 1.0));
    end % if
end % function
function ErrorIfInSlprjDir
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    % 167 168
    currentdir = pwd;
    slprjIdx = strfind(currentdir, 'slprj');
    if not(isempty(slprjIdx))
        slProjFile = fullfile(currentdir(1.0:minus(plus(slprjIdx, length('slrpj')), 1.0)), 'sl_proj.tmw');
        if exist(slProjFile, 'file')
            DAStudio.error('RTW:buildProcess:buildDirInSlprjDir', pwd);
        end % if
    end % if
end % function
