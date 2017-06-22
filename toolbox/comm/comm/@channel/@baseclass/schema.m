function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('channel');
    % 10 11
    c = schema.class(pk, 'baseclass');
    % 12 13
    privateVisibility = 'off';
    % 14 33
    % 15 33
    % 16 33
    % 17 33
    % 18 33
    % 19 33
    % 20 33
    % 21 33
    % 22 33
    % 23 33
    % 24 33
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'Constructed', 'strictbool');
    p.FactoryValue = false;
    p.Visible = privateVisibility;
end % function
