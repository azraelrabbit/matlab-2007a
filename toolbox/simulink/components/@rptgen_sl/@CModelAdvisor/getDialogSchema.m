function dlgStruct = getDialogSchema(thisComp, name)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    wReuseReport = thisComp.dlgWidget('ReuseReport', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0]);
    % 25 29
    % 26 29
    % 27 29
    cMain = thisComp.dlgContainer(vertcat(cellhorzcat(wReuseReport)), 'Properties', 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', 0.0, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]);
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    cHelp = thisComp.dlgContainer(vertcat(cellhorzcat(thisComp.dlgText(getDescription(thisComp), 'WordWrap', true, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]))), 'Help', 'LayoutGrid', [2.0 1.0], 'ColStretch', 1.0, 'RowStretch', [0.0 1.0], 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0]);
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    dlgStruct = thisComp.dlgMain(name, vertcat(cellhorzcat(cMain), cellhorzcat(cHelp)), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0], 'ColStretch', 1.0);
    % 51 56
    % 52 56
    % 53 56
    % 54 56
end % function
