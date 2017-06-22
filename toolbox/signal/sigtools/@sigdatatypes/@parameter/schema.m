function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigdatatypes');
    % 9 10
    c = schema.class(pk, 'parameter');
    % 11 12
    p = vertcat(schema.prop(c, 'Name', 'string'), schema.prop(c, 'Tag', 'string'), schema.prop(c, 'ValidValues', 'MATLAB array'));
    % 13 15
    % 14 15
    set(p, 'AccessFlags.PublicSet', 'off');
    p(3.0).GetFunction = @getvalidvalues;
    % 17 18
    p = vertcat(schema.prop(c, 'DisabledOptions', 'double_vector'), schema.prop(c, 'AllOptions', 'string vector'), schema.prop(c, 'DefaultValue', 'MATLAB array'));
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 25 26
    schema.event(c, 'NewValue');
    schema.event(c, 'UserModified');
    schema.event(c, 'NewValidValues');
    schema.event(c, 'ForceUpdate');
end % function
