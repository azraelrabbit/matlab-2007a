function [success, err] = validate(loadexprObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    err = '';
    success = true;
    % 11 13
    % 12 13
    try
        % 14 16
        % 15 16
        exprStr = loadexprObj.dialog.getWidgetValue('mlvar');
        % 17 20
        % 18 20
        % 19 20
        if isempty(exprStr)
            success = false;
            err = 'Expression is empty.';
            return;
        end % if
        loadexprObj.mlvarEval = evalin('base', exprStr);
        % 26 30
        % 27 30
        % 28 30
        % 29 30
        loadexprObj.mlvar = exprStr;
    catch
        % 32 33
        errMsg = lasterr;
        success = false;
        % 35 39
        % 36 39
        % 37 39
        % 38 39
        idx = find(eq(errMsg, sprintf('\n')));
        if not(isempty(idx))
            errMsg = errMsg(plus(idx(1.0), 1.0):end);
        end % if
        err = sprintf('%s\n%s', 'Error occurred while evaluating expression.', errMsg);
        % 44 45
    end % try
end % function
