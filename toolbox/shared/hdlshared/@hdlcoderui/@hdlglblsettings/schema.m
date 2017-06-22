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
    c = schema.class(pk, 'hdlglblsettings', parentcls);
    % 14 16
    % 15 16
    schema.prop(c, 'SplitEntity', 'bool');
    % 17 18
    p = schema.prop(c, 'HDLGSActiveTab', 'int');
    set(p, 'FactoryValue', 0.0, 'Visible', 'off');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    m = schema.method(c, 'getTabDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','handle'};
    s.OutputTypes = {'mxArray'};
end % function
