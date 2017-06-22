function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    c = schema.class(pk, 'multistage', pk.findclass('basefilter'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'FilterStructure', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    schema.prop(c, 'Stage', 'dfilt.basefilter vector');
    % 16 18
    % 17 18
    p = schema.prop(c, 'Section', 'dfilt.basefilter vector');
    siguddutils('setupobsolete', p, 'Stage');
end % function
