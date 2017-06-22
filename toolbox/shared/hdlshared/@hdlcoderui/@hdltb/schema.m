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
    c = schema.class(pk, 'hdltb', parentcls);
    % 14 15
    schema.prop(c, 'UserDefined', 'on/off');
    % 16 18
    % 17 18
    m = schema.method(c, 'testbenchCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string','handle'};
    s.OutputTypes = {};
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    m = schema.method(c, 'getTabDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'mxArray'};
end % function
