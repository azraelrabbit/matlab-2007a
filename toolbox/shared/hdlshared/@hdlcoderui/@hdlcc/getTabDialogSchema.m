function [generalTab, pnlGen] = getTabDialogSchema(hObj, schemaName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hCLI = hObj.HDLCoder.CoderParameterObject.CLI;
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    tag = 'ConfigSet_HDLCoder_MainPanel_';
    % 14 17
    % 15 17
    cfgf_editOP = 'HDLConfigFileStr';
    cfgf_edit.Type = 'edit';
    cfgf_edit.Name = 'File name: ';
    cfgf_edit.Source = hObj;
    cfgf_edit.ObjectProperty = cfgf_editOP;
    cfgf_edit.Tag = horzcat(tag, cfgf_editOP);
    cfgf_edit.RowSpan = [1.0 1.0];
    cfgf_edit.ColSpan = [1.0 2.0];
    cfgf_edit.ToolTip = 'HDL Coder control file name';
    cfgf_edit.Mode = true;
    cfgf_edit.DialogRefresh = true;
    cfgf_edit.Enabled = false;
    % 28 31
    % 29 31
    pf = hdlcoderui.getpixunit;
    % 31 33
    buttonWidth = mtimes(90.0, pf);
    buttonHeight = mtimes(24.0, pf);
    % 34 37
    % 35 37
    lcfg_pb.Type = 'pushbutton';
    lcfg_pb.Name = 'Load...';
    lcfg_pb.Tag = horzcat(tag, 'LoadCFGFile');
    lcfg_pb.RowSpan = [1.0 1.0];
    lcfg_pb.ColSpan = [3.0 3.0];
    lcfg_pb.ToolTip = 'Load an HDL Coder control file';
    lcfg_pb.Source = hObj;
    lcfg_pb.ObjectMethod = 'dialogCallback';
    lcfg_pb.MethodArgs = cellhorzcat('%dialog', lcfg_pb.Tag, 'enableApply');
    lcfg_pb.ArgDataTypes = {'handle','string','string'};
    lcfg_pb.MinimumSize = horzcat(buttonWidth, buttonHeight);
    lcfg_pb.MaximumSize = horzcat(buttonWidth, buttonHeight);
    lcfg_pb.Mode = true;
    lcfg_pb.DialogRefresh = true;
    % 50 53
    % 51 53
    scfg_pb.Type = 'pushbutton';
    scfg_pb.Name = 'Save...';
    scfg_pb.Tag = horzcat(tag, 'SaveCFGFile');
    scfg_pb.RowSpan = [2.0 2.0];
    scfg_pb.ColSpan = [3.0 3.0];
    scfg_pb.ToolTip = 'Save to an HDL Coder control file';
    scfg_pb.Source = hObj;
    scfg_pb.ObjectMethod = 'dialogCallback';
    scfg_pb.MethodArgs = cellhorzcat('%dialog', scfg_pb.Tag, 'enableApply');
    scfg_pb.ArgDataTypes = {'handle','string','string'};
    scfg_pb.MinimumSize = horzcat(buttonWidth, buttonHeight);
    scfg_pb.MaximumSize = horzcat(buttonWidth, buttonHeight);
    % 64 66
    spacer.Type = 'panel';
    spacer.RowSpan = [3.0 3.0];
    spacer.ColSpan = [1.0 3.0];
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    cfgg.Type = 'group';
    cfgg.Name = 'Code generation control file';
    cfgg.Items = cellhorzcat(cfgf_edit, lcfg_pb, scfg_pb, spacer);
    cfgg.LayoutGrid = [3.0 3.0];
    cfgg.ColStretch = [0.0 1.0 0.0];
    cfgg.RowStretch = [0.0 0.0 1.0];
    % 79 82
    % 80 82
    tsubsys_tt = 'Generate HDL code for top-level Simulink model or specified subsystem';
    tsubsys_lbl.Type = 'text';
    tsubsys_lbl.Name = 'Generate HDL for:';
    tsubsys_lbl.RowSpan = [1.0 1.0];
    tsubsys_lbl.ColSpan = [1.0 1.0];
    tsubsys_lbl.ToolTip = tsubsys_tt;
    tsubsys_lbl.Alignment = 0.0;
    tsubsys_lbl.Mode = true;
    % 89 91
    tsubsys_cb.Type = 'combobox';
    % 91 93
    tsubsys_cb.Source = hObj.HDLCoder;
    % 93 96
    % 94 96
    tsubsys_cb.ObjectProperty = 'StartNodeName';
    tsubsys_cb.Tag = horzcat(tag, tsubsys_cb.ObjectProperty);
    tsubsys_cb.RowSpan = [1.0 1.0];
    tsubsys_cb.ColSpan = [2.0 3.0];
    tsubsys_cb.ToolTip = tsubsys_tt;
    tsubsys_cb.Mode = true;
    tsubsys_cb.DialogRefresh = true;
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    if strcmpi(hObj.getModelName, hObj.HDLCoder.ModelConnection.ModelName)
        % 107 109
        tsubsys_cb.Entries = getTSubSysEntries(hObj);
    end % if
    % 110 113
    % 111 113
    ls_tt = 'Select code generation language';
    ls_prop = 'TargetLanguage';
    ls_lbl.Type = 'text';
    ls_lbl.Name = 'Language:';
    ls_lbl.RowSpan = [2.0 2.0];
    ls_lbl.ColSpan = [1.0 1.0];
    ls_lbl.ToolTip = ls_tt;
    % 119 121
    ls_popup.Type = 'combobox';
    ls_popup.Source = hCLI;
    ls_popup.ObjectProperty = ls_prop;
    ls_popup.Tag = horzcat(tag, ls_popup.ObjectProperty);
    ls_popup.RowSpan = [2.0 2.0];
    ls_popup.ColSpan = [2.0 3.0];
    ls_popup.Entries = ctranspose(set(hCLI, ls_prop));
    ls_popup.Mode = true;
    ls_popup.DialogRefresh = true;
    ls_popup.ToolTip = ls_tt;
    % 130 133
    % 131 133
    tdir_tt = 'Directory into which generated files are written';
    tdir_lbl.Type = 'text';
    tdir_lbl.Name = 'Directory:';
    tdir_lbl.RowSpan = [3.0 3.0];
    tdir_lbl.ColSpan = [1.0 1.0];
    tdir_lbl.ToolTip = tdir_tt;
    % 138 140
    tdir_eb.Type = 'edit';
    tdir_eb.Source = hObj;
    tdir_eb.ObjectProperty = 'TargetDirectory';
    tdir_eb.Tag = horzcat(tag, tdir_eb.ObjectProperty);
    tdir_eb.RowSpan = [3.0 3.0];
    tdir_eb.ColSpan = [2.0 4.0];
    tdir_eb.ToolTip = tdir_tt;
    tdir_eb.Mode = true;
    tdir_eb.DialogRefresh = true;
    % 148 151
    % 149 151
    browse_pb.Type = 'pushbutton';
    browse_pb.Name = 'Browse...';
    browse_pb.Tag = horzcat(tag, 'Browse');
    browse_pb.Source = hObj;
    % 154 156
    browse_pb.ObjectMethod = 'dialogCallback';
    browse_pb.MethodArgs = cellhorzcat('%dialog', browse_pb.Tag, 'enableApply');
    browse_pb.ArgDataTypes = {'handle','string','string'};
    browse_pb.Mode = true;
    browse_pb.DialogRefresh = true;
    browse_pb.RowSpan = [3.0 3.0];
    browse_pb.ColSpan = [5.0 5.0];
    browse_pb.ToolTip = 'Select the directory into which generated output files are to be written';
    browse_pb.MinimumSize = horzcat(buttonWidth, buttonHeight);
    browse_pb.MaximumSize = horzcat(buttonWidth, buttonHeight);
    % 165 167
    spacer.Type = 'panel';
    spacer.RowSpan = [4.0 4.0];
    spacer.ColSpan = [1.0 5.0];
    % 169 174
    % 170 174
    % 171 174
    % 172 174
    tg.Type = 'group';
    tg.Name = 'Target';
    tg.Items = cellhorzcat(tsubsys_lbl, tsubsys_cb, ls_lbl, ls_popup, tdir_lbl, tdir_eb, browse_pb, spacer);
    tg.LayoutGrid = [4.0 5.0];
    tg.ColStretch = [0.0 1.0 1.0 1.0 0.0];
    tg.RowStretch = [0.0 0.0 0.0 1.0];
    % 179 182
    % 180 182
    optionsradio.Type = 'radiobutton';
    optionsradio.Source = hObj;
    optionsradio.Tag = horzcat(tag, 'Output');
    optionsradio.Name = 'Code generation output';
    optionsradio.ObjectProperty = 'CodeGenOptions';
    optionsradio.Entries = {'Generate HDL code','Display generated model only','Generate HDL code and display generated model'};
    % 187 190
    % 188 190
    optionsradio.Mode = true;
    optionsradio.DialogRefresh = true;
    optionsradio.ToolTip = 'Select HDL coder generation mode.';
    % 192 195
    % 193 195
    pnlGen.Name = '';
    pnlGen.Type = 'panel';
    pnlGen.Items = cellhorzcat(cfgg, tg, optionsradio);
    % 197 202
    % 198 202
    % 199 202
    % 200 202
    generalTab.Items = cellhorzcat(pnlGen);
    generalTab.Name = 'General';
function ustrs = getTSubSysEntries(this)
    % 204 211
    % 205 211
    % 206 211
    % 207 211
    % 208 211
    % 209 211
    ustrs = this.HDLCoder.findTopLevelHDLNames;
