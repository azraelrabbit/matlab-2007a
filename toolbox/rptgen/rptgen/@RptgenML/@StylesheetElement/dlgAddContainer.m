function dlgStruct = dlgAddContainer(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(struct('Type', 'pushbutton', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'ObjectMethod', 'exploreAction', 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'StylesheetEntry.png'))), cellhorzcat(this.dlgText(xlate('Add to current stylesheet'), 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Add'), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'Visible', isLibrary(this), varargin{:});
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
end % function
