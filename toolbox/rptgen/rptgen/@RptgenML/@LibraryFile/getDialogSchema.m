function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fName = fullfile(this.PathName, this.FileName);
    % 8 9
    if not(exist(fName, 'file'))
        descMsg = sprintf('Can not find file "%s".', fName);
    else
        try
            fid = fopen(fName, 'r');
            descMsg = ctranspose(fread(fid, 512.0, 'char*1=>char'));
            fclose(fid);
        catch
            descMsg = xlate('Unable to read file');
        end % try
    end % if
    % 20 21
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(struct('Type', 'pushbutton', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'ObjectMethod', 'exploreAction', 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'Convert.png'), 'Enabled', 1.0)), cellhorzcat(this.dlgText(xlate('Send to File Converter'), 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0], 'MatlabMethod', 'edit', 'MatlabArgs', cellhorzcat(cellhorzcat(fName)), 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'open.png'), 'Enabled', 1.0)), cellhorzcat(this.dlgText(xlate('Edit as text'), 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 2.0]))), xlate('Actions'), 'LayoutGrid', [2.0 2.0], 'ColStretch', [0.0 1.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(descMsg, 'WordWrap', 1.0))), xlate('Preview'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 22 47
    % 23 47
    % 24 47
    % 25 47
    % 26 47
    % 27 47
    % 28 47
    % 29 47
    % 30 47
    % 31 47
    % 32 47
    % 33 47
    % 34 47
    % 35 47
    % 36 47
    % 37 47
    % 38 47
    % 39 47
    % 40 47
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
end % function
