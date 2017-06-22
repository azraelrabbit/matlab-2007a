function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechJointActuatePanel');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'DynMechJointActuatePanel', hBaseObj);
    % 15 17
    % 16 17
    schema.prop(hThisClass, 'SelPrim', 'string');
    schema.prop(hThisClass, 'SelActStyle', 'string');
    % 19 21
    % 20 21
    m = schema.method(hThisClass, 'OnPrimSelectChange');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','mxArray','string'};
    s.OutputTypes = {};
end % function
