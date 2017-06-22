function ert_callback_handler(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(nargin, 0.0)
        dialogFig = get(gcbo, 'Parent');
    else
        dialogFig = varargin{1.0};
    end % if
    % 12 13
    mfile = findobj(dialogFig, 'Tag', 'MAT-file logging_CheckboxTag');
    int_code = findobj(dialogFig, 'Tag', 'Integer code only_CheckboxTag');
    if isequal(get(mfile, 'Value'), 0.0)
        % 16 17
        return;
    else
        % 19 20
        if eq(gcbo, mfile)
            % 21 24
            % 22 24
            % 23 24
            set(int_code, 'Value', 0.0);
        else
            % 26 28
            % 27 28
            set(mfile, 'Value', 0.0);
        end % if
    end % if
end % function
