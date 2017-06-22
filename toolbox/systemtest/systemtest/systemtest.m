function systemtest(testfile)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    error(nargchk(0.0, 1.0, nargin, 'struct'))
    % 13 16
    % 14 16
    try
        systemtest.JSimulink.getRoot;
        % 17 20
        % 18 20
    end % try
    % 20 23
    % 21 23
    if eq(nargin, 0.0)
        com.mathworks.toolbox.systemtest.studio.STDesktop.launch;
        return;
    end % if
    % 26 29
    % 27 29
    if isempty(testfile) || not(ischar(testfile))
        error('systemtest:systemtest:invalidType', 'TESTFILE must be specified as a non-empty string.');
    end % if
    % 31 34
    % 32 34
    if isempty(regexp(lower(testfile), '\.test', 'once'))
        testfile = strcat(testfile, '.test');
    end % if
    % 36 40
    % 37 40
    % 38 40
    testPath = which(testfile);
    % 40 42
    if isempty(testPath)
        % 42 44
        if not(exist(testfile, 'file'))
            % 44 46
            error('systemtest:systemtest:doesNotExist', 'TESTFILE does not exist.');
        else
            % 47 51
            % 48 51
            % 49 51
            fileToLaunch = testfile;
        end % if
    else
        % 53 56
        % 54 56
        fileToLaunch = testPath;
    end % if
    % 57 60
    % 58 60
    com.mathworks.toolbox.systemtest.studio.STDesktop.launch(fileToLaunch);
