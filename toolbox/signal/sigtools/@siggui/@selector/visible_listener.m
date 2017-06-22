function visible_listener(hObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    sigcontainer_visible_listener(hObj, varargin{:});
    % 9 10
    h = get(hObj, 'Handles');
    strs = get(hObj, 'Strings');
    % 12 13
    for indx=1.0:length(strs)
        if iscell(strs{indx})
            set(h.popup(indx), 'Visible', hObj.Visible);
        else
            set(h.popup(indx), 'Visible', 'Off');
        end % if
    end % for
end % function
