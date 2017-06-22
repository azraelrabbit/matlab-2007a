function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'siggui');
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Tag', 'string');
    set(p, 'GetFunction', @get_tag);
    % 15 16
    p = schema.prop(c, 'Version', 'double');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 1.0;
    % 19 22
    % 20 22
    % 21 22
    p = vertcat(schema.prop(c, 'LinkDatabase', 'mxArray'), schema.prop(c, 'CSHMenu', 'double'));
    % 23 26
    % 24 26
    % 25 26
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off')
    set(p(2.0), 'FactoryValue', -1.0);
    % 28 29
    e = vertcat(schema.event(c, 'sigguiRendering'), schema.event(c, 'sigguiClosing'), schema.event(c, 'Notification'), schema.event(c, 'UserModifiedSpecs'));
    % 30 34
    % 31 34
    % 32 34
    % 33 34
end % function
function tag = get_tag(this, tag)
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    if isempty(tag)
        tag = class(this);
    end % if
end % function
