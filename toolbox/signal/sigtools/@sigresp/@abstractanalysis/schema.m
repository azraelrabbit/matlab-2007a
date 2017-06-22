function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigresp');
    % 9 11
    % 10 11
    c = schema.class(pk, 'abstractanalysis', findclass(findpackage('siggui'), 'sigcontainer'));
    % 12 13
    c.Description = 'abstract';
    % 14 16
    % 15 16
    schema.prop(c, 'FastUpdate', 'on/off');
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(c, 'Parameters', 'handle vector');
    % 22 24
    % 23 24
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
    % 25 26
    p = vertcat(schema.prop(c, 'StaticParameters', 'string vector'), schema.prop(c, 'DisabledParameters', 'string vector'));
    % 27 30
    % 28 30
    % 29 30
    set(p, 'Visible', 'Off');
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(c, 'Name', 'string');
    % 35 37
    % 36 37
    set(p, 'GetFunction', @getname);
    % 38 41
    % 39 41
    % 40 41
    schema.event(c, 'DisabledListChanged');
    % 42 44
    % 43 44
    schema.event(c, 'NewPlot');
end % function
