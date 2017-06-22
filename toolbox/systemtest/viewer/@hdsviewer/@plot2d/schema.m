function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    superclass = findclass(findpackage('hdsviewer'), 'plot');
    c = schema.class(findpackage('hdsviewer'), 'plot2d', superclass);
end % function
