function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlcoderui');
    parentcls = findclass(pk, 'abstracthdlcomps');
    c = schema.class(pk, 'hdlconfigs', parentcls);
    % 11 12
    schema.prop(c, 'positionSchema', 'handle vector');
    schema.prop(c, 'Size', 'int32');
    schema.prop(c, 'selTableIndex', 'int32');
    schema.prop(c, 'blkImplementation', 'mxArray');
    schema.prop(c, 'defaultImplementation', 'mxArray');
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    m = schema.method(c, 'getTabDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'mxArray'};
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    m = schema.method(c, 'implementationlCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
end % function
