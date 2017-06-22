function [mechEnv, delim, visConfigFile] = mech_splitBlocksetData(blocksetDataString)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    delim = '$$$';
    if isempty(blocksetDataString)
        mechEnv = '';
        visConfigFile = '';
        return;
    end % if
    pos = findstr(delim, blocksetDataString);
    if isempty(pos)
        mechEnv = blocksetDataString;
        visConfigFile = '';
    else
        pos = pos(end);
        if gt(pos(end), 1.0)
            mechEnv = blocksetDataString(1.0:minus(pos, 1.0));
        else
            mechEnv = '';
        end % if
        visConfigFile = blocksetDataString(plus(pos, length(delim)):end);
    end % if
end % function
