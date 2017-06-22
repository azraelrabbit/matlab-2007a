function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    pk = findpackage('hdlcoderui');
    parentcls = findclass(pk, 'abstracthdlcomps');
    c = schema.class(pk, 'hdledas', parentcls);
    % 14 15
    findclass(findpackage('hdlcoderprops'), 'CLI');
    p = schema.prop(c, 'CLIProperties', 'hdlcoderprops.CLI');
    p.AccessFlags.PublicSet = 'off';
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    m = schema.method(c, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 34 36
    % 35 36
    p = schema.prop(c, 'ScriptSelection', 'mxArray');
    p.FactoryValue = 0.0;
    % 38 39
    m = schema.method(c, 'edahelp');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
end % function
