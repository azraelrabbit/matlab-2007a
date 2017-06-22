function [success, errorMessage] = rtw_mk_dir(parentDirName, childDirName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    wd = cd(parentDirName);
    [s, errorMessage] = system(horzcat('mkdir "', childDirName, '"'));
    cd(wd);
    success = not(s);
end % function
