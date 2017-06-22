function fileList = ssc_flip_trace(doTrace)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    if not(isunix)
        error('Please run this file on a unix machine');
    end % if
    % 31 33
    % 32 33
    fileList = '';
    fileList = horzcat(fileList, ' ', disableDirectory(doTrace, 'toolbox/physmod/simscape/simscape/@SSC'));
    fileList = horzcat(fileList, ' ', disableDirectory(doTrace, 'toolbox/physmod/mech/mech/@MECH/@SimMechanicsCC'));
end % function
function fileList = disableDirectory(doTrace, directory)
    % 38 40
    % 39 40
    status = 0.0;
    checkList = '';
    % 42 43
    oldPwd = pwd;
    cd(matlabroot);
    cd(directory);
    % 46 47
    enabledTrace = 'trace\(';
    disabledTrace = sprintf('%%%%\\ trace\\ disabled:\\ see\\ %s\\ %%%%\\ trace%%\\(', mfilename);
    % 49 50
    if doTrace
        searchFor = disabledTrace;
        replaceWith = enabledTrace;
    else
        searchFor = enabledTrace;
        replaceWith = disabledTrace;
    end % if
    % 57 58
    grepCmd = sprintf('grep -rl %s * | grep -v CVS | grep -v \\.m~ | grep -v ''^\\.nfs''', searchFor);
    [status, fileList] = system(grepCmd);
    % 60 61
    if not(isempty(fileList))
        fileList(eq(fileList, sprintf('\n'))) = ' ';
        % 63 64
        status = system(sprintf('chmod u+w %s', fileList));
        % 65 66
        replaceCmd = sprintf('perl -pi -e ''s/%s/%s/g'' %s ', searchFor, replaceWith, fileList);
        % 67 68
        [status, output] = system(replaceCmd);
        % 69 70
        [status, checkList] = system(grepCmd);
        checkList(eq(checkList, sprintf('\n'))) = ' ';
        % 72 73
    end % if
    % 74 75
    cd(oldPwd);
    % 76 77
    [status, fileList] = system(sprintf('echo %s | tr " " "\\n" | xargs -n 1 --replace=XX echo %s/XX', fileList, directory));
    % 78 79
    if ne(status, 0.0) || not(isempty(checkList))
        error('Something failed');
    end % if
end % function
