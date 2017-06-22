function tornado_callback_handler(varargin)
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
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    ExtMode = findobj(dialogFig, 'Tag', 'External mode_CheckboxTag');
    Smode = findobj(dialogFig, 'Tag', 'StethoScope_CheckboxTag');
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    ExtModeTransport = findobj(dialogFig, 'Tag', 'Transport_PopupFieldTag');
    ExtModeStatic = findobj(dialogFig, 'Tag', 'Static memory allocation_CheckboxTag');
    ExtModeStaticSize = findobj(dialogFig, 'Tag', 'Static memory buffer size_EditFieldTag');
    % 26 27
    val = get(ExtMode, 'Value');
    if eq(val, 1.0)
        set(ExtModeTransport, 'Enable', 'on');
        set(ExtModeStatic, 'Enable', 'on');
        % 31 32
        valStatic = get(ExtModeStatic, 'Value');
        if eq(valStatic, 1.0)
            valStatic = 'on';
        else
            valStatic = 'off';
        end % if
        set(ExtModeStaticSize, 'Enable', valStatic);
    else
        % 40 41
        set(ExtModeTransport, 'Enable', 'off');
        set(ExtModeStatic, 'Enable', 'off');
        set(ExtModeStaticSize, 'Enable', 'off');
    end % if
    % 45 46
    if isequal(get(ExtMode, 'Value'), 0.0)
        % 47 48
        return;
    else
        % 50 51
        if eq(gcbo, ExtMode)
            % 52 55
            % 53 55
            % 54 55
            set(Smode, 'Value', 0.0);
        else
            % 57 59
            % 58 59
            set(ExtMode, 'Value', 0.0);
            set(ExtModeTransport, 'Enable', 'off');
            set(ExtModeStatic, 'Enable', 'off');
            set(ExtModeStaticSize, 'Enable', 'off');
        end % if
    end % if
end % function
