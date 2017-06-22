function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('FileName', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 19.0], 'DialogRefresh', true)), cellhorzcat(this.dlgFileBrowse('FileName', '*.txt;*.html;*.rtf;*.m', 'RowSpan', [1.0 1.0], 'ColSpan', [20.0 20.0])), cellhorzcat(this.dlgWidget('ImportType', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 20.0]))), xlate('Properties'), 'LayoutGrid', [2.0 20.0], 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(LocPreview(this), 'WordWrap', 1.0))), xlate('File Contents'), 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
end
function msgString = LocPreview(this)
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    fName = rptgen.parseExpressionText(this.FileName);
    % 31 33
    if not(isempty(fName))
        try
            fid = fopen(fName, 'r');
        catch
            fid = -1.0;
        end % try
        if gt(fid, 0.0)
            msgString = ctranspose(char(fread(fid, 256.0, 'char')));
            fclose(fid);
            % 41 43
            if isempty(msgString)
                msgString = sprintf('Warning - File "%s" contains no text.', fName);
            else
                if eq(length(msgString), 256.0)
                    msgString = horzcat(msgString, '...');
                end
            end
        else
            msgString = sprintf('Error - Could not open file "%s".', fName);
        end
    else
        msgString = xlate('Please specify a file to import');
    end
end
