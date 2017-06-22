function loopContent = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        loopContent = this.buildErrorMessage('panel', true);
        return;
        % 9 11
    end % if
    % 11 13
    nModels = length(this.LoopList);
    % 13 15
    loopContent = cell(1.0, nModels);
    for i=nModels:-1.0:1.0
        loopContent{i} = this.LoopList(i).getDisplayLabel;
    end % for
    % 18 21
    % 19 21
    if lt(nModels, 1.0)
        enableUp = false;
        enableDown = false;
        wLoopList = this.dlgText('No models to loop');
    else
        mdlIdx = max(1.0, min(plus(this.DlgLoopListIdx, 1.0), nModels));
        wLoopList = getDialogSchema(this.LoopList(mdlIdx), 'panel');
        enableUp = gt(mdlIdx, 1.0);
        enableDown = lt(mdlIdx, nModels);
    end % if
    % 30 32
    listFrame = this.dlgContainer(vertcat(cellhorzcat(struct('Type', 'pushbutton', 'Enabled', enableUp, 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/move_up.png'), 'ObjectMethod', 'dlgMoveUp', 'MethodArgs', {{'%dialog'}}, 'ArgDataTypes', {{'handle'}}, 'ToolTip', xlate('Move current model up'), 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'Enabled', enableDown, 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/move_down.png'), 'ObjectMethod', 'dlgMoveDown', 'MethodArgs', {{'%dialog'}}, 'ArgDataTypes', {{'handle'}}, 'ToolTip', xlate('Move current model down'), 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0])), cellhorzcat(struct('Type', 'pushbutton', 'Enabled', gt(nModels, 1.0), 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/delete.png'), 'ObjectMethod', 'dlgDelete', 'MethodArgs', {{'%dialog'}}, 'ArgDataTypes', {{'handle'}}, 'ToolTip', xlate('Remove current model from list'), 'ColSpan', [1.0 1.0], 'RowSpan', [4.0 4.0])), cellhorzcat(struct('Type', 'pushbutton', 'FilePath', fullfile(matlabroot, 'toolbox/rptgen/resources/SimulinkModelAdd.png'), 'ObjectMethod', 'dlgAdd', 'MethodArgs', {{'%dialog'}}, 'ArgDataTypes', {{'handle'}}, 'ToolTip', xlate('Add new model to list'), 'ColSpan', [1.0 1.0], 'RowSpan', [5.0 5.0])), cellhorzcat(this.dlgWidget('DlgLoopListIdx', 'Type', 'listbox', 'MultiSelect', false, 'DialogRefresh', true, 'ListKeyPressCallback', @listboxDelete, 'Entries', loopContent, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 6.0]))), xlate('Models to Include'), 'LayoutGrid', [6.0 2.0], 'RowStretch', [1.0 0.0 0.0 0.0 0.0 1.0]);
    % 32 83
    % 33 83
    % 34 83
    % 35 83
    % 36 83
    % 37 83
    % 38 83
    % 39 83
    % 40 83
    % 41 83
    % 42 83
    % 43 83
    % 44 83
    % 45 83
    % 46 83
    % 47 83
    % 48 83
    % 49 83
    % 50 83
    % 51 83
    % 52 83
    % 53 83
    % 54 83
    % 55 83
    % 56 83
    % 57 83
    % 58 83
    % 59 83
    % 60 83
    % 61 83
    % 62 83
    % 63 83
    % 64 83
    % 65 83
    % 66 83
    % 67 83
    % 68 83
    % 69 83
    % 70 83
    % 71 83
    % 72 83
    % 73 83
    % 74 83
    % 75 83
    % 76 83
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    loopContent = this.dlgContainer(vertcat(cellhorzcat(this.dlgSet(wLoopList, 'ColSpan', [2.0 3.0], 'RowSpan', [1.0 1.0])), cellhorzcat(this.dlgSet(listFrame, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]))), '', 'LayoutGrid', [1.0 3.0]);
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
end % function
function listboxDelete(dlgH, tag, key)
    % 91 104
    % 92 104
    % 93 104
    % 94 104
    % 95 104
    % 96 104
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if strcmpi(key, 'del')
        dlgDelete(dlgH.getDialogSource, dlgH);
    end % if
end % function
