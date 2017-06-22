function [success, err] = validate(jumptoObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    err = '';
    success = true;
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    try
        % 22 25
        % 23 25
        % 24 25
        local_frame_str = jumptoObj.dialog.getWidgetValue('frame');
        local_frame = evalin('base', local_frame_str);
        % 27 29
        % 28 29
        [success, err] = CheckFrame(jumptoObj, local_frame);
        % 30 33
        % 31 33
        % 32 33
        if success
            jumptoObj.frameStr = local_frame_str;
            % 35 37
            % 36 37
            jumptoObj.frame = local_frame;
        end % if
    catch
        errMsg = lasterr;
        success = false;
        % 42 46
        % 43 46
        % 44 46
        % 45 46
        idx = find(eq(errMsg, sprintf('\n')));
        if not(isempty(idx))
            errMsg = errMsg(plus(idx(1.0), 1.0):end);
        end % if
        err = sprintf('%s\n%s', 'Error occurred while evaluating expression.', errMsg);
        % 51 53
        % 52 53
        return;
    end % try
end % function
