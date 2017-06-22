function dlgstruct = getDialogSchema(this, arg)
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
    label.Name = 'Display messages with:';
    label.Type = 'text';
    label.RowSpan = [1.0 1.0];
    label.ColSpan = [1.0 2.0];
    % 15 17
    % 16 17
    typeList = {'All','Info','Warn','Fail'};
    typePopup.Tag = 'type';
    typePopup.Name = 'Type:';
    typePopup.Type = 'combobox';
    typePopup.RowSpan = [2.0 2.0];
    typePopup.ColSpan = [1.0 1.0];
    typePopup.Mode = 0.0;
    typePopup.Entries = typeList;
    % 25 26
    typePopup.Graphical = true;
    typePopup.UserData = typeList;
    typePopup.ObjectMethod = 'handleButtons';
    typePopup.MethodArgs = {'type'};
    typePopup.ArgDataTypes = {'string'};
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    theList = horzcat('All', catList(this));
    catPopup.Tag = 'category';
    catPopup.Name = 'Category:';
    catPopup.Type = 'combobox';
    catPopup.RowSpan = [3.0 3.0];
    catPopup.ColSpan = [1.0 1.0];
    catPopup.Entries = theList;
    catPopup.UserData = theList;
    catPopup.Graphical = true;
    catPopup.ObjectMethod = 'handleButtons';
    catPopup.MethodArgs = {'category'};
    catPopup.ArgDataTypes = {'string'};
    % 47 71
    % 48 71
    % 49 71
    % 50 71
    % 51 71
    % 52 71
    % 53 71
    % 54 71
    % 55 71
    % 56 71
    % 57 71
    % 58 71
    % 59 71
    % 60 71
    % 61 71
    % 62 71
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    mfp.Type = 'group';
    mfp.Name = 'Message filter';
    mfp.Flat = false;
    % 74 75
    mfp.Items = cellhorzcat(label, typePopup, catPopup);
    mfp.LayoutGrid = [4.0 2.0];
    mfp.RowStretch = [1.0 1.0 1.0 1.0];
    mfp.ColStretch = [0.0 1.0];
    mfp.Visible = 1.0;
    mfp.RowSpan = [1.0 1.0];
    mfp.ColSpan = [1.0 1.0];
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    % 86 87
    [hdr, tbl, idx] = getDialogSummaryList(this);
    cnt = numel(tbl);
    % 89 90
    item.Tag = 'summary';
    item.Name = hdr;
    item.Type = 'listbox';
    item.Graphical = true;
    item.MultiSelect = false;
    item.FontFamily = 'Courier';
    item.Entries = tbl;
    item.ObjectMethod = 'handleButtons';
    item.MethodArgs = {'summary'};
    item.ArgDataTypes = {'string'};
    item.Value = [];
    item.Mode = 1.0;
    item.Tunable = 1.0;
    item.UserData = idx;
    item.MinimumSize = [400.0 140.0];
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    % 109 110
    msp.Type = 'group';
    msp.Name = sprintf('Message summaries (%d)', cnt);
    msp.Flat = false;
    msp.Items = cellhorzcat(item);
    msp.Visible = 1.0;
    msp.RowSpan = [2.0 2.0];
    msp.ColSpan = [1.0 1.0];
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    detail.Type = 'textbrowser';
    detail.Text = this.cache_SelectedDetail;
    detail.Tag = 'detail';
    % 125 127
    % 126 127
    mdp.Type = 'group';
    mdp.Name = 'Message detail';
    mdp.Flat = false;
    mdp.Items = cellhorzcat(detail);
    mdp.Visible = 1.0;
    mdp.RowSpan = [3.0 3.0];
    mdp.ColSpan = [1.0 1.0];
    % 134 137
    % 135 137
    % 136 137
    autoOpen.Tag = 'autoOpen';
    autoOpen.Name = 'Open message log:';
    autoOpen.Type = 'combobox';
    autoOpen.RowSpan = [4.0 4.0];
    autoOpen.ColSpan = [1.0 1.0];
    autoOpen.ObjectProperty = 'AutoOpenMode';
    autoOpen.Mode = true;
    autoOpen.Graphical = true;
    autoOpen.ToolTip = sprintf('Set condition for automatically\nopening Message Log window');
    % 146 150
    % 147 150
    % 148 150
    % 149 150
    main.Type = 'panel';
    main.Items = cellhorzcat(mfp, msp, mdp, autoOpen);
    main.LayoutGrid = [4.0 1.0];
    main.RowStretch = [0.0 1.0 1.0 0.0];
    main.ColStretch = 1.0;
    % 155 157
    % 156 157
    dlgstruct = this.StdDlgProps;
    dlgstruct.Items = cellhorzcat(main);
    dlgstruct.StandaloneButtonSet = {''};
end % function
