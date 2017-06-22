function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('siggui');
    % 10 11
    c = schema.class(pk, 'mousezoom');
    % 12 14
    % 13 14
    p(1.0) = schema.prop(c, 'FigureHandle', 'double');
    p(1.0).AccessFlags.PublicGet = 'on';
    p(1.0).AccessFlags.PublicSet = 'off';
    % 17 19
    % 18 19
    p(2.0) = schema.prop(c, 'zoomState', 'String');
    p(2.0).AccessFlags.PublicGet = 'on';
    p(2.0).AccessFlags.PublicSet = 'on';
    % 22 24
    % 23 24
    p(3.0) = schema.prop(c, 'btnHndls', 'double_vector');
    p(3.0).AccessFlags.PublicGet = 'on';
    p(3.0).AccessFlags.PublicSet = 'off';
    % 27 29
    % 28 29
    p(4.0) = schema.prop(c, 'menuHndls', 'double_vector');
    p(4.0).AccessFlags.PublicGet = 'on';
    p(4.0).AccessFlags.PublicSet = 'off';
    % 32 35
    % 33 35
    % 34 35
    p(5.0) = schema.prop(c, 'axesInfo', 'MATLAB array');
    p(5.0).AccessFlags.PublicGet = 'off';
    p(5.0).AccessFlags.PublicSet = 'off';
    % 38 40
    % 39 40
    p(6.0) = schema.prop(c, 'currentAxes', 'double_vector');
    p(6.0).AccessFlags.PublicGet = 'off';
    p(6.0).AccessFlags.PublicSet = 'off';
    % 43 45
    % 44 45
    p(7.0) = schema.prop(c, 'hLines', 'double_vector');
    p(7.0).AccessFlags.PublicGet = 'off';
    p(7.0).AccessFlags.PublicSet = 'off';
    % 48 51
    % 49 51
    % 50 51
    p(8.0) = schema.prop(c, 'axesOrder', 'double_vector');
    p(8.0).AccessFlags.PublicGet = 'off';
    p(8.0).AccessFlags.PublicSet = 'off';
    % 54 57
    % 55 57
    % 56 57
    p(9.0) = schema.prop(c, 'axesFlag', 'MATLAB array');
    p(9.0).AccessFlags.PublicGet = 'off';
    p(9.0).AccessFlags.PublicSet = 'off';
    % 60 63
    % 61 63
    % 62 63
    p(10.0) = schema.prop(c, 'axesState', 'MATLAB array');
    p(10.0).AccessFlags.PublicGet = 'off';
    p(10.0).AccessFlags.PublicSet = 'off';
end % function
