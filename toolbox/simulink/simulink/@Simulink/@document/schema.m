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
    % 11 13
    hThisClass = schema.class(hCreateInPackage, 'document', hDeriveFromClass);
    % 13 16
    % 14 16
    hThisProp = schema.prop(hThisClass, 'documentName', 'string');
    hThisProp.FactoryValue = '';
    % 17 19
    hThisProp = schema.prop(hThisClass, 'displayDocument', 'string');
    hThisProp.FactoryValue = '';
    % 20 22
    hThisProp = schema.prop(hThisClass, 'displayLabel', 'string');
    hThisProp.FactoryValue = '';
    % 23 25
    hThisProp = schema.prop(hThisClass, 'Modified', 'string');
    hThisProp.FactoryValue = '';
    hThisProp.AccessFlags.PublicSet = 'off';
    % 27 29
    hThisProp = schema.prop(hThisClass, 'Size', 'double');
    hThisProp.FactoryValue = 0.0;
    hThisProp.AccessFlags.PublicSet = 'off';
    % 31 33
    hThisProp = schema.prop(hThisClass, 'generateBacklink', 'bool');
    hThisProp.FactoryValue = logical(0);
    % 34 37
    % 35 37
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 41 43
    m = schema.method(hThisClass, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 47 49
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 53 55
    m = schema.method(hThisClass, 'exploreAction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 59 61
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
end
