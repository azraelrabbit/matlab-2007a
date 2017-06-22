function strErrMsg = formatErrMsg(strErrMsg)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    strErrMsg = regexprep(strErrMsg, '^.+test\d+\s', '');
    % 17 19
    % 18 19
    strErrMsg = regexprep(strErrMsg, '^.+test\d+main\s', '');
    % 20 22
    % 21 22
    strErrMsg = regexprep(strErrMsg, '^.+test\d+post\s', '');
    % 23 25
    % 24 25
    strErrMsg = regexprep(strErrMsg, '^.+Column: \d+\s', '');
    % 26 28
    % 27 28
    strErrMsg = regexprep(strErrMsg, 'at \d+\s', '');
end % function
