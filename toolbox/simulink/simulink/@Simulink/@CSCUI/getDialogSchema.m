function dlgstruct = getDialogSchema(hUI, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    packageSelGrp = getSchema_packageSelGrp(hUI);
    mainTabs = getSchema_mainTabs(hUI);
    saveGrp = getSchema_saveGrp(hUI);
    validGrp = getSchema_validGrp(hUI);
    previewGrp = getSchema_previewGrp(hUI);
    % 10 13
    % 11 13
    dlgstruct.DialogTitle = 'Custom Storage Class Designer';
    if hUI.IsDirty
        dlgstruct.DialogTitle = horzcat(dlgstruct.DialogTitle, ' *');
    end % if
    dlgstruct.LayoutGrid = [6.0 5.0];
    dlgstruct.RowStretch = [0.0 1.0 1.0 1.0 1.0 0.0];
    dlgstruct.ColStretch = [1.0 1.0 1.0 2.0 2.0];
    % 19 21
    packageSelGrp.RowSpan = [1.0 1.0];
    packageSelGrp.ColSpan = [1.0 3.0];
    mainTabs.RowSpan = [2.0 5.0];
    mainTabs.ColSpan = [1.0 3.0];
    saveGrp.RowSpan = [6.0 6.0];
    saveGrp.ColSpan = [1.0 3.0];
    validGrp.RowSpan = [1.0 2.0];
    validGrp.ColSpan = [4.0 5.0];
    previewGrp.RowSpan = [3.0 6.0];
    previewGrp.ColSpan = [4.0 5.0];
    % 30 32
    dlgstruct.DialogTag = 'Tag_CSCUI';
    % 32 34
    dlgstruct.Items = cellhorzcat(packageSelGrp, mainTabs, saveGrp, validGrp, previewGrp);
    dlgstruct.DefaultOk = false;
    % 35 37
    dlgstruct.HelpMethod = 'helpview';
    dlgstruct.HelpArgs = cellhorzcat(horzcat(docroot, '/toolbox/ecoder/helptargets.map'), 'ert_CSC_chapter');
    % 38 40
    dlgstruct.CloseMethod = 'promptSave';
    dlgstruct.CloseMethodArgs = {'%closeaction'};
    dlgstruct.CloseMethodArgsDT = {'string'};
end % function
