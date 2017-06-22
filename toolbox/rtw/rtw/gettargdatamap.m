function targDataMap = gettargdatamap(relBuildDir, name)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    origDir = cd;
    % 11 12
    try
        buildDir = fullfile(origDir, relBuildDir);
        cd(buildDir);
        % 15 16
        targDataMap = feval(name);
    catch
        % 18 19
        cd(origDir);
        rethrow(lasterror);
        % 21 22
    end % try
    % 23 24
    cd(origDir);
end % function
