function dlgStruct = getDialogSchema(hThis, type)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hBlk = pm_getsl_dblhandle(gcbh);
    % 10 14
    % 11 14
    % 12 14
    try
        hBlock = get_param(hBlk, 'ReferenceBlock');
        if isempty(hBlock)
            hBlock = hBlk;
        else
            hBlock = get_param(hBlock, 'Handle');
        end % if
        tmpTitle = get_param(hBlock, 'Name');
    catch
        disp(lasterror.message);
        return;
    end % try
    % 25 27
    textLabel.Name = get_param(hBlock, 'MaskDescription');
    textLabel.Type = 'text';
    textLabel.WordWrap = true;
    % 29 32
    % 30 32
    lablStr = strrep(xlate(tmpTitle), sprintf('\n'), ' ');
    % 32 34
    lablStr = strrep(lablStr, '  ', ' ');
    % 34 36
    lablStr = strrep(lablStr, ' & ', ' && ');
    grpBox.Name = lablStr;
    grpBox.Type = 'group';
    grpBox.RowSpan = [1.0 1.0];
    grpBox.ColSpan = [1.0 1.0];
    grpBox.Items = cellhorzcat(textLabel);
    % 41 43
    spacer.Name = ' ';
    spacer.Type = 'text';
    spacer.RowSpan = [2.0 2.0];
    spacer.ColSpan = [1.0 1.0];
    % 46 48
    panel.Name = 'BlockDescriptionPanel';
    panel.Type = 'panel';
    panel.RowSpan = [1.0 1.0];
    panel.ColSpan = [1.0 1.0];
    panel.LayoutGrid = [2.0 1.0];
    panel.Items = cellhorzcat(grpBox, spacer);
    % 53 55
    hlpFcn = get_param(hBlock, 'MaskHelp');
    % 55 57
    dlgStruct = struct('DialogTitle', {''}, 'Items', cellhorzcat(cellhorzcat(panel)), 'CloseCallback', {'mech_close_cbk'}, 'CloseArgs', cellhorzcat(cellhorzcat(hThis, '%dialog')), 'HelpMethod', cellhorzcat(hlpFcn));
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
