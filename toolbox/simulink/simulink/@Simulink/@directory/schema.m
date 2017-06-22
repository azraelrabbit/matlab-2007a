function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    hCreateInPackage = findpackage('Simulink');
    % 11 14
    % 12 14
    dummy = findclass(hCreateInPackage, 'document');
    % 14 17
    % 15 17
    hThisClass = schema.class(hCreateInPackage, 'directory', hDeriveFromClass);
    % 17 20
    % 18 20
    hThisProp = schema.prop(hThisClass, 'DirectoryName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'Documents', 'Simulink.document vector');
    hThisProp.FactoryValue = {};
    hThisProp = schema.prop(hThisClass, 'displayLabel', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'generateBacklink', 'bool');
    hThisProp.FactoryValue = logical(0);
    % 27 30
    % 28 30
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 34 36
    m = schema.method(hThisClass, 'getFullName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 40 42
    m = schema.method(hThisClass, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 46 48
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 52 54
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 58 60
    m = schema.method(hThisClass, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
end
