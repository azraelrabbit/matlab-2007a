function dlg = getDialogSchema(hObj, schemaName)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if not(hdlcoderui.isslhdlcinstalled)
        dlg = [];
        return;
    end % if
    % 16 19
    % 17 19
    if isempty(hObj.HDLCoder.StartNodeName)
        % 19 23
        % 20 23
        % 21 23
        msgtxt.Type = 'text';
        msgtxt.Name = '';
        msgtxt.Tag = 'not_available';
        msgtxt.WidgetId = 'id1';
        % 26 28
        msgtxt2.Type = 'text';
        msgtxt2.Name = '';
        msgtxt2.Tag = 'not_available2';
        msgtxt2.WidgetId = 'id2';
        % 31 33
        dlg.DialogTitle = 'HDL Coder Configuration Preferences is not available';
        dlg.Items = cellhorzcat(msgtxt, msgtxt2);
        dlg.LayoutGrid = [1.0 1.0];
    else
        % 36 38
        dlg = [];
        HDLC_Name = 'HDL Coder';
        pageName = 'HDL Coder';
        % 40 46
        % 41 46
        % 42 46
        % 43 46
        % 44 46
        hSrc = hObj.getSourceObject;
        tag = 'Tag_ConfigSet_HDLCoder_';
        hConfigSet = hSrc.getConfigSet;
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        [generalTab, pnlGen] = getTabDialogSchema(hObj, schemaName);
        % 53 57
        % 54 57
        % 55 57
        list = [];
        items = [];
        list{1.0} = HDLC_Name;
        items{1.0} = generalTab;
        % 60 63
        % 61 63
        for idx=1.0:length(hObj.SubComponents)
            dlgInfo = getTabDialogSchema(hObj.SubComponents(idx), 'tab', hObj);
            list{plus(idx, 1.0)} = dlgInfo.Name;
            items{plus(idx, 1.0)} = dlgInfo;
        end % for
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        bottom = getGBDialogSchema(hObj, hSrc);
        % 72 75
        % 73 75
        tabs.Name = 'Tabs';
        tabs.Type = 'tab';
        tabs.Tag = horzcat(tag, 'tabs');
        tabs.Tabs = items;
        % 78 82
        % 79 82
        % 80 82
        tabs.ActiveTab = get(hObj, 'HDLCActiveTab');
        tabs.TabChangedCallback = 'hdlcoderui.changehdlconfigtab';
        % 83 89
        % 84 89
        % 85 89
        % 86 89
        % 87 89
        if strcmp(schemaName, 'list')
            disp('1st: dlg')
            dlg.List = cellhorzcat(list{1.0}, cellhorzcat(list{2.0:end}));
            panel.Name = '';
            panel.Type = 'panel';
            selectedPath = get(hConfigSet, 'CurrentDlgPage');
            offset = length('HDL Coder/');
            if strcmp(selectedPath, 'HDL Coder')
                selectedPage = 'General';
            else
                if strncmp(selectedPath, 'HDL Coder', minus(offset, 1.0))
                    selectedPage = selectedPath(plus(offset, 1.0):end);
                else
                    selectedPage = '';
                end % if
            end % if
            hasVisibleItem = false;
            for i=1.0:length(items)
                item = items{i};
                item.Type = 'panel';
                item.Visible = strcmp(item.Name, selectedPage);
                hasVisibleItem = or(hasVisibleItem, item.Visible);
                panel.Items{i} = item;
            end % for
            if not(hasVisibleItem) && not(isempty(selectedPage))
                panel.Items{1.0}.Visible = true;
                set(hConfigSet, 'CurrentDlgPage', 'HDL Coder');
            end % if
            panel.Items{plus(end, 1.0)} = bottom;
            dlg.Item = panel;
        else
            if strcmp(schemaName, 'stack')
                % 120 123
                % 121 123
                for idx=1.0:length(pnlGen.Items)
                    pnlGen.Items{idx}.RowSpan = horzcat(idx, idx);
                end % for
                % 125 127
                bottom.RowSpan = horzcat(plus(idx, 1.0), plus(idx, 1.0));
                general.LayoutGrid = horzcat(plus(idx, 1.0), plus(idx, 1.0));
                general.RowStretch = horzcat(zeros(1.0, idx), 1.0);
                general.Source = hSrc;
                general.Items = cellhorzcat(pnlGen.Items{:}, bottom);
                items{1.0} = general;
                % 132 134
                dlg.List = cellhorzcat(list{1.0}, cellhorzcat(list{2.0:end}));
                % 134 136
                ids = {};
                for i=1.0:length(items)
                    items{i}.Type = 'panel';
                    if gt(i, 1.0)
                        ids{plus(end, 1.0)} = minus(i, 1.0);
                    end % if
                end % for
                dlg.Items = items;
                dlg.Ids = cellhorzcat(0.0, ids);
            else
                if strcmp(schemaName, 'tab')
                    panel.Name = '';
                    panel.Type = 'panel';
                    panel.Items = cellhorzcat(tabs, bottom);
                    dlg.Name = pageName;
                    dlg.Items = cellhorzcat(panel);
                else
                    % 152 156
                    % 153 156
                    % 154 156
                    panel.Name = '';
                    panel.Type = 'panel';
                    panel.Items = cellhorzcat(tabs, bottom);
                    % 158 160
                    pages{length(tabs.Tabs)} = [];
                    for i=1.0:length(tabs.Tabs)
                        % 161 164
                        % 162 164
                        pages{i} = tabs.Tabs{i}.Name;
                    end % for
                    dlg.DialogTitle = pageName;
                    dlg.Items = cellhorzcat(panel);
                    % 167 171
                    % 168 171
                    % 169 171
                end % if
                % 171 179
                % 172 179
                % 173 179
                % 174 179
                % 175 179
                % 176 179
                % 177 179
            end % if
        end % if
        dlg.CloseCallback = 'slprivate';
        dlg.CloseArgs = cellhorzcat('configDlgAction', '%dialog', hObj, '%closeaction', 'HDLCoder');
        dlg.PreApplyCallback = 'slprivate';
        dlg.PreApplyArgs = cellhorzcat('configDlgAction', '%dialog', hObj, 'apply', 'HDLCoder');
        dlg.HelpMethod = 'hdlcoderui.hdlHelp';
        dlg.HelpArgs = {'%dialog'};
    end % if
