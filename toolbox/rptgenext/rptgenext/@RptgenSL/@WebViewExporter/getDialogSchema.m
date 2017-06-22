function dlgStruct = getDialogSchema(thisComp, dlgType)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if isempty(DAStudio.ToolRoot.getOpenDialogs(thisComp))
        firstRun = true;
        thisComp.CacheFoundSys = [];
        previewSys = '';
        buttonSet = {'Cancel','Help'};
    else
        % 23 25
        firstRun = false;
        % 25 27
        if not(isempty(thisComp.CacheFoundSys))
            % 27 29
            previewSys = thisComp.findSystems;
        else
            % 30 32
            thisComp.CacheFoundSys = [];
            previewSys = thisComp.CacheFoundSys;
        end
        % 34 36
        buttonSet = {'OK','Cancel','Help'};
    end
    % 37 39
    traverseDown = strcmp(thisComp.SearchScope, 'CurrentAndBelow') || strcmp(thisComp.SearchScope, 'All');
    % 39 41
    cMain = thisComp.dlgContainer(vertcat(cellhorzcat(struct('Type', 'image', 'Name', 'image preview', 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgenext', 'resources', horzcat('SLTraverse', thisComp.SearchScope, '.png')), 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 3.0])), cellhorzcat(thisComp.dlgWidget('SearchScope', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 3.0])), cellhorzcat(thisComp.dlgWidget('LookUnderMasks', 'DialogRefresh', true, 'Enabled', traverseDown, 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 3.0])), cellhorzcat(rmfield(thisComp.dlgWidget('FollowLinks', 'Type', 'checkbox', 'InitialValue', double(strcmp(thisComp.FollowLinks, 'on')), 'ObjectMethod', 'dlgDatatypeEnum', 'MethodArgs', {'FollowLinks','%dialog'}, 'ArgDataTypes', {'string','handle'}, 'UserData', {'off','off';'on','on'}, 'Enabled', traverseDown, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 2.0]), 'ObjectProperty')), cellhorzcat(rmfield(thisComp.dlgWidget('FollowModelReference', 'Type', 'checkbox', 'InitialValue', double(strcmp(thisComp.FollowModelReference, 'on')), 'ObjectMethod', 'dlgDatatypeEnum', 'MethodArgs', {'FollowModelReference','%dialog'}, 'ArgDataTypes', {'string','handle'}, 'UserData', {'off','off';'on','on'}, 'Enabled', traverseDown, 'RowSpan', [3.0 3.0], 'ColSpan', [3.0 3.0]), 'ObjectProperty'))), xlate('Export Options'), 'LayoutGrid', [3.0 3.0], 'ColStretch', [0.0 1.0 1.0], 'RowStretch', [0.0 0.0 0.0], 'ColSpan', [1.0 1.0], 'RowSpan', [2.0 2.0]);
    % 41 79
    % 42 79
    % 43 79
    % 44 79
    % 45 79
    % 46 79
    % 47 79
    % 48 79
    % 49 79
    % 50 79
    % 51 79
    % 52 79
    % 53 79
    % 54 79
    % 55 79
    % 56 79
    % 57 79
    % 58 79
    % 59 79
    % 60 79
    % 61 79
    % 62 79
    % 63 79
    % 64 79
    % 65 79
    % 66 79
    % 67 79
    % 68 79
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    cAction = thisComp.dlgContainer(vertcat(cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'ExportButton', 'Name', xlate('Export model'), 'Enabled', not(isempty(previewSys)), 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0], 'ToolTip', xlate('Export Simulink Web View'), 'MatlabMethod', 'dlgGenerateFile', 'MatlabArgs', cellhorzcat(cellhorzcat(thisComp, previewSys, '%dialog')))), cellhorzcat(thisComp.dlgText(xlate('Export Simulink Web View'), 'WordWrap', true, 'ColSpan', [2.0 2.0], 'RowSpan', [1.0 1.0]))), xlate('Export'), 'Visible', not(strcmp(dlgType, 'standalone')), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'RowStretch', 0.0, 'ColSpan', [1.0 1.0], 'RowSpan', [1.0 1.0]);
    % 79 102
    % 80 102
    % 81 102
    % 82 102
    % 83 102
    % 84 102
    % 85 102
    % 86 102
    % 87 102
    % 88 102
    % 89 102
    % 90 102
    % 91 102
    % 92 102
    % 93 102
    % 94 102
    % 95 102
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    if firstRun
        cTable = thisComp.dlgContainer(vertcat(cellhorzcat(thisComp.dlgText(xlate('Generating table...')))), xlate('Exported Layers'), 'LayoutGrid', [2.0 2.0], 'ColStretch', [1.0 0.0], 'RowStretch', [1.0 0.0], 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0]);
    else
        % 104 112
        % 105 112
        % 106 112
        % 107 112
        % 108 112
        % 109 112
        % 110 112
        % 111 114
        % 112 114
        if isempty(previewSys)
            previewTable = cellhorzcat(horzcat('<', xlate('none'), '>'), horzcat('<', xlate('No layers found'), '>'));
        else
            % 116 118
            previewTable = horzcat(rptgen.safeGet(previewSys, 'Name'), rptgen.safeGet(previewSys, 'Path'));
            % 118 120
            previewTable = strrep(previewTable, char(10.0), ' ');
        end
        % 121 123
        cTable = thisComp.dlgContainer(vertcat(cellhorzcat(struct('Type', 'table', 'Tag', 'LayerTable', 'Size', size(previewTable), 'Grid', true, 'Data', cellhorzcat(previewTable), 'ColHeader', cellhorzcat(cellhorzcat(xlate('Name'), xlate('Path'))), 'ColumnCharacterWidth', [12.0 24.0], 'Editable', false, 'HeaderVisibility', [0.0 1.0], 'ValueChangedCallback', @onValueChanged, 'CurrentItemChangedCallback', @onCurrentChanged, 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 2.0])), cellhorzcat(struct('Type', 'pushbutton', 'Tag', 'RefreshLayerTable', 'Name', xlate('Refresh'), 'Visible', isempty(thisComp.StartPoint), 'ColSpan', [2.0 2.0], 'RowSpan', [2.0 2.0], 'ToolTip', xlate('Refresh list of exported layers'), 'MatlabMethod', 'refresh', 'MatlabArgs', {{'%dialog'}}))), xlate('Exported Layers'), 'LayoutGrid', [2.0 2.0], 'ColStretch', [1.0 0.0], 'RowStretch', [1.0 0.0], 'ColSpan', [1.0 1.0], 'RowSpan', [3.0 3.0]);
        % 123 153
        % 124 153
        % 125 153
        % 126 153
        % 127 153
        % 128 153
        % 129 153
        % 130 153
        % 131 153
        % 132 153
        % 133 153
        % 134 153
        % 135 153
        % 136 153
        % 137 153
        % 138 153
        % 139 153
        % 140 153
        % 141 153
        % 142 153
        % 143 153
        % 144 153
        % 145 153
        % 146 153
        % 147 153
        % 148 153
        % 149 153
        % 150 153
        % 151 153
    end
    % 153 155
    if strcmp(dlgType, 'standalone')
        % 155 169
        % 156 169
        % 157 169
        % 158 169
        % 159 169
        % 160 169
        % 161 169
        % 162 169
        % 163 169
        % 164 169
        % 165 169
        % 166 169
        % 167 169
        genArgs = vertcat(cellhorzcat('PreApplyCallback', 'dlgGenerateFile', 'PreApplyArgs', cellhorzcat(thisComp, previewSys, '%dialog'), 'StandaloneButtonSet', buttonSet));
    else
        % 170 174
        % 171 174
        % 172 174
        % 173 175
        genArgs = {};
    end
    % 176 178
    dlgStruct = thisComp.dlgMain(dlgType, vertcat(cellhorzcat(cAction), cellhorzcat(cMain), cellhorzcat(cTable)), genArgs{:}, 'OpenCallback', @dlgOpenCallback, 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0], 'ColStretch', 1.0, 'DisableDialog', firstRun);
    % 178 188
    % 179 188
    % 180 188
    % 181 188
    % 182 188
    % 183 188
    % 184 188
    % 185 188
    % 186 188
end
function dlgOpenCallback(thisDlgH)
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    drawnow;
    thisComp = thisDlgH.getSource;
    % 197 200
    % 198 200
    t = timer;
    t.TimerFcn = cellhorzcat(@dlgFindSystems, thisComp, thisDlgH);
    % 201 207
    % 202 207
    % 203 207
    % 204 207
    % 205 207
    t.StartDelay = .1;
    start(t);
end
function dlgFindSystems(obj, event, thisComp, thisDlgH)
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    thisComp.CacheFoundSys = thisComp.findSystems;
    if isa(thisDlgH, 'DAStudio.Dialog')
        thisDlgH.refresh();
    end
end
function onValueChanged(d, r, c, val)
    % 220 223
    % 221 223
end
function onCurrentChanged(d, r, c)
    % 224 230
    % 225 230
    % 226 230
    % 227 230
    % 228 230
end
