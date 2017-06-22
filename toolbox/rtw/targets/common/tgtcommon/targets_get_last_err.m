function msg = targets_get_last_err
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    err = lasterror;
    % 10 12
    msg = err.message;
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    exp = i_GetExpressionToRemove;
    msg = regexprep(msg, exp, '');
end
function e = i_GetExpressionToRemove
    % 21 24
    % 22 24
    persistent exp;
    if isempty(exp)
        % 25 27
        err = lasterror;
        % 27 30
        % 28 30
        try
            i_GenError;
        end % try
        str = lasterr;
        % 33 36
        % 34 36
        str = regexprep(str, horzcat(mfilename, '.*'), '');
        % 36 39
        % 37 39
        exp = horzcat(str, '.*?\n');
        % 39 42
        % 40 42
        lasterror(err);
    end
    e = exp;
end
function i_GenError
    error('Testing error string');
end
