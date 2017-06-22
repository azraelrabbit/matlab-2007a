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
    c = schema.class(pk, 'lpfreqpassstop', findclass(pk, 'lpfreqpass'));
    % 12 13
    p = schema.prop(c, 'Fstop', 'string');
    p.FactoryValue = '12000';
    p.Description = 'spec';
end % function
