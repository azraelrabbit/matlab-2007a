function stowe_away_tlc_logs_for_testing(model, buildDir, tlcLogsSaveDir)
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
    currDir = pwd;
    chdir(buildDir)
    try
        StowAwayTLCLogs(model, tlcLogsSaveDir);
        % 16 18
    end % try
    chdir(currDir);
end % function
function StowAwayTLCLogs(model, tlcLogsSaveDir)
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    callStack = dbstack('-completenames');
    idx = length(callStack);
    found = 0.0;
    for idx=length(callStack):-1.0:2.0
        if isequal('testdrive', callStack(idx).name)
            found = 1.0;
            idx = minus(idx, 1.0);
            break
        end % if
    end % for
    % 43 45
    if found
        tester = callStack(idx).file;
        subdirname = tester;
        seps = findstr(filesep, subdirname);
        subdirname(1.0:seps(end)) = [];
        dotm = findstr('.m', subdirname);
        subdirname(dotm) = '_';
        subdirname(plus(dotm, 1.0)) = [];
        subdirname = horzcat(subdirname, callStack(idx).name);
    else
        tester = '?';
        % 55 57
        subdirname = pwd;
        seps = findstr(filesep, subdirname);
        subdirname(1.0:seps(end)) = [];
    end % if
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    logdir = fullfile(tlcLogsSaveDir, subdirname);
    % 65 67
    n = 1.0;
    origSubDir = subdirname;
        while exist(logdir)
        subdirname = horzcat(origSubDir, '_', num2str(n));
        logdir = fullfile(tlcLogsSaveDir, subdirname);
        n = plus(n, 1.0);
    end % while
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    [status, msg] = mkdir(tlcLogsSaveDir, subdirname);
    if strncmp(computer, 'SGI', 3.0)
        sgiOk = 3.0;
            while sgiOk
            sgiOk = minus(sgiOk, 1.0);
            if ne(status, 1.0)
                disp(horzcat(' *** status returned : ', num2str(status)));
                disp(horzcat('%ls -d ', tempdir));
                eval(horzcat('!ls -d ', tempdir));
                disp(' *** Trying again ...');
                [status, msg] = mkdir(tempdir, strrep(testdir, tempdir, ''));
            end % if
        end % while
    end % if
    % 91 93
    if not(isempty(msg))
        disp('Error in ==> stow_away_tlc_logs_for_testing.m: Unable to create test directory for saving TLC logs');
        % 94 96
        disp(msg);
        return;
    end % if
    % 98 105
    % 99 105
    % 100 105
    % 101 105
    % 102 105
    % 103 105
    if isunix
        [s, msg] = unix(horzcat('\mv -f *.log ', logdir, '/'));
        if ne(s, 0.0)
            disp(horzcat('Error in ==> stow_away_tlc_logs_for_testing.m: ', 'Unable to "mv -f *.log ', logdir, '"'));
            % 108 110
            disp(msg);
        end % if
    else
        % 112 114
        temp = dir('*.log');
        logfiles = {};
        for m=1.0:size(temp, 1.0)
            logfiles{m} = temp(m).name;
        end % for
        % 118 120
        for i=1.0:length(logfiles)
            logfile = logfiles{i};
            dest = fullfile(logdir, logfile);
            [status, msg] = rtw_copy_file(logfile, dest);
            if not(isempty(msg))
                disp(horzcat('Error in ==> stow_away_tlc_logs_for_testing.m: ', 'Unable to copy tlc log file ', logfile, ' to ', dest));
                % 125 128
                % 126 128
                disp(msg);
                return;
            end % if
            rtw_delete_file(logfile);
        end % for
    end % if
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    readme = fullfile(logdir, 'readme.txt');
    fid = fopen(readme, 'w');
    if eq(fid, -1.0)
        disp(horzcat('Unable to create ', readme));
        return;
    end % if
    % 144 146
    fprintf(fid, 'Tester: %s\n', tester);
    fprintf(fid, 'Model: %s\n', model);
    fprintf(fid, 'ModelPath: %s\n', which(model));
    fprintf(fid, 'SystemTargetFile: %s\n', get_param(model, 'RTWSystemTargetFile'));
    % 149 151
    fprintf(fid, 'TemplateMakefile: %s\n', get_param(model, 'RTWTemplateMakefile'));
    % 151 153
    fprintf(fid, 'MakeCommand: %s\n', get_param(model, 'RTWMakeCommand'));
    % 153 155
    fprintf(fid, 'RTWInlineParameters: %s\n', get_param(model, 'RTWInlineParameters'));
    % 155 157
    fprintf(fid, 'RTWOptions: %s\n', get_param(model, 'RTWOptions'));
    % 157 160
    % 158 160
    fclose(fid);
    % 160 162
    disp(' ');
    disp(horzcat('Log files have been placed in ', logdir));
    disp(' ');
end % function
