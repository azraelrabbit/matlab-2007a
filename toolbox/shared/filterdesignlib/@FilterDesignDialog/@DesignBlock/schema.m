function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'DesignBlock', findclass(findpackage('dspdialog'), 'DSPDDG'));
    % 10 12
    % 11 12
    findclass(pk, 'AbstractDesign');
    % 13 14
    schema.prop(c, 'CurrentDesigner', 'FilterDesignDialog.AbstractDesign');
    schema.prop(c, 'Block', 'double');
    % 16 17
    m = schema.method(c, 'getDialogSchema');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','string'}, 'OutputTypes', {'mxArray'});
    % 19 21
    % 20 21
    m = schema.method(c, 'postApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'bool','string'});
    % 23 25
    % 24 25
    m = schema.method(c, 'preApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'bool','string'});
end % function
