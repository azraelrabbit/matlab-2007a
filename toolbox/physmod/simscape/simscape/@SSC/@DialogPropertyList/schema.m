function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('SSC');
    cls = schema.class(pkg, 'DialogPropertyList');
    % 9 10
    a = SSC.DialogProperty;
    pP = schema.prop(cls, 'Properties', horzcat(class(a), ' vector'));
    pP.AccessFlags.PublicSet = 'off';
    % 13 14
    m = schema.method(cls, 'setupDialogProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    % 18 20
    % 19 20
    s.OutputTypes = {};
end % function
