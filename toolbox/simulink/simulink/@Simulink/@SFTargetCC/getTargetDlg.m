function dlgstruct = getTargetDlg(h, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    txtName.Name = 'Target Name:';
    txtName.Type = 'edit';
    txtName.RowSpan = [1.0 1.0];
    txtName.ColSpan = [1.0 10.0];
    txtName.ObjectProperty = 'Name';
    txtName.Tag = strcat('sfTargetdlg_', txtName.Name);
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    lblParent.Name = 'Parent:';
    lblParent.Type = 'text';
    lblParent.RowSpan = [2.0 2.0];
    lblParent.ColSpan = [1.0 2.0];
    lblParent.Tag = strcat('sfTargetdlg_', lblParent.Name);
    % 25 33
    % 26 33
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    hypParent.Name = 'No parent';
    hypParent.Enabled = 0.0;
    % 35 36
    hypParent.Type = 'hyperlink';
    hypParent.RowSpan = [2.0 2.0];
    hypParent.ColSpan = [2.0 10.0];
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    lblTL.Name = 'Target Language:';
    lblTL.Type = 'text';
    lblTL.RowSpan = [3.0 3.0];
    lblTL.ColSpan = [1.0 2.0];
    lblTL.Tag = strcat('sfTargetdlg_', lblTL.Name);
    % 49 50
    lblTLv.Name = 'ANSI-C';
    lblTLv.Type = 'text';
    lblTLv.RowSpan = [3.0 3.0];
    lblTLv.ColSpan = [3.0 4.0];
    lblTLv.Tag = strcat('sfTargetdlg_', lblTLv.Name);
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    cmbTarget.Type = 'combobox';
    cmbTarget.RowSpan = [4.0 4.0];
    cmbTarget.ColSpan = [1.0 10.0];
    cmbTarget.DialogRefresh = 1.0;
    cmbTarget.Tag = 'cmbTarget';
    cmbTarget.Entries = {'Stateflow Target (incremental)','Rebuild All (including libraries)','Make without generating code','Generate code only (incremental)','Generate code only (non - incremental)'};
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    cmbTarget.ObjectProperty = 'SelectedCmd';
    % 71 75
    % 72 75
    % 73 75
    % 74 75
    btnTarget.Name = 'Target Options';
    btnTarget.Type = 'pushbutton';
    btnTarget.RowSpan = [5.0 5.0];
    btnTarget.ColSpan = [1.0 2.0];
    btnTarget.ObjectMethod = 'createChildDlg';
    btnTarget.MethodArgs = cellhorzcat(btnTarget.Name);
    btnTarget.ArgDataTypes = {'string'};
    % 82 83
    btnCoder.Name = 'Coder Options';
    btnCoder.Type = 'pushbutton';
    btnCoder.RowSpan = [5.0 5.0];
    btnCoder.ColSpan = [3.0 4.0];
    btnCoder.ObjectMethod = 'createChildDlg';
    btnCoder.MethodArgs = cellhorzcat(btnCoder.Name);
    btnCoder.ArgDataTypes = {'string'};
    % 90 100
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    % 99 100
    buildCommands = [];
    btnBuild.Name = 'Disabled';
    btnBuild.Enabled = 0.0;
    % 103 105
    % 104 105
    btnBuild.Type = 'pushbutton';
    btnBuild.RowSpan = [5.0 5.0];
    btnBuild.Tag = 'btnBuildTag';
    btnBuild.ColSpan = [8.0 10.0];
    % 109 113
    % 110 113
    % 111 113
    % 112 113
    chkLibSet.Name = 'Use settings for all libraries';
    chkLibSet.Type = 'checkbox';
    chkLibSet.RowSpan = [6.0 6.0];
    chkLibSet.ColSpan = [1.0 10.0];
    chkLibSet.ObjectProperty = 'ApplyToAllLibs';
    chkLibSet.Tag = strcat('sfTargetdlg_', chkLibSet.Name);
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    desc.Name = 'Description';
    desc.Type = 'editarea';
    desc.RowSpan = [7.0 7.0];
    desc.ColSpan = [1.0 10.0];
    desc.ObjectProperty = 'Description';
    desc.Tag = strcat('sfTargetdlg_', desc.Name);
    % 130 135
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    doclinkName.Name = 'Document Link:';
    doclinkName.RowSpan = [8.0 8.0];
    doclinkName.ColSpan = [1.0 4.0];
    doclinkName.Type = 'hyperlink';
    doclinkName.Tag = 'doclinkNameTag';
    doclinkName.MatlabMethod = 'sf';
    doclinkName.MatlabArgs = cellhorzcat('Private', 'dlg_goto_document', h.Id);
    % 142 144
    % 143 144
    doclinkEdit.Name = '';
    doclinkEdit.RowSpan = [8.0 8.0];
    doclinkEdit.ColSpan = [4.0 10.0];
    doclinkEdit.Type = 'edit';
    doclinkEdit.ObjectProperty = 'Document';
    doclinkEdit.Tag = 'sfTargetdlg_doclinkEdit';
    % 150 152
    % 151 152
    pnlMain.Type = 'panel';
    pnlMain.LayoutGrid = [8.0 10.0];
    pnlMain.Items = cellhorzcat(txtName, lblParent, hypParent, lblTL, lblTLv, cmbTarget, btnTarget, btnCoder, btnBuild, chkLibSet, desc, doclinkName, doclinkEdit);
    % 155 162
    % 156 162
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    % 161 162
    pnlMain.Tag = 'sfTargetdlg_pnlMain';
    % 163 167
    % 164 167
    % 165 167
    % 166 167
    if strcmp(name, 'tab')
        dlgstruct.Name = get(h, 'Name');
    else
        dlgstruct.DialogTitle = 'Stateflow Target Builder';
    end % if
    dlgstruct.Items = cellhorzcat(pnlMain);
end % function
