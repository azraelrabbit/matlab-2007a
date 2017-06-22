function [oNameIfExists, oName] = rtw_hook_name(iTargetFile, iHook)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    oName = '';
    oNameIfExists = '';
    % 22 24
    % 23 24
    if not(strfind(lower(iTargetFile), '.tlc'))
        disp(horzcat('Warning: Unable to find .tlc extension in system target file: ', iTargetFile));
        iTargetFile = strtok(iTargetFile);
    else
        iTargetFile = iTargetFile(1.0:minus(plus(strfind(lower(iTargetFile), '.tlc'), length('.tlc')), 1.0));
    end % if
    % 30 31
    [aDummyPath, basename, ext] = fileparts(iTargetFile);
    oName = horzcat(basename, '_', iHook, '_hook');
    % 33 34
    if exist(horzcat(oName, '.m'), 'file')
        % 35 36
        oNameIfExists = oName;
        % 37 38
    end % if
end % function
