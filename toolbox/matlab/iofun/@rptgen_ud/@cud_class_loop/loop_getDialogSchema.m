function dlgStruct = loop_getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    ct = getContextType(rptgen_ud.appdata_ud, this, logical(0));
    switch ct
    case 'Package'
        cs = xlate('All classes in current package');
    case 'Class'
        cs = xlate('Current class');
    case {'Object','Method','Property'}
        cs = sprintf('Classhandle of current %s', lower(ct));
    otherwise
        cs = xlate('No context, no classes reported');
    end
    % 18 20
    ltWidget = this.dlgWidget('LoopType', 'DialogRefresh', true);
    ltWidget.Entries{1.0} = horzcat(xlate('Automatic'), ' (', cs, ')');
    % 21 23
    panelContent = cellhorzcat(ltWidget);
    % 23 25
    if strcmp(this.LoopType, 'manual')
        panelContent{plus(end, 1.0)} = this.dlgWidget('ClassList', 'ForegroundColor', [1.0 1.0 255.0], 'Enabled', strcmp(this.LoopType, 'manual'));
        % 26 29
        % 27 29
    end
    % 29 31
    dlgStruct = this.dlgContainer(panelContent, xlate('Select Classes'));
end
