function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hDeriveFromPackage = findpackage('RTWConfiguration');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'ResourceHead');
    hCreateInPackage = findpackage('TargetsCommonConfig');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'CCP_RESOURCES', hDeriveFromClass);
    % 15 17
    % 16 17
    name = 'CCP_INSTANCE_FLAG';
    enum = {'CCP_BLOCK'};
    % 19 21
    % 20 21
    i_reg_type(name, enum);
    % 22 24
    % 23 24
    hThisProp = schema.prop(hThisClass, 'CCP_INSTANCE', 'handle');
    hThisProp.AccessFlags.Serialize = 'off';
end % function
function i_reg_type(name, enum)
    if isempty(findtype(name))
        schema.EnumType(name, enum);
    else
        warning(horzcat('A type named ', name, ' already exists.'));
    end % if
end % function
