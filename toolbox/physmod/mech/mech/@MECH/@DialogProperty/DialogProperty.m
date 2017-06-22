function dp = DialogProperty(propinfo)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dp = MECH.DialogProperty;
    % 10 11
    if gt(nargin, 0.0)
        % 12 13
        dp.Name = propinfo.Name;
        % 14 18
        % 15 18
        % 16 18
        % 17 18
        dp.IsUnit = false;
        dp.HasUnit = false;
        % 20 24
        % 21 24
        % 22 24
        % 23 24
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
        end % switch
    end % if
end % function
