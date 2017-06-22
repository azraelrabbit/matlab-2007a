function schema
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    slPkg = findpackage('Simulink');
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    c = schema.class(slPkg, 'rect');
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    pLeft = schema.prop(c, 'left', 'int32');
    pTop = schema.prop(c, 'top', 'int32');
    pRight = schema.prop(c, 'right', 'int32');
    pBottom = schema.prop(c, 'bottom', 'int32');
end % function
