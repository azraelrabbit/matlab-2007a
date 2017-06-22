function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkgRG = findpackage('rptgen');
    clsH = schema.class(pkgRG, 'rpt_prop_table', pkgRG.findclass('rptcomponent'));
    % 8 10
    pkgRG.findclass('rpt_prop_cell');
    % 10 13
    % 11 13
    p = rptgen.prop(clsH, 'TableTitle', 'rptgen.rpt_prop_cell');
    % 13 15
    p.AccessFlags.Init = 'off';
    p.AccessFlags.AbortSet = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.GetFunction = @getTableTitle;
    p.SetFunction = @setTableTitle;
    % 20 22
    p = rptgen.prop(clsH, 'isBorder', 'bool', true, xlate('Display outer border'));
    % 22 25
    % 23 25
    p = rptgen.prop(clsH, 'SingleValueMode', 'bool', false, xlate('Split property/value cells'));
    % 25 28
    % 26 28
    p = rptgen.prop(clsH, 'ColWidths', 'MATLAB array', [], xlate('Column widths'));
    % 28 31
    % 29 31
    p = rptgen.prop(clsH, 'TableContent', 'rptgen.rpt_prop_cell vector');
    p.AccessFlags.Init = 'off';
    % 32 34
    p.SetFunction = @setTableContent;
    % 34 36
    p = rptgen.prop(clsH, 'DlgCellIndex', 'mxArray', 0.0, '', 2.0);
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
    m = schema.method(clsH, 'dlgApplyPresetTable');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 51 54
    % 52 54
    rptgen.makeStaticMethods(clsH, {}, {'addCell';'orderCells';'init';'doCopy';'dlgEditor';'dlgSelectCell';'applyPresetTable';'dlgApplyPresetTable';'pt_applyPresetTable';'pt_getObjectName';'pt_getPresetTableList';'pt_getPropertySource';'pt_getReportedObject';'qe_test_tables';'setTableStrings';'v1convert_table';'mcodeConstructor';'mergeCells';'canMergeCells';'splitCells';'canSplitCells';'getCurrentCell';'setCurrentCell';'getTableDims';'changeLayout';'canChangeLayout'});
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
end
function returnedValue = getTableTitle(this, storedValue)
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    returnedValue = find(this, '-depth', 1.0, '-isa', 'rptgen.rpt_prop_cell', 'TitleMode', true);
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    if isempty(returnedValue)
        if not(isempty(storedValue))
            % 94 96
            returnedValue = storedValue
            setTableTitle(this, storedValue);
        else
            % 98 100
            returnedValue = rptgen.rpt_prop_cell(this, 'TitleMode', true);
        end
    else
        returnedValue = returnedValue(1.0);
        % 103 105
    end
end
function storedValue = setTableTitle(this, proposedValue)
    % 107 110
    % 108 110
    if not(isa(proposedValue, 'rptgen.rpt_prop_cell')) || not(proposedValue.TitleMode)
        error('rptgen:ProptableTitleType', 'TitleType requires rptgen.rpt_prop_cell with TitleMode=true');
        % 111 113
    end
    % 113 115
    currValue = find(this, '-depth', 1.0, '-isa', 'rptgen.rpt_prop_cell', 'TitleMode', true);
    % 115 120
    % 116 120
    % 117 120
    % 118 120
    if not(isempty(currValue))
        for i=1.0:length(currValue)
            if ne(currValue(i), proposedValue)
                disconnect(currValue(i));
            else
                % 124 126
            end
        end % for
    end
    % 128 130
    connect(proposedValue, this, 'up');
    % 130 132
    storedValue = [];
end
function storedValue = setTableContent(this, storedValue)
    % 134 137
    % 135 137
    for i=1.0:length(storedValue)
        if not(isequal(this, up(storedValue(i))))
            connect(storedValue(i), this, 'up');
        end
    end % for
end