function bottom = getGBDialogSchema(hObj, hSrc)
    % 188 193
    % 189 193
    % 190 193
    % 191 193
    pf = hdlcoderui.getpixunit;
    % 193 195
    buttonWidth = mtimes(168.0, pf);
    buttonHeight = mtimes(24.0, pf);
    % 196 199
    % 197 199
    gbtn.Name = 'Generate';
    gbtn.ToolTip = 'Generate HDL';
    gbtn.Type = 'pushbutton';
    gbtn.Tag = 'ConfigSet_HDLCoder_MainPanel_Generate';
    gbtn.Source = hObj;
    gbtn.ObjectMethod = 'dialogCallback';
    gbtn.MethodArgs = cellhorzcat('%dialog', gbtn.Tag, 'enableApply');
    gbtn.ArgDataTypes = {'handle','string','string'};
    gbtn.MinimumSize = horzcat(buttonWidth, buttonHeight);
    gbtn.MaximumSize = horzcat(buttonWidth, buttonHeight);
    gbtn.RowSpan = [2.0 2.0];
    gbtn.ColSpan = [2.0 2.0];
    gbtn.Alignment = 3.0;
    gbtn.Enabled = and(not(isempty(hSrc.getModel)), not(hSrc.isObjectLocked));
    % 212 215
    % 213 215
    chkbtn.Name = 'Run Compatibility Checker';
    chkbtn.ToolTip = 'HDL Compatibility Checker';
    chkbtn.Type = 'pushbutton';
    chkbtn.Tag = 'ConfigSet_HDLCoder_MainPanel_CheckHDL';
    chkbtn.Source = hObj;
    chkbtn.ObjectMethod = 'dialogCallback';
    chkbtn.MethodArgs = cellhorzcat('%dialog', chkbtn.Tag, 'enableApply');
    chkbtn.ArgDataTypes = {'handle','string','string'};
    chkbtn.MinimumSize = horzcat(buttonWidth, buttonHeight);
    chkbtn.MaximumSize = horzcat(buttonWidth, buttonHeight);
    chkbtn.RowSpan = [1.0 1.0];
    chkbtn.ColSpan = [2.0 2.0];
    chkbtn.Alignment = 3.0;
    chkbtn.Enabled = and(not(isempty(hSrc.getModel)), not(hSrc.isObjectLocked));
    % 228 231
    % 229 231
    dftbtn.Name = 'Restore Factory Defaults';
    dftbtn.ToolTip = 'Reset all HDL Code Generation settings';
    dftbtn.Type = 'pushbutton';
    dftbtn.Tag = 'ConfigSet_HDLCoder_MainPanel_Default';
    dftbtn.Source = hObj;
    dftbtn.ObjectMethod = 'dialogCallback';
    dftbtn.MethodArgs = cellhorzcat('%dialog', dftbtn.Tag, 'enableApply');
    dftbtn.ArgDataTypes = {'handle','string','string'};
    dftbtn.MinimumSize = horzcat(buttonWidth, buttonHeight);
    dftbtn.MaximumSize = horzcat(buttonWidth, buttonHeight);
    dftbtn.RowSpan = [1.0 1.0];
    dftbtn.ColSpan = [1.0 1.0];
    dftbtn.Alignment = 1.0;
    dftbtn.Mode = true;
    dftbtn.DialogRefresh = true;
    % 245 260
    % 246 260
    % 247 260
    % 248 260
    % 249 260
    % 250 260
    % 251 260
    % 252 260
    % 253 260
    % 254 260
    % 255 260
    % 256 260
    % 257 260
    % 258 260
    bottom.Name = 'Build Group';
    bottom.Type = 'panel';
    bottom.Items = cellhorzcat(gbtn, chkbtn, dftbtn);
    % 262 264
    bottom.LayoutGrid = [20.0 2.0];
    bottom.ColStretch = [1.0 0.0];
