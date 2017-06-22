function s = siggui_getstate(hObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s = get(hObj);
    % 9 10
    if isrendered(hObj)
        s = rmfield(s, get(find(hObj.RenderedPropHandles, 'Visible', 'On'), 'Name'));
    end % if
end % function
