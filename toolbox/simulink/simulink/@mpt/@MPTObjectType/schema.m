function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('mpt');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'MPTObjectType');
    % 13 16
    % 14 16
    % 15 16
    if isempty(findtype('MPF_UserObjectType_ClassType'))
        schema.EnumType('MPF_UserObjectType_ClassType', {'Both';'Signal';'Parameter'});
    else
        % 19 21
        % 20 21
        % 21 22
        warning('A type named ''MPF_UserObjectType_ClassType'' already exists.');
    end % if
    % 24 26
    % 25 26
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    hThisProp.Visible = 'off';
    % 28 29
    hThisProp = schema.prop(hThisClass, 'ClassType', 'MPF_UserObjectType_ClassType');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PrivateGet = 'on';
    hThisProp.FactoryValue = 'Both';
    % 35 36
    hThisProp = schema.prop(hThisClass, 'Property', 'MATLAB array');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PrivateSet = 'on';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PrivateGet = 'on';
    hThisProp.FactoryValue = {};
end % function
