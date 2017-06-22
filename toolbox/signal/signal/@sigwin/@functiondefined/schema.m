function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigwin');
    % 9 10
    c = schema.class(pk, 'functiondefined', pk.findclass('variablelength'));
    % 11 13
    % 12 13
    schema.prop(c, 'MATLABExpression', 'string');
    schema.prop(c, 'Parameters', 'mxArray');
    % 15 17
    % 16 17
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 'User Defined');
    % 19 20
    p = schema.prop(c, 'MATLAB_expression', 'string');
    set(p, 'Visible', 'Off', 'SetFunction', @setmatlab_expression, 'GetFunction', @getmatlab_expression);
    % 22 23
end % function
function me = setmatlab_expression(this, me)
    % 25 28
    % 26 28
    % 27 28
    set(this, 'MATLABExpression', me);
    me = '';
end % function
function me = getmatlab_expression(this, me)
    % 32 34
    % 33 34
    me = get(this, 'MATLABExpression');
end % function
