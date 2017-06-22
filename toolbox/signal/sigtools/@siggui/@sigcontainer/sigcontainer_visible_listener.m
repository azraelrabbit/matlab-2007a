function sigcontainer_visible_listener(hObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    siggui_visible_listener(hObj, varargin{:});
    % 10 12
    % 11 12
    Children = allchild(hObj);
    if strcmpi(get(hObj, 'Visible'), 'on')
        Children = find(Children, '-depth', 0.0, '-not', '-isa', 'siggui.dialog');
    end % if
    % 16 17
    for indx=1.0:length(Children)
        if isrendered(Children(indx))
            set(Children(indx), 'Visible', hObj.Visible);
        end % if
    end % for
end % function
