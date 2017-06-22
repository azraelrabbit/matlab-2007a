function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdadesignpanel');
    % 9 11
    % 10 11
    c = schema.class(pk, 'freqfirceqrip', findclass(pk, 'abstractfiltertypewfs'));
    % 12 13
    findclass(findpackage('siggui'), 'firceqripfreqspecs');
    % 14 15
    p = schema.prop(c, 'freqSpecType', 'fireqrip_FreqOpts');
    p.SetFunction = @setspectype;
    p.Description = 'spec';
    % 18 19
    p = schema.prop(c, 'DynamicSpec', 'schema.prop');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 22 23
    p = schema.prop(c, 'DynamicSpecListener', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
