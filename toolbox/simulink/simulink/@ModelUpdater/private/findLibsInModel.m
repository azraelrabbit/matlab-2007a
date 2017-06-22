function libs = findLibsInModel(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    libLinks = find_system(h.MyModel, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'LinkStatus', 'resolved');
    % 8 10
    % 9 10
    srcBlocks = get_param(libLinks, 'ReferenceBlock');
    libs = cell(size(srcBlocks));
    for i=1.0:length(srcBlocks)
        srcBlock = srcBlocks{i};
        slashIdx = findstr(srcBlock, '/');
        libs{i} = srcBlock(1.0:minus(slashIdx(1.0), 1.0));
    end % for
    % 17 18
    [ignoreText, libInfo] = sldiagnostics(h.MyModel, 'libs');
    if isempty(libInfo)
        libs = [];
    else
        libs = horzcat(libInfo(:).libName);
    end % if
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    nLibs = length(libs);
    % 32 33
    if gt(nLibs, 0.0)
        % 34 35
        toolboxBaseDir = fullfile(matlabroot, 'toolbox');
        lenBaseStr = length(toolboxBaseDir);
        % 37 38
        idxKeep = repmat(true, nLibs, 1.0);
        % 39 40
        for iLib=1.0:nLibs
            % 41 42
            curLib = libs{iLib};
            % 43 44
            if strncmp(curLib, 'simulink', 8.0) || strncmp(which(curLib), toolboxBaseDir, lenBaseStr)
                % 45 47
                % 46 47
                idxKeep(iLib) = false;
            end % if
        end % for
        % 50 51
        libs = libs(idxKeep);
    end % if
    % 53 54
end % function
