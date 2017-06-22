function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    parent = findclass(pk, 'abstractfilter');
    thisclass = schema.class(findpackage('mfilt'), 'abstractmultirate', parent);
    thisclass.Description = 'abstract';
    % 12 13
    pk.findclass('dfilt');
    p = schema.prop(thisclass, 'Filters', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
end % function
