function f = ne_private_from_dir(functionName, dirName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    curdir = pwd;
    cd(dirName);
    f = eval(horzcat('@', functionName));
    cd(curdir);
end % function
