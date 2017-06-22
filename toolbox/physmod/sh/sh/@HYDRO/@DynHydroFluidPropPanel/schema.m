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
    hCreateInPackage = findpackage('HYDRO');
    hBaseObj = hCreateInPackage.findclass('PmHydroFluidPropPanel');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'DynHydroFluidPropPanel', hBaseObj);
    % 15 18
    % 16 18
    % 17 18
    schema.prop(hThisClass, 'ChildTags', 'mxArray');
    schema.prop(hThisClass, 'ChildHandles', 'mxArray');
    schema.prop(hThisClass, 'FluidDb', 'mxArray');
end % function
