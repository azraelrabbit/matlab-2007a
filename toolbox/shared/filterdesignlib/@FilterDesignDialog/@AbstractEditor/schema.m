function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    DAStudio.Object;
    % 9 10
    pk = findpackage('FilterDesignDialog');
    c = schema.class(pk, 'AbstractEditor', findclass(findpackage('DAStudio'), 'Object'));
    set(c, 'Description', 'abstract');
    % 13 14
    schema.prop(c, 'ActiveTab', 'int32');
    % 15 16
    schema.prop(c, 'FixedPoint', 'mxArray');
    % 17 18
    schema.event(c, 'DialogApplied');
    % 19 20
    m = schema.method(c, 'preApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle','handle'}, 'OutputTypes', {'bool','string'});
    % 22 24
    % 23 24
    m = schema.method(c, 'postApply');
    set(m.Signature, 'varargin', 'off', 'InputTypes', {'handle'}, 'OutputTypes', {'bool','string'});
end % function
