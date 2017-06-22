function dp = DialogProperty(propinfo)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    dp = SSC.DialogProperty;
    % 14 15
    if gt(nargin, 0.0)
        % 16 17
        dp.Name = propinfo.Name;
        dp.Group = propinfo.Group;
        dp.GroupDesc = propinfo.GroupDesc;
        dp.Label = propinfo.Label;
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        dp.IsUnit = false;
        dp.HasUnit = false;
        % 27 31
        % 28 31
        % 29 31
        % 30 31
        switch propinfo.DataType
        case {'double','NReals'}
            dp.Eval = true;
            dp.WidgetType = 'edit';
        case 'string'
            dp.Eval = false;
            dp.WidgetType = 'edit';
        case 'on/off'
            dp.Eval = false;
            dp.WidgetType = 'checkbox';
        otherwise
            dp.Eval = false;
            dt = findtype(propinfo.DataType);
            dp.WidgetType = 'combobox';
            dp.Entries = dt.Strings;
            % 46 47
        end % switch
    end % if
end % function
