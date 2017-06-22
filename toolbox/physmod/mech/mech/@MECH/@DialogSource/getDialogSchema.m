function dlg = getDialogSchema(src, type)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    ssc_callback(src.BlockHandle, 'BLK_OPENDLG');
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    groups = src.PropertyList.createPropertyGroups(src);
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    items = {};
    for i=1.0:length(groups)
        parampanel.Name = '';
        parampanel.Type = 'panel';
        parampanel.Items = groups(i).Items;
        parampanel.LayoutGrid = horzcat(plus(length(groups(i).Items), 1.0), 3.0);
        parampanel.RowStretch = horzcat(zeros(1.0, length(groups(i).Items)), 1.0);
        parampanel.RowSpan = [2.0 2.0];
        parampanel.ColSpan = [1.0 1.0];
        % 30 31
        text.Name = groups(i).Description;
        text.Type = 'text';
        text.ColSpan = [1.0 1.0];
        text.RowSpan = [1.0 1.0];
        text.WordWrap = true;
        % 36 37
        textpanel.Name = '';
        textpanel.Type = 'group';
        textpanel.Items = cellhorzcat(text);
        textpanel.LayoutGrid = [2.0 1.0];
        textpanel.RowStretch = [0.0 1.0];
        textpanel.ColSpan = [1.0 1.0];
        textpanel.RowSpan = [1.0 1.0];
        % 44 45
        tab.Name = groups(i).Name;
        tab.Items = cellhorzcat(textpanel, parampanel);
        tab.LayoutGrid = [3.0 1.0];
        tab.RowStretch = [0.0 0.0 1.0];
        items{plus(end, 1.0)} = tab;
    end % for
    % 51 52
    dlg = l_make_dialog(src, items);
end % function
function stack = l_make_dialog(src, items)
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    disabled = mech_is_locked(src.BlockHandle);
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    tab = struct('Name', {'tabs'}, 'Type', {'tab'}, 'Tabs', cellhorzcat(items), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]);
    % 66 74
    % 67 74
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    description = get_param(src.BlockHandle, 'MaskDescription');
    % 75 76
    desctxt = struct('Name', description, 'Type', 'text', 'WordWrap', true);
    % 77 80
    % 78 80
    % 79 80
    descgrp = struct('Name', {'Description'}, 'Type', {'group'}, 'Items', cellhorzcat(cellhorzcat(desctxt)), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0]);
    % 81 89
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    % 88 89
    hotlinkbutton = struct('Name', {'Configuration Parameters...'}, 'Type', {'pushbutton'}, 'MatlabMethod', {'globalEnvironment'}, 'MatlabArgs', cellhorzcat(cellhorzcat(src)), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,1.0]});
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    % 95 96
    hotlinkpanel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(cellhorzcat(hotlinkbutton)), 'LayoutGrid', {[1.0,2.0]}, 'ColStretch', {[0.0,1.0]}, 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,1.0]});
    % 97 107
    % 98 107
    % 99 107
    % 100 107
    % 101 107
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    % 106 107
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(cellhorzcat(descgrp, tab, hotlinkpanel)), 'Source', cellhorzcat(get_param(src.BlockHandle, 'Object')), 'LayoutGrid', {[4.0,1.0]}, 'RowStretch', {[0.0,0.0,0.0,1.0]});
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    title = horzcat('Block parameters:  ', get_param(src.BlockHandle, 'Name'));
    title = strrep(title, sprintf('\n'), ' ');
    stack = struct('DialogTitle', cellhorzcat(title), 'Items', cellhorzcat(cellhorzcat(panel)), 'PreApplyCallback', {'mech_preapply_cbk'}, 'PreApplyArgs', cellhorzcat(cellhorzcat(src, '%dialog')), 'HelpMethod', {'slhelp'}, 'HelpArgs', cellhorzcat(cellhorzcat(ctranspose(src.BlockHandle))), 'HelpArgsDT', {{'double'}}, 'CloseCallback', {'mech_close_cbk'}, 'CloseArgs', cellhorzcat(cellhorzcat(src, '%dialog')), 'DisableDialog', cellhorzcat(disabled));
    % 117 125
    % 118 125
    % 119 125
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    % 124 125
end % function
