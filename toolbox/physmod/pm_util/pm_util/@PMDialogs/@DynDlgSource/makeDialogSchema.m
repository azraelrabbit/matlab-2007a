function dlgSchema = makeDialogSchema(hThis, itemsToContain)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    disabled = pm_is_blocklocked(hThis.BlockHandle);
    % 16 18
    % 17 18
    nPanels = numel(itemsToContain);
    for idx=1.0:nPanels
        itemsToContain{idx}.RowSpan = horzcat(idx, idx);
    end % for
    % 22 24
    % 23 24
    nRows = plus(nPanels, 1.0);
    RowStretchVect = zeros(1.0, nRows);
    RowStretchVect(nRows) = 1.0;
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(itemsToContain), 'Source', cellhorzcat(get_param(hThis.BlockHandle, 'Object')), 'LayoutGrid', cellhorzcat(horzcat(nRows, 1.0)), 'RowStretch', cellhorzcat(RowStretchVect));
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    title = horzcat('Block parameters:  ', get_param(hThis.BlockHandle, 'Name'));
    title = strrep(title, sprintf('\n'), ' ');
    dlgSchema = struct('DialogTitle', cellhorzcat(title), 'Items', cellhorzcat(cellhorzcat(panel)), 'CloseMethod', {'closeDialogCB'}, 'CloseMethodArgs', {{'%dialog'}}, 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyMethod', {'preApplyCallback'}, 'PreApplyArgs', {{'%source'}}, 'PreApplyArgsDT', {{'handle'}}, 'HelpMethod', {'slhelp'}, 'HelpArgs', cellhorzcat(cellhorzcat(hThis.BlockHandle)), 'HelpArgsDT', {{'double'}}, 'DisableDialog', cellhorzcat(disabled));
    % 41 54
    % 42 54
    % 43 54
    % 44 54
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
end % function
