function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('adaptalg');
    % 10 12
    % 11 12
    c = schema.class(pk, 'baseclass');
    c.Description = 'abstract';
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'AlgType', 'string');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    % 22 24
    % 23 24
    p = schema.prop(c, 'nWeights', 'posint');
    p.FactoryValue = 1.0;
    p.SetFunction = @set_nWeights;
    p.GetFunction = @get_nWeights;
    p.Visible = 'off';
    % 29 31
    % 30 31
    p = schema.prop(c, 'BlindMode', 'strictbool');
    p.FactoryValue = 0.0;
    p.Visible = 'off';
    % 34 36
    % 35 36
    p = schema.prop(c, 'nWeightsPrivate', 'posint');
    p.FactoryValue = 1.0;
    p.Visible = 'off';
end % function
