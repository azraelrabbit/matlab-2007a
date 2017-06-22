function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    adSL = rptgen_sl.appdata_sl;
    ct = adSL.getContextType(this, false);
    % 9 10
    if isempty(ct)
        ctxtString = xlate('Warning: no current loop context.  No dialog will be included.');
    else
        ctxtString = sprintf('Include dialog for current %s.', lower(ct));
    end % if
    % 15 17
    % 16 17
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ImageFormat', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgWidget('CaptureTabs', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 2.0])), cellhorzcat(this.dlgText(ctxtString, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 2.0]))), xlate('Format'), 'LayoutGrid', [3.0 2.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.gr_dlgDisplayOptions([], [], 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 18 36
    % 19 36
    % 20 36
    % 21 36
    % 22 36
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
end % function
