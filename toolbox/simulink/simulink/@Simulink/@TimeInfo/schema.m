function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = findpackage('Simulink');
    pparent = findpackage('tsdata');
    c = schema.class(p, 'TimeInfo', findclass(pparent, 'abstracttimemetadata'));
    c.Handle = 'off';
    % 12 14
    % 13 14
    p = schema.prop(c, 'Start', 'MATLAB array');
    p.SetFunction = [];
    schema.prop(c, 'End', 'MATLAB array');
    schema.prop(c, 'Increment', 'MATLAB array');
    p = schema.prop(c, 'Length', 'double');
    p.FactoryValue = 0.0;
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.AbortSet = 'on';
    p.AccessFlags.Copy = 'off';
    p.AccessFlags.Serialize = 'off';
    p.GetFunction = @getlength;
    p = schema.prop(c, 'Length_', 'double');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 28 29
    p = schema.prop(c, 'Format', 'string');
    p.Visible = 'off';
    p = schema.prop(c, 'Startdate', 'string');
    p.Visible = 'off';
end % function
