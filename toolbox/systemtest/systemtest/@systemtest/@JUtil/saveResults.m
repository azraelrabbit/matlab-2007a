function tempVar = saveResults(tempVar, stresults, defaultPath)
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
    % 18 19
    viewerFile = stviewerstate('testfile');
    if not(isempty(viewerFile)) && strcmp(viewerFile, tempVar.st.resFile)
        % 21 24
        % 22 24
        % 23 24
        viewerstate = stviewerstate('viewerstate');
        tempVar.ViewerState = cellhorzcat(viewerstate);
        saveVarNames = {'stresults','viewerstate'};
    else
        saveVarNames = {'stresults'};
    end % if
    % 30 32
    % 31 32
    try
        save(tempVar.st.resFile, saveVarNames{:}, '-mat');
    catch
        % 35 39
        % 36 39
        % 37 39
        % 38 39
        tempVar.ViewerState = {};
        % 40 42
        % 41 42
        save(defaultPath, 'stresults', '-mat');
        tempVar.st.resFile = defaultPath;
        % 44 46
        % 45 46
        msg = sprintf('Unable to save test results as requested.');
        msg = sprintf('%sTest results are being saved as %s', msg, defaultPath);
        tempVar.st.m.publish('', 'Test running', 'Test received a warning', msg, 0.0);
    end % try
end % function
