function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'firceqripinvsincoptsframe', pk.findclass('firceqripoptsframe'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'invSincFreqFactor', 'string');
    p.Description = 'The value of c in the equation 1/sinc(c*f)^p. [c < 1/wo]:';
    p.FactoryValue = '1';
    % 17 19
    % 18 19
    p = schema.prop(c, 'invSincPower', 'string');
    p.Description = 'The value of p in the equation 1/sinc(c*f)^p:';
    p.FactoryValue = '1';
end % function
