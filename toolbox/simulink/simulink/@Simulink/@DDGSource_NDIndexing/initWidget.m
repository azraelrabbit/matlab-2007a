function widgetStruct = initWidget(this, paramName, dlgRefresh)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    block = this.getBlock;
    % 7 9
    widgetStruct.Name = block.DialogParameters.(paramName).Prompt;
    switch block.DialogParameters.(paramName).Type
    case 'enum'
        widgetStruct.Type = 'combobox';
        widgetStruct.Entries = ctranspose(block.getPropAllowedValues(paramName));
        widgetStruct.Value = this.getEnumValFromStr(this.DialogData.(paramName), widgetStruct.Entries);
    case 'string'
        % 15 17
        widgetStruct.Type = 'edit';
        widgetStruct.Value = this.DialogData.(paramName);
    end
    widgetStruct.Enabled = ~(this.isHierarchySimulating);
    widgetStruct.DialogRefresh = 1.0;
    % 21 23
    widgetStruct.Source = this;
    widgetStruct.ObjectMethod = 'ParamWidgetCallback';
    widgetStruct.MethodArgs = cellhorzcat('%dialog', paramName, dlgRefresh, '%value');
    widgetStruct.ArgDataTypes = {'handle','string','bool','mxArray'};
end
