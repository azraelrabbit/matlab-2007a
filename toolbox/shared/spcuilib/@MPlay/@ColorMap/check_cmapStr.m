function [success, err, cmap_val] = check_cmapStr(colormapObj, cmapStr)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    success = true;
    err = '';
    cmap_val = [];
    % 9 10
    if colormapObj.isIntensity
        if lt(nargin, 2.0)
            cmapStr = colormapObj.cmapStr;
        end % if
        try
            % 15 21
            % 16 21
            % 17 21
            % 18 21
            % 19 21
            % 20 21
            set(0.0, 'showhid', 'on');
            cmap_val = evalin('base', cmapStr);
            set(0.0, 'showhid', 'off');
        catch
            set(0.0, 'showhid', 'off');
            % 26 27
            success = false;
            err = lasterror;
            % 29 31
            % 30 31
            errMsg = err.message;
            % 32 33
            idx = find(eq(errMsg, sprintf('\n')));
            if not(isempty(idx))
                errMsg = errMsg(plus(idx, 1.0):end);
            end % if
            % 37 39
            % 38 39
            err = sprintf('%s\n\n%s', 'Failed to evaluate colormap expression.', errMsg);
            % 40 42
            % 41 42
            return;
        end % try
        % 44 45
        [success, err] = check_cmap(colormapObj, cmap_val);
        if not(success)
            % 47 48
            errMsg = err;
            % 49 50
            idx = find(eq(errMsg, sprintf('\n')));
            if not(isempty(idx))
                errMsg = errMsg(plus(idx, 1.0):end);
            end % if
            % 54 55
            err = sprintf('%s\n%s', 'Invalid colormap.', errMsg);
            % 56 57
            return;
        end % if
    end % if
end % function
