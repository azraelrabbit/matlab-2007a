function relativePath = rtw_relativize(absolutePath, anchorDir)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    match = findstr(absolutePath, anchorDir);
    if isempty(match)
        error(horzcat('Internal error: cannot find anchor ', anchorDir, 'in path ', absolutePath));
        % 12 13
    end % if
    % 14 16
    % 15 16
    if strcmp(anchorDir(end), filesep)
        % 17 18
        startIdx = plus(length(anchorDir), 1.0);
    else
        % 20 21
        startIdx = plus(length(anchorDir), 2.0);
    end % if
    relativePath = absolutePath(startIdx:end);
end % function
