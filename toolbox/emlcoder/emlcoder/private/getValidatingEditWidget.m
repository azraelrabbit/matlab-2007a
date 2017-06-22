function widget = getValidatingEditWidget(a_hSrc, a_Property, a_Visible, a_Enabled, a_Refresh, a_Name, a_ToolTip, a_TagPrefix, a_WidgetIdPrefix, a_PageName)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    widget.Type = 'edit';
    widget.Name = a_Name;
    widget.Enabled = not(a_hSrc.isReadonlyProperty(a_Property)) && a_Enabled;
    widget.Visible = a_Visible;
    widget.DialogRefresh = a_Refresh;
    widget.Tag = horzcat(a_TagPrefix, a_Property);
    widget.WidgetId = horzcat(a_WidgetIdPrefix, a_Property);
    widget.ToolTip = a_ToolTip;
    widget.ObjectProperty = a_Property;
    % 33 36
    % 34 36
    widget.UserData.ObjectProperty = a_Property;
    widget.UserData.Name = a_Name;
    widget.UserData.Validate = a_Visible && a_Enabled;
    widget.UserData.PageName = a_PageName;
    widget.Mode = 0.0;
end
