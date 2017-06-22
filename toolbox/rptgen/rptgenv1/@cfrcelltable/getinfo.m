function out = getinfo(c)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    out = getprotocomp(c);
    % 19 23
    % 20 23
    % 21 23
    out.Name = xlate('Cell Table');
    out.Type = 'FR';
    out.Desc = xlate('Inserts a table based upon defined cells');
    % 25 29
    % 26 29
    % 27 29
    out.att.TableTitle = '';
    % 29 31
    out.att.TableCells = {};
    out.att.isArrayFromWorkspace = logical(0);
    out.att.WorkspaceVariableName = '';
    % 33 35
    out.att.isPgwide = logical(1);
    out.att.ColumnWidths = [];
    % 36 38
    out.att.allAlign = 'l';
    out.att.cellAlign = {};
    % 39 41
    out.att.isBorder = logical(1);
    out.att.cellBorders = {};
    % 42 44
    out.att.isInverted = logical(0);
    % 44 46
    out.att.numHeaderRows = 1.0;
    out.att.Footer = 'NONE';
    out.att.numFooterRows = 1.0;
    % 48 50
    out.att.ShrinkEntries = logical(1);
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    out.attx.TableTitle.String = 'Table title';
    % 55 57
    out.attx.TableTitle.isParsedText = logical(1);
    % 57 60
    % 58 60
    out.attx.WorkspaceVariableName.String = 'Create table from MxN cell array with workspace variable name';
    % 60 64
    % 61 64
    % 62 64
    out.attx.allAlign.enumValues = {'l','c','r','j'};
    out.attx.allAlign.enumNames = {'Left';'Center';'Right';'Double justified'};
    % 65 69
    % 66 69
    % 67 69
    out.attx.allAlign.String = 'Cell alignment';
    % 69 72
    % 70 72
    out.attx.isBorder.String = 'Table grid lines';
    % 72 76
    % 73 76
    % 74 76
    out.attx.isPgwide.String = 'Table spans page width';
    % 76 79
    % 77 79
    out.attx.isInverted.String = 'Rotate table 90 degrees';
    % 79 82
    % 80 82
    out.attx.numHeaderRows.String = 'Number of header rows';
    % 82 85
    % 83 85
    out.attx.Footer.enumValues = {'NONE','COPY_HEADER','LASTROWS'};
    out.attx.Footer.enumNames = {'No footer';'Footer is the same as header';'Last N rows are footer'};
    % 86 89
    % 87 89
    out.attx.Footer.UIcontrol = 'radiobutton';
    out.attx.Footer.String = '';
    % 90 93
    % 91 93
    out.attx.numFooterRows.String = '';
    % 93 96
    % 94 96
    out.attx.ColumnWidths.String = 'Column widths';
    % 96 98
    out.attx.ShrinkEntries = 'Collapse large cells to a simple description';
end
