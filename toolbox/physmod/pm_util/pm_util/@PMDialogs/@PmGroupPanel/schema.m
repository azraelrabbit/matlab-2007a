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
    hBaseObj = hCreateInPackage.findclass('PmGuiObj');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmGroupPanel', hBaseObj);
    % 15 17
    % 16 17
    schema.prop(hThisClass, 'LabelText', 'string');
    % 18 19
    if isempty(findtype('GroupBoxStyleEnum'))
        schema.EnumType('GroupBoxStyleEnum', {'NoBoxNoTitle','Box','NoBoxWithTitle','NoBoxWithTitleAndLine','NoBoxWithTitleAndSpace','HorzLine','Flat','TabContainer','TabPage','Spacer','VerticalAlignment'}, [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0]);
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        % 25 26
    end % if
    % 27 28
    if isempty(findtype('StdLayout'))
        schema.EnumType('StdLayout', {'Unset','1ColLayout','2ColLayout','3ColLayout','4ColLayout'}, [0.0 1.0 2.0 3.0 4.0]);
        % 30 33
        % 31 33
        % 32 33
    end % if
    % 34 36
    % 35 36
    schema.prop(hThisClass, 'Style', 'GroupBoxStyleEnum');
    schema.prop(hThisClass, 'StdLayoutCfg', 'StdLayout');
end % function
