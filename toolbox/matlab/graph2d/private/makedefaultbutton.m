function border = makedefaultbutton(uic)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    parent = get(uic, 'Parent');
    oldUnits = get(uic, 'Units');
    color = get(uic, 'ForegroundColor');
    set(uic, 'Units', 'pixels');
    pos = get(uic, 'Position');
    border = axes('Units', 'pixels', 'Position', pos, 'Parent', parent, 'XTick', [], 'YTick', [], 'ZTick', [], 'Color', 'none', 'XColor', color, 'YColor', color, 'Box', 'on');
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    set(uic, 'Position', plus(pos, [1.0 1.0 -2.0 -2.0]));
    set(uic, 'Units', oldUnits);
end % function
