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
    c = schema.class(pk, 'freqstop2', findclass(pk, 'abstractfiltertypewfs'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'Fstop1', 'string');
    p.FactoryValue = '9600';
    p.Description = 'spec';
    % 17 18
    p = schema.prop(c, 'Fstop2', 'string');
    p.FactoryValue = '12000';
    p.Description = 'spec';
end % function
