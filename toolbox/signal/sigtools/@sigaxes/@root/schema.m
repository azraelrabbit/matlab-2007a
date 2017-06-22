function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigaxes');
    c = schema.class(pk, 'root', findclass(findpackage('siggui'), 'siggui'));
    % 10 12
    % 11 12
    schema.prop(c, 'ButtonDownFcn', 'MATLAB array');
    schema.prop(c, 'UIContextMenu', 'MATLAB array');
    schema.prop(c, 'Current', 'on/off');
    schema.prop(c, 'Real', 'double');
    schema.prop(c, 'Imaginary', 'double');
    % 17 19
    % 18 19
    p = schema.prop(c, 'Conjugate', 'on/off');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 21 22
    schema.event(c, 'NewValue');
end % function
