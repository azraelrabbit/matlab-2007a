function rtwrebuild(varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    savedpwd = pwd;
    if gt(nargin, 0.0)
        if isdir(varargin{1.0})
            buildDir = varargin{1.0};
        else
            stfName = get_param(varargin{1.0}, 'RTWSystemTargetFile');
            buildDir = fullfile(savedpwd, horzcat(varargin{1.0}, '_', strtok(stfName, '.'), '_rtw'));
            if ne(exist(buildDir, 'dir'), 7.0)
                DAStudio.error('RTW:buildProcess:buildDirNotFound', buildDir, varargin{1.0});
                % 27 29
            end
        end
        cd(buildDir);
    else
        buildDir = savedpwd;
    end
    % 34 36
    try
        if not(exist('rtw_proj.tmw', 'file'))
            DAStudio.error('RTW:buildProcess:buildDirInvalid', pwd);
        end
        rtwProjFile = fullfile(pwd, 'rtw_proj.tmw');
        fid = fopen(rtwProjFile, 'r');
        if eq(fid, -1.0)
            DAStudio.error('RTW:utility:fileIOError', rtwProjFile, 'open');
        end
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        for i=1.0:4.0
            rtwProjLine = fgetl(fid);
        end % for
        fclose(fid);
        if ischar(rtwProjLine)
            rtwinfomatfile = deblank(strrep(rtwProjLine, 'The rtwinfomat located at: ', ''));
        else
            DAStudio.error('RTW:buildProcess:buildDirInvalid', pwd);
        end
        if ne(exist(rtwinfomatfile, 'file'), 2.0)
            DAStudio.error('RTW:buildProcess:buildDirInvalid', pwd);
        end
        load(rtwinfomatfile);
        % 61 63
        subrebuildCommandPath = infoStruct.directlinkLibrariesFullPaths;
        for idxrebuildCommandFile=1.0:length(subrebuildCommandPath)
            cd(fullfile(infoStruct.relativePathToAnchor, fileparts(subrebuildCommandPath{idxrebuildCommandFile})));
            rtwrebuild;
            cd(buildDir);
        end % for
        % 68 72
        % 69 72
        % 70 72
        makeCmd = getProp(infoStructConfigSet, 'MakeCommand');
        useRelativePaths = parsestrforvar(makeCmd, 'USE_MDLREF_LIBPATHS');
        % 73 75
        if isempty(useRelativePaths)
            useRelativePaths = '0';
        end
        % 77 80
        % 78 80
        useRelativePaths = strcmp(useRelativePaths, '1') || ismac;
        % 80 82
        if not(useRelativePaths)
            % 82 84
            for idxLinkLibraries=1.0:length(infoStruct.linkLibrariesFullPaths)
                srcLib = fullfile(infoStruct.relativePathToAnchor, infoStruct.linkLibrariesFullPaths{idxLinkLibraries});
                % 85 87
                [srcLibpath, srcLibname, srcLibext] = fileparts(srcLib);
                dstLib = fullfile(buildDir, horzcat(srcLibname, srcLibext));
                if gt(cmpTimeFlag(dstLib, srcLib), 0.0)
                    % 89 91
                    rtw_copy_file(srcLib, buildDir);
                end
            end % for
        end
        cd(buildDir);
        makeCmd = infoStruct.makeCmd;
        if isunix
            % 97 101
            % 98 101
            % 99 101
            makeCmd = strrep(makeCmd, '$(MATLAB_ROOT)', matlabroot);
            % 101 104
            % 102 104
            makeCmd = horzcat(makeCmd, ' MATLAB_ROOT=', matlabroot);
        end
        system(makeCmd);
        cd(savedpwd);
    catch
        cd(savedpwd);
        rethrow(lasterror);
    end % try
end
