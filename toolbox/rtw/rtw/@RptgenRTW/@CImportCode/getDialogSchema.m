function dlgStruct = getDialogSchema(thisComp, name)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    wSource_files__auto_generated = thisComp.dlgWidget('Source_files__auto_generated', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0]);
    % 21 24
    % 22 24
    wHeader_files__auto_generated = thisComp.dlgWidget('Header_files__auto_generated', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 2.0]);
    % 24 27
    % 25 27
    wCustom_files = thisComp.dlgWidget('Custom_files', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 2.0]);
    % 27 30
    % 28 30
    cMain = thisComp.dlgContainer(vertcat(cellhorzcat(wSource_files__auto_generated), cellhorzcat(wHeader_files__auto_generated), cellhorzcat(wCustom_files)), xlate('Files to Include'), 'LayoutGrid', [3.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', [0.0 0.0 0.0], 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]);
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    cHelp = thisComp.dlgContainer(vertcat(cellhorzcat(thisComp.dlgText(getDescription(thisComp), 'WordWrap', true, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]))), xlate('Help'), 'LayoutGrid', [2.0 1.0], 'ColStretch', 1.0, 'RowStretch', [0.0 1.0], 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0]);
    % 41 65
    % 42 65
    % 43 65
    % 44 65
    % 45 65
    % 46 65
    % 47 65
    % 48 65
    % 49 65
    % 50 65
    % 51 65
    % 52 65
    % 53 65
    % 54 65
    % 55 65
    % 56 65
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    dlgStruct = thisComp.dlgMain(name, vertcat(cellhorzcat(cMain), cellhorzcat(cHelp)), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0], 'ColStretch', 1.0);
    % 65 70
    % 66 70
    % 67 70
    % 68 70
end % function
