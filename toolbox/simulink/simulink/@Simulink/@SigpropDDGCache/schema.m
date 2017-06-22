function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('Simulink');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'SigpropDDGCache');
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    hThisProp = schema.prop(hThisClass, 'Template', 'mxArray');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = [];
    % 23 24
    hThisProp = schema.prop(hThisClass, 'Editing', 'mxArray');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = {[],[]};
    % 27 28
    hThisProp = schema.prop(hThisClass, 'ActiveTab', 'double');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
end % function
