function makeInfo = rtwmakecfg
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    makeInfo.includePath = cellhorzcat(fullfile(matlabroot, 'toolbox', 'physmod', 'powersys', 'facts', 'facts'), fullfile(matlabroot, 'toolbox', 'physmod', 'powersys', 'DR', 'DR'));
    % 11 14
    % 12 14
    % 13 14
    makeInfo.sourcePath = cellhorzcat(fullfile(matlabroot, 'toolbox', 'physmod', 'powersys', 'powersys'));
end % function
