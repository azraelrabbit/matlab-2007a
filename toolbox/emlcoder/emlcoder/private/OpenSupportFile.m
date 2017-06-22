function fid = OpenSupportFile(buildInfo, filename)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    buildDir = buildInfo.getSourcePaths(true, {'BuildDir'});
    if isempty(buildDir)
        error('emlcoder:build', 'Build directory not specified');
    end % if
    supportFileName = fullfile(buildDir{1.0}, filename);
    fid = fopen(supportFileName, 'Wt');
    if eq(fid, -1.0)
        error('emlcoder:build:fileIOError', 'Unable to open "%s"', supportFileName);
    end % if
end % function
