function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if strcmp(this.TitleType, 'auto')
        % 8 10
        switch lower(this.Source)
        case 'matfile'
            matFileName = rptgen.findFile(rptgen.parseExpressionText(this.Filename), true, 'mat');
            % 12 14
            [matPath, matFile, matExt] = fileparts(matFileName);
            autoName = sprintf('File %s%s', matFile, matExt);
        case 'global'
            autoName = xlate('the Global Workspace');
        otherwise
            autoName = xlate('the MATLAB Workspace');
        end % switch
        % 20 22
        autoTitle = sprintf('Variables from %s', autoName);
        % 22 24
        wTableTitle = this.dlgText(autoTitle);
    else
        % 25 27
        wTableTitle = this.dlgWidget('TableTitle');
    end % if
    % 28 30
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('Source', 'DialogRefresh', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('Filename', 'DialogRefresh', 1.0, 'Enabled', strcmpi(this.Source, 'matfile'), 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Source Workspace'), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', 0.0, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('TitleType', 'DialogRefresh', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(wTableTitle, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Table Title'), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', 0.0, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('isSize', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isBytes', 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isClass', 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgWidget('isValue', 'RowSpan', [4.0 4.0], 'ColSpan', [1.0 1.0]))), xlate('Table Columns'), 'LayoutGrid', [5.0 1.0], 'ColStretch', 1.0, 'RowStretch', [0.0 0.0 0.0 0.0 1.0], 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0], 'ColStretch', 1.0);
    % 30 82
    % 31 82
    % 32 82
    % 33 82
    % 34 82
    % 35 82
    % 36 82
    % 37 82
    % 38 82
    % 39 82
    % 40 82
    % 41 82
    % 42 82
    % 43 82
    % 44 82
    % 45 82
    % 46 82
    % 47 82
    % 48 82
    % 49 82
    % 50 82
    % 51 82
    % 52 82
    % 53 82
    % 54 82
    % 55 82
    % 56 82
    % 57 82
    % 58 82
    % 59 82
    % 60 82
    % 61 82
    % 62 82
    % 63 82
    % 64 82
    % 65 82
    % 66 82
    % 67 82
    % 68 82
    % 69 82
    % 70 82
    % 71 82
    % 72 82
    % 73 82
    % 74 82
    % 75 82
    % 76 82
    % 77 82
    % 78 82
    % 79 82
    % 80 82
