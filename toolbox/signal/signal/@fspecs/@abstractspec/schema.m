function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    c = schema.class(pk, 'abstractspec');
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'ResponseType', 'string');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
end % function
