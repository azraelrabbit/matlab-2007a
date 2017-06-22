function widget = getValidatingEditWidget(a_hController, a_hSrc, a_Property, a_Visible, a_Enabled, a_Refresh, a_Name, a_ToolTip, a_TagPrefix, a_WidgetIdPrefix, a_PageName)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    widget.Type = 'edit';
    widget.Name = a_Name;
    widget.Enabled = double(not(a_hSrc.isReadonlyProperty(a_Property))) && a_Enabled;
    widget.Visible = a_Visible;
    widget.DialogRefresh = a_Refresh;
    widget.Tag = horzcat(a_TagPrefix, a_Property);
    widget.WidgetId = horzcat(a_WidgetIdPrefix, a_Property);
    widget.ToolTip = a_ToolTip;
    widget.ObjectProperty = a_Property;
    widget.MatlabMethod = 'slprivate';
    widget.MatlabArgs = cellhorzcat('cfgDlgCBRedirect', a_hController, '%dialog', widget.Tag, '');
    widget.UserData.ObjectProperty = a_Property;
    widget.UserData.Name = a_Name;
    widget.UserData.Validate = a_Visible && a_Enabled;
    widget.UserData.PageName = a_PageName;
    widget.Mode = 0.0;
end
