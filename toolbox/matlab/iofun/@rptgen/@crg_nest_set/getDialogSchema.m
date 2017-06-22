function dlgStruct = getDialogSchema(this, name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(isempty(this.RuntimeNestedReport))
        this.RuntimeNestedReport = [];
    end % if
    % 11 13
    fName = rptgen.parseExpressionText(this.FileName);
    if isempty(fName)
        desc = xlate('Enter the name of a .rpt file');
    else
        libRpt = findRptByName(RptgenML.Root, fName, true, false);
        % 17 20
        % 18 20
        if isa(libRpt, 'RptgenML.LibraryRpt')
            try
                desc = libRpt.getDescription('-deferred');
            catch
                desc = lasterr;
            end % try
        else
            desc = sprintf('No report "%s".', fName);
        end % if
    end % if
    % 29 33
    % 30 33
    % 31 33
    wFileName = this.dlgWidget('FileName', 'DialogRefresh', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]);
    % 33 37
    % 34 37
    % 35 37
    tFileName = this.dlgText(wFileName.Name, 'ColSpan', [1.0 1.0], 'RowSpan', wFileName.RowSpan);
    % 37 40
    % 38 40
    wFileName = rmfield(wFileName, 'Name');
    % 40 43
    % 41 43
    wRecursionLimit = this.dlgWidget('RecursionLimit', 'RowSpan', [4.0 4.0], 'ColSpan', [2.0 3.0], 'Enabled', this.Inline);
    % 43 47
    % 44 47
    % 45 47
    tRecursionLimit = this.dlgText(wRecursionLimit.Name, 'ColSpan', [1.0 1.0], 'RowSpan', wRecursionLimit.RowSpan);
    % 47 50
    % 48 50
    wRecursionLimit = rmfield(wRecursionLimit, 'Name');
    % 50 53
    % 51 53
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(tFileName), cellhorzcat(wFileName), cellhorzcat(this.dlgFileBrowse('FileName', '*.rpt', 'RowSpan', [1.0 1.0], 'ColSpan', [3.0 3.0])), cellhorzcat(this.dlgWidget('FindAllFiles', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 3.0])), cellhorzcat(this.dlgWidget('Inline', 'DialogRefresh', 1.0, 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 3.0])), cellhorzcat(tRecursionLimit), cellhorzcat(wRecursionLimit), cellhorzcat(this.dlgWidget('InsertFilename', 'RowSpan', [5.0 5.0], 'ColSpan', [1.0 3.0], 'Enabled', not(this.Inline))), cellhorzcat(this.dlgWidget('IncrementFilename', 'RowSpan', [6.0 6.0], 'ColSpan', [1.0 3.0], 'Enabled', not(this.Inline)))), xlate('Properties'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'ColStretch', [0.0 0.0 0.0], 'LayoutGrid', [6.0 3.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(desc, 'WordWrap', 1.0))), xlate('Nested File Description'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [2.0 1.0], 'RowStretch', [0.0 1.0]);
    % 53 90
    % 54 90
    % 55 90
    % 56 90
    % 57 90
    % 58 90
    % 59 90
    % 60 90
    % 61 90
    % 62 90
    % 63 90
    % 64 90
    % 65 90
    % 66 90
    % 67 90
    % 68 90
    % 69 90
    % 70 90
    % 71 90
    % 72 90
    % 73 90
    % 74 90
    % 75 90
    % 76 90
    % 77 90
    % 78 90
    % 79 90
    % 80 90
    % 81 90
    % 82 90
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
