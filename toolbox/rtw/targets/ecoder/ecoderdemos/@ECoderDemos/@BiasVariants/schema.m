function schema
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    hCreateInPackage = findpackage('ECoderDemos');
    % 20 22
    % 21 22
    hThisClass = schema.class(hCreateInPackage, 'BiasVariants');
    % 23 25
    % 24 25
    hThisProp = schema.prop(hThisClass, 'negative', 'MATLAB array');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = -1.0;
    % 28 29
    hThisProp = schema.prop(hThisClass, 'neutral', 'MATLAB array');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 32 33
    hThisProp = schema.prop(hThisClass, 'positive', 'MATLAB array');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1.0;
end % function
