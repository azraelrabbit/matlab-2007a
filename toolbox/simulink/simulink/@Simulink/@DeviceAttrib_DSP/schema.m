function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hCreateInPackage = findpackage('Simulink');
    % 11 14
    % 12 14
    hThisClass = schema.class(hCreateInPackage, 'DeviceAttrib_DSP');
    % 14 17
    % 15 17
    hThisProp = schema.prop(hThisClass, 'NaturalWordSize', 'int32');
    % 17 19
    hThisProp = schema.prop(hThisClass, 'AccumulatorSize', 'int32');
    % 19 21
    hThisProp = schema.prop(hThisClass, 'SpecialScalingMAC', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
end
