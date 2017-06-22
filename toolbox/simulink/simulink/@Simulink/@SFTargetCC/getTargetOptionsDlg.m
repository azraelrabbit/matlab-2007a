function dlgstruct = getTargetOptionsDlg(h, name)
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
    lblName.Tag = strcat('sfTargetoptsdlg_', lblName.Name);
    % 14 16
    % 15 16
    txtName.Name = h.Name;
    txtName.Type = 'text';
    txtName.RowSpan = [1.0 1.0];
    txtName.ColSpan = [4.0 10.0];
    txtName.Tag = strcat('sfTargetoptsdlg_', txtName.Name);
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    item1.Name = 'Custom code included at the top of generated code';
    item1.Type = 'editarea';
    item1.ObjectProperty = 'CustomCode';
    item1.Tag = strcat('sfTargetoptsdlg_', item1.Name);
    % 33 34
    item2.Name = 'Custom include directory';
    item2.Type = 'editarea';
    item2.ObjectProperty = 'UserIncludeDirs';
    item2.Tag = strcat('sfTargetoptsdlg_', item2.Name);
    % 38 39
    item3.Name = 'Custom source files';
    item3.Type = 'editarea';
    item3.ObjectProperty = 'UserSources';
    item3.Tag = strcat('sfTargetoptsdlg_', item3.Name);
    % 43 44
    item4.Name = 'Custom libraries';
    item4.Type = 'editarea';
    item4.ObjectProperty = 'UserLibraries';
    item4.Tag = strcat('sfTargetoptsdlg_', item4.Name);
    % 48 49
    item5.Name = 'Code generation directory';
    item5.Type = 'editarea';
    item5.ObjectProperty = 'CodegenDirectory';
    item5.Tag = strcat('sfTargetoptsdlg_', item5.Name);
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    tab1.Name = 'Include Code';
    tab1.Items = cellhorzcat(item1);
    % 59 61
    % 60 61
    tab2.Name = 'Include Path';
    tab2.Items = cellhorzcat(item2);
    % 63 65
    % 64 65
    tab3.Name = 'Source Files';
    tab3.Items = cellhorzcat(item3);
    % 67 69
    % 68 69
    tab4.Name = 'Libraries';
    tab4.Items = cellhorzcat(item4);
    % 71 73
    % 72 73
    tab5.Name = 'Code Generation';
    tab5.Items = cellhorzcat(item5);
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    tabMain.Name = 'tabContainer';
    tabMain.Type = 'tab';
    tabMain.RowSpan = [2.0 2.0];
    tabMain.ColSpan = [1.0 10.0];
    tabMain.Tabs = cellhorzcat(tab1, tab2, tab3, tab4, tab5);
    tabMain.Tag = strcat('sfTargetoptsdlg_', tabMain.Name);
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    pnlMain.Type = 'panel';
    pnlMain.LayoutGrid = [2.0 10.0];
    pnlMain.Items = cellhorzcat(lblName, txtName, tabMain);
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    % 98 99
    dlgstruct.DialogTitle = horzcat('Stateflow ', h.Name, ' Target Options');
    dlgstruct.Items = cellhorzcat(pnlMain);
end % function
