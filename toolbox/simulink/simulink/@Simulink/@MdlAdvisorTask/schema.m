function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('Simulink');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'MdlAdvisorTask');
    % 12 14
    % 13 14
    hThisProp = schema.prop(hThisClass, 'Title', 'string');
    hThisProp.FactoryValue = '';
    % 16 19
    % 17 19
    % 18 19
    hThisProp = schema.prop(hThisClass, 'TitleTips', 'string');
    hThisProp.FactoryValue = '';
    % 21 23
    % 22 23
    hThisProp = schema.prop(hThisClass, 'CheckTitleIDs', 'string vector');
    hThisProp.FactoryValue = {};
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    hThisProp = schema.prop(hThisClass, 'Visible', 'bool');
    hThisProp.FactoryValue = true;
    hThisProp = schema.prop(hThisClass, 'Enable', 'bool');
    hThisProp.FactoryValue = true;
    hThisProp = schema.prop(hThisClass, 'Value', 'bool');
    hThisProp.FactoryValue = false;
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    hThisProp = schema.prop(hThisClass, 'TitleID', 'string');
    hThisProp.FactoryValue = '';
    % 41 44
    % 42 44
    % 43 44
    hThisProp = schema.prop(hThisClass, 'CallbackFcnPath', 'string');
    hThisProp.FactoryValue = '';
    % 46 47
    hThisProp = schema.prop(hThisClass, 'Selected', 'bool');
    hThisProp.FactoryValue = false;
    % 49 50
    hThisProp = schema.prop(hThisClass, 'TitleIsDuplicate', 'bool');
    hThisProp.FactoryValue = false;
    % 52 53
    hThisProp = schema.prop(hThisClass, 'TitleIDIsDuplicate', 'bool');
    hThisProp.FactoryValue = false;
    % 55 56
    hThisProp = schema.prop(hThisClass, 'Index', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 58 59
    hThisProp = schema.prop(hThisClass, 'CheckIndex', 'string vector');
    hThisProp.FactoryValue = {};
end % function
