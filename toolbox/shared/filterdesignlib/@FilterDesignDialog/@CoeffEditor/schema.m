function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'CoeffEditor', pk.findclass('AbstractEditor'));
    % 10 11
    findclass(findpackage('dfilt'), 'basefilter');
    % 12 13
    p = schema.prop(c, 'FilterObject', 'dfilt.basefilter');
    set(p, 'SetFunction', @set_filterobject);
    % 15 16
    schema.prop(c, 'CoefficientVector1', 'string');
    schema.prop(c, 'CoefficientVector2', 'string');
    schema.prop(c, 'CoefficientVector3', 'string');
    schema.prop(c, 'CoefficientVector4', 'string');
    % 20 21
    schema.prop(c, 'PersistentMemory', 'on/off');
    % 22 23
    schema.prop(c, 'States', 'string');
    % 24 25
    p = schema.prop(c, 'FilterListener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 27 28
    m = schema.method(c, 'getDialogSchema');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','string'}, 'OutputTypes', {'mxArray'});
    % 30 32
    % 31 32
    m = schema.method(c, 'preApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','handle'}, 'OutputTypes', {'bool','string'});
end % function
