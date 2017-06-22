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
    c = schema.class(pk, 'freqvector', findclass(pk, 'abstractfiltertypewfs'));
    c.Description = 'abstract';
    % 13 15
    % 14 15
    p = schema.prop(c, 'FrequencyVector', 'string');
    p.FactoryValue = '[0:.05:.55 .6 1]';
    p.Description = 'spec';
end % function
