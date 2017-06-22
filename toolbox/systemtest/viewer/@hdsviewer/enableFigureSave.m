function enableFigureSave(f, status)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    set(findall(f, 'type', 'uimenu', 'label', 'Save Figure &As...'), 'Enable', status)
    set(findall(f, 'type', 'uimenu', 'label', '&Save Figure'), 'Enable', status)
    tb = findobj(allchild(f), 'type', 'uitoolbar', 'Tag', 'FigureToolBar');
    set(findobj(allchild(tb), 'tag', 'Standard.SaveFigure'), 'Enable', status)
end % function
