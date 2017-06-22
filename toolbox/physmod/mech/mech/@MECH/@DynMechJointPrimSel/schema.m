function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechJointPrimSel');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DynMechJointPrimSel', hBaseObj);
    % 14 16
    % 15 16
    p = schema.prop(hThisClass, 'SrcObject', 'handle');
    p = schema.prop(hThisClass, 'ObjectMethod', 'string');
    p = schema.prop(hThisClass, 'MatlabMethod', 'mxArray');
    % 19 22
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 27 29
    % 28 29
    m = schema.method(hThisClass, 'OnSelectChange');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','mxArray','string'};
end % function
