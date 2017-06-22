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
    hCreateInPackage = findpackage('PMDialogs');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'PmWidgetStateMgrObj');
    % 14 16
    % 15 16
    if isempty(findtype('WidgetStateActionEnum'))
        schema.EnumType('WidgetStateActionEnum', {'Visible','Enable'}, [1.0 2.0]);
        % 18 22
        % 19 22
        % 20 22
        % 21 22
    end % if
    % 23 24
    p = schema.prop(hThisClass, 'CurrentState', 'int');
    p = schema.prop(hThisClass, 'ActionType', 'WidgetStateActionEnum');
    p = schema.prop(hThisClass, 'StateList', 'mxArray');
    p = schema.prop(hThisClass, 'hDialog', 'handle');
    p = schema.prop(hThisClass, 'GotTags', 'bool');
    p = schema.prop(hThisClass, 'workData', 'mxArray');
end % function
