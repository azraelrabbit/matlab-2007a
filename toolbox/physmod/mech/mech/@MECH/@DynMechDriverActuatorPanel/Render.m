function [retVal, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    retVal = true;
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    hKidLst = hThis.Items(1.0, 1.0);
    % 20 22
    % 21 22
    hLinSchema = [];
    hLinPanel = hKidLst.Items(1.0, 1.0);
    [retVal, hLinSchema] = hLinPanel.Render(hLinSchema);
    hLinSchema.RowSpan = [1.0 1.0];
    hLinSchema.ColSpan = [1.0 1.0];
    % 27 28
    hArcSchema = [];
    hArcPanel = hKidLst.Items(2.0, 1.0);
    [retVal, hArcSchema] = hArcPanel.Render(hArcSchema);
    hArcSchema.RowSpan = [1.0 1.0];
    hArcSchema.ColSpan = [1.0 1.0];
    % 33 35
    % 34 35
    textItem.Type = 'text';
    textItem.Name = pm_message('mechanical:mech_dialogs:BlockUnconnected', 'Driver');
    % 37 39
    % 38 39
    textPnl.Type = 'panel';
    textPnl.LayoutGrid = [1.0 1.0];
    textPnl.RowSpan = [1.0 1.0];
    textPnl.ColSpan = [1.0 1.0];
    textPnl.Items = cellhorzcat(textItem);
    % 44 47
    % 45 47
    % 46 47
    if isempty(hThis.ConnectToBlockType)
        textPnl.Visible = true;
        hArcSchema.Visible = false;
        hLinSchema.Visible = false;
    else
        textPnl.Visible = false;
        isAngle = strcmpi(hThis.ConnectToBlockType, 'AngleDriver');
        hArcSchema.Visible = isAngle;
        hLinSchema.Visible = not(isAngle);
    end % if
    % 57 58
    mainGroup.Name = hThis.Items(1.0, 1.0).LabelText;
    mainGroup.Type = 'group';
    mainGroup.Tag = hThis.ObjId;
    mainGroup.LayoutGrid = [1.0 1.0];
    mainGroup.RowSpan = [1.0 1.0];
    mainGroup.ColSpan = [1.0 1.0];
    mainGroup.Items = [];
    mainGroup.Items = cellhorzcat(hArcSchema, hLinSchema, textPnl);
    mainGroup.ColStretch = 0.0;
    mainGroup.RowStretch = 0.0;
    schema = mainGroup;
end % function
