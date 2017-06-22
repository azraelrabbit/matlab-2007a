function dlgstruct = getCoderOptionsDlg(h, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    lblName.Name = 'Target Name:';
    lblName.Type = 'text';
    lblName.RowSpan = [1.0 1.0];
    lblName.ColSpan = [1.0 3.0];
    lblName.Tag = strcat('sfCoderoptsdlg_', lblName.Name);
    % 14 16
    % 15 16
    txtName.Name = h.Name;
    txtName.Type = 'text';
    txtName.RowSpan = [1.0 1.0];
    txtName.ColSpan = [4.0 10.0];
    txtName.Tag = strcat('sfCoderoptsdlg_', txtName.Name);
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    flags = get(h, 'CodeFlagsInfo');
    grpMain.Items = {};
    % 28 30
    % 29 30
    for i=1.0:length(flags)
        flag = flags(i);
        wid.Name = flag.description;
        % 33 34
        val = flag.value;
        if eq(val, -1.0)
            val = flag.defaultValue;
        end % if
        % 38 39
        switch flag.type
        case 'boolean'
            wid.Type = 'checkbox';
        case 'enumeration'
            wid.Type = 'combobox';
            wid.Entries = flag.description;
        end % switch
        % 46 47
        wid.InitialValue = val;
        % 48 49
        wid.Tag = int2str(i);
        grpMain.Items{i} = wid;
    end % for
    % 52 53
    grpMain.Name = 'Coder Options';
    grpMain.Type = 'group';
    grpMain.RowSpan = [2.0 2.0];
    grpMain.ColSpan = [1.0 10.0];
    grpMain.Tag = strcat('sfCoderoptsdlg_', grpMain.Name);
    % 58 60
    % 59 60
    pnlMain.Type = 'panel';
    pnlMain.LayoutGrid = [2.0 2.0];
    pnlMain.Items = cellhorzcat(lblName, txtName, grpMain);
    % 63 64
    pnlMain.Tag = 'sfCoderoptsdlg_pnlMain';
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    dlgstruct.DialogTitle = horzcat('Stateflow ', h.Name, ' Coder Options');
    % 70 73
    % 71 73
    % 72 73
    dlgstruct.Items = cellhorzcat(pnlMain);
end % function
