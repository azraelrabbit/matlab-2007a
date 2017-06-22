function pos = renderlabelsnvalues(hObj, pos)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    sz = gui_sizes(hObj);
    % 8 12
    % 9 12
    % 10 12
    render(getcomponent(hObj, 'siggui.labelsandvalues'), hObj.FigureHandle, horzcat(plus(pos(1.0), sz.hfus), pos(2.0), minus(pos(3.0), mtimes(3.0, sz.hfus)), minus(minus(minus(pos(4.0), sz.uh), sz.vfus), mtimes(3.0, sz.uuvs))));
end % function
