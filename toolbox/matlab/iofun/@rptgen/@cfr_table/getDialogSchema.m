function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    w = this.dlgWidget;
    % 7 10
    % 8 10
    cwProp = struct(this.findprop('ColumnWidths'));
    cwProp.DataType = 'double vector';
    w.ColumnWidths = this.dlgWidget(cwProp);
    % 12 14
    if ischar(this.Source)
        % 14 16
        p = struct(findprop(classhandle(this), 'Source'));
        p.DataType = 'rgcomponentorparsedstring';
        % 17 19
        w.Source = this.dlgWidget(p);
    else
        w.Source = this.dlgText(horzcat(xlate('Source: '), rptgen.toString(this.Source, 32.0, ' ')));
    end % if
    % 22 24
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.Source), cellhorzcat(w.ShrinkEntries)), xlate('Table Content'), 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(w.TableTitle), cellhorzcat(w.AllAlign), cellhorzcat(w.ColumnWidths), cellhorzcat(w.isBorder), cellhorzcat(w.isPgwide)), xlate('Formatting Options'), 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(w.numHeaderRows, 'ColSpan', [1.0 2.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(w.Footer, 'DialogRefresh', true, 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(this.dlgSet(w.numFooterRows, 'Enabled', strcmp(this.Footer, 'LASTROWS'), 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0]))), xlate('Header/Footer Options'), 'LayoutGrid', [2.0 2.0], 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [4.0 1.0], 'RowStretch', [0.0 0.0 0.0 1.0]);
    % 24 52
    % 25 52
    % 26 52
    % 27 52
    % 28 52
    % 29 52
    % 30 52
    % 31 52
    % 32 52
    % 33 52
    % 34 52
    % 35 52
    % 36 52
    % 37 52
    % 38 52
    % 39 52
    % 40 52
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
