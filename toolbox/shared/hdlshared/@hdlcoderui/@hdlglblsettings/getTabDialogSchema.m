function paramsTab = getTabDialogSchema(this, schemaName, hTopObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tag = horzcat(getWidgetTagPrefix(this), 'GlbSettingsPanel_');
    % 8 10
    src = hTopObj.HDLCoder.CoderParameterObject.CLI;
    % 10 13
    % 11 13
    rtype_cbOP = 'ResetType';
    rtype_tt = 'Register reset style for generated HDL';
    rtype_lbl.Type = 'text';
    rtype_lbl.Name = 'Reset type:';
    rtype_lbl.Tag = horzcat(tag, rtype_cbOP, '_lbl');
    rtype_lbl.RowSpan = [1.0 1.0];
    rtype_lbl.ColSpan = [1.0 1.0];
    rtype_lbl.ToolTip = rtype_tt;
    % 20 22
    rtype_cb.Type = 'combobox';
    rtype_cb.Entries = ctranspose(set(src, rtype_cbOP));
    rtype_cb.ObjectProperty = rtype_cbOP;
    rtype_cb.Tag = horzcat(tag, rtype_cb.ObjectProperty);
    rtype_cb.RowSpan = [1.0 1.0];
    rtype_cb.ColSpan = [2.0 2.0];
    rtype_cb.ToolTip = rtype_tt;
    rtype_cb.Source = src;
    rtype_cb.Mode = true;
    % 30 33
    % 31 33
    ralvlOP = 'ResetAssertedLevel';
    ralvl_tt = 'Specify asserted level of the reset input signal';
    ralvl_lbl.Type = 'text';
    ralvl_lbl.Name = 'Reset asserted level:';
    ralvl_lbl.Tag = horzcat(tag, ralvlOP, '_lbl');
    ralvl_lbl.RowSpan = [1.0 1.0];
    ralvl_lbl.ColSpan = [3.0 3.0];
    ralvl_lbl.ToolTip = ralvl_tt;
    % 40 42
    ralvl_cb.Type = 'combobox';
    ralvl_cb.Entries = ctranspose(set(src, ralvlOP));
    ralvl_cb.ObjectProperty = ralvlOP;
    ralvl_cb.Tag = horzcat(tag, ralvl_cb.ObjectProperty);
    ralvl_cb.RowSpan = [1.0 1.0];
    ralvl_cb.ColSpan = [4.0 4.0];
    ralvl_cb.ToolTip = ralvl_tt;
    ralvl_cb.Source = src;
    ralvl_cb.Mode = true;
    % 50 53
    % 51 53
    clkIPOP = 'ClockInputPort';
    clkIP_tt = 'Name HDL port for input signals';
    clkIP_lbl.Type = 'text';
    clkIP_lbl.Name = 'Clock input port:';
    clkIP_lbl.Tag = horzcat(tag, clkIPOP, '_lbl');
    clkIP_lbl.RowSpan = [2.0 2.0];
    clkIP_lbl.ColSpan = [1.0 1.0];
    clkIP_lbl.ToolTip = clkIP_tt;
    % 60 62
    clkIP_cb.Type = 'edit';
    clkIP_cb.ObjectProperty = clkIPOP;
    clkIP_cb.Tag = horzcat(tag, clkIP_cb.ObjectProperty);
    clkIP_cb.RowSpan = [2.0 2.0];
    clkIP_cb.ColSpan = [2.0 2.0];
    clkIP_cb.ToolTip = clkIP_tt;
    clkIP_cb.Source = src;
    clkIP_cb.Mode = true;
    % 69 72
    % 70 72
    clkEPOP = 'ClockEnableInputPort';
    clkEP_tt = 'Name HDL port for enable input signals ';
    clkEP_lbl.Type = 'text';
    clkEP_lbl.Name = 'Clock enable port:';
    clkIP_lbl.Tag = horzcat(tag, clkEPOP, '_lbl');
    clkEP_lbl.RowSpan = [2.0 2.0];
    clkEP_lbl.ColSpan = [3.0 3.0];
    clkEP_lbl.ToolTip = clkIP_tt;
    % 79 81
    clkEP_cb.Type = 'edit';
    clkEP_cb.ObjectProperty = clkEPOP;
    clkEP_cb.Tag = horzcat(tag, clkEP_cb.ObjectProperty);
    clkEP_cb.RowSpan = [2.0 2.0];
    clkEP_cb.ColSpan = [4.0 4.0];
    clkEP_cb.ToolTip = clkEP_tt;
    clkEP_cb.Source = src;
    clkEP_cb.Mode = true;
    % 88 91
    % 89 91
    rstIPOP = 'ResetInputPort';
    rstIP_tt = 'HDL port name for input signals';
    rstIP_lbl.Type = 'text';
    rstIP_lbl.Name = 'Reset input port:';
    rstIP_lbl.Tag = horzcat(tag, rstIPOP, '_lbl');
    rstIP_lbl.RowSpan = [3.0 3.0];
    rstIP_lbl.ColSpan = [1.0 1.0];
    rstIP_lbl.ToolTip = rstIP_tt;
    % 98 100
    rstIP_eb.Type = 'edit';
    rstIP_eb.ObjectProperty = rstIPOP;
    rstIP_eb.Tag = horzcat(tag, rstIP_eb.ObjectProperty);
    rstIP_eb.RowSpan = [3.0 3.0];
    rstIP_eb.ColSpan = [2.0 2.0];
    rstIP_eb.ToolTip = rstIP_tt;
    rstIP_eb.Source = src;
    rstIP_eb.Mode = true;
    % 107 112
    % 108 112
    % 109 112
    % 110 112
    clksg.Type = 'group';
    clksg.Name = 'Clock settings';
    clksg.Items = cellhorzcat(rtype_lbl, rtype_cb, ralvl_lbl, ralvl_cb, clkIP_lbl, clkIP_cb, clkEP_lbl, clkEP_cb, rstIP_lbl, rstIP_eb);
    clksg.LayoutGrid = [3.0 4.0];
    clksg.ColStretch = [0.0 1.0 0.0 1.0];
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    genTab = builtGeneralTab(src);
    prtsTab = builtPortsTab(src);
    advTab = builtAdvancedTab(src);
    % 123 125
    tabBody.Type = 'tab';
    tabBody.Tabs = cellhorzcat(genTab, prtsTab, advTab);
    tabBody.Tag = horzcat(tag, 'Body');
    tabBody.ActiveTab = this.HDLGSActiveTab;
    % 128 131
    % 129 131
    tabBody.TabChangedCallback = 'hdlcoderui.changehdlconfigtab';
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    tabg.Type = 'group';
    tabg.Name = 'Additional settings';
    tabg.Items = cellhorzcat(tabBody);
    tabg.LayoutGrid = [1.0 1.0];
    % 139 144
    % 140 144
    % 141 144
    % 142 144
    paramsTab.Items = cellhorzcat(clksg, tabg);
    paramsTab.Name = 'Global Settings';
end % function
function generalTab = builtGeneralTab(hObjCLI)
    % 147 154
    % 148 154
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    VerilogEnabled = isequal(hObjCLI.TargetLanguage, 'verilog');
    tag = 'ConfigSet_HDLCoder_GlbSettingsPanel_General_';
    % 155 157
    CommentOP = 'UserComment';
    Comment_tt = 'Single line comment added to header of generated file.';
    lblComment.Type = 'text';
    lblComment.Name = 'Comment in header: ';
    lblComment.Tag = horzcat(tag, CommentOP, '_lbl');
    lblComment.RowSpan = [1.0 1.0];
    lblComment.ColSpan = [1.0 1.0];
    lblComment.ToolTip = Comment_tt;
    % 164 166
    txtComment.Type = 'edit';
    txtComment.ObjectProperty = CommentOP;
    txtComment.Tag = horzcat(tag, txtComment.ObjectProperty);
    txtComment.RowSpan = [1.0 1.0];
    txtComment.ColSpan = [2.0 4.0];
    txtComment.Source = hObjCLI;
    txtComment.ToolTip = Comment_tt;
    txtComment.Mode = true;
    % 173 176
    % 174 176
    VerilogFileExt_tt = 'Specify file type extension for generated Verilog files';
    VerilogFileExtOP = 'VerilogFileExtension';
    lblVerilogFileExt.Type = 'text';
    lblVerilogFileExt.Name = 'Verilog file extension: ';
    lblVerilogFileExt.Tag = horzcat(tag, VerilogFileExtOP, '_lbl');
    lblVerilogFileExt.RowSpan = [2.0 2.0];
    lblVerilogFileExt.ColSpan = [1.0 1.0];
    lblVerilogFileExt.ToolTip = VerilogFileExt_tt;
    lblVerilogFileExt.Enabled = VerilogEnabled;
    % 184 187
    % 185 187
    txtVerilogFileExt.Type = 'edit';
    txtVerilogFileExt.ObjectProperty = VerilogFileExtOP;
    txtVerilogFileExt.Tag = horzcat(tag, txtVerilogFileExt.ObjectProperty);
    txtVerilogFileExt.RowSpan = [2.0 2.0];
    txtVerilogFileExt.ColSpan = [2.0 2.0];
    txtVerilogFileExt.Source = hObjCLI;
    txtVerilogFileExt.Enabled = VerilogEnabled;
    txtVerilogFileExt.ToolTip = VerilogFileExt_tt;
    txtVerilogFileExt.Mode = true;
    % 195 197
    VHDLFileExtOP = 'VHDLFileExtension';
    VHDLFileExt_tt = 'Specify file type extension for generated VHDL files ';
    lblVHDLFileExt.Type = 'text';
    lblVHDLFileExt.Name = ' VHDL file extension: ';
    lblVHDLFileExt.Tag = horzcat(tag, VHDLFileExtOP, '_lbl');
    lblVHDLFileExt.RowSpan = [2.0 2.0];
    lblVHDLFileExt.ColSpan = [3.0 3.0];
    lblVHDLFileExt.Enabled = not(VerilogEnabled);
    lblVHDLFileExt.ToolTip = VHDLFileExt_tt;
    % 205 208
    % 206 208
    txtVHDLFileExt.Type = 'edit';
    txtVHDLFileExt.ObjectProperty = VHDLFileExtOP;
    txtVHDLFileExt.Tag = horzcat(tag, txtVHDLFileExt.ObjectProperty);
    txtVHDLFileExt.RowSpan = [2.0 2.0];
    txtVHDLFileExt.ColSpan = [4.0 4.0];
    txtVHDLFileExt.Source = hObjCLI;
    txtVHDLFileExt.Mode = true;
    % 214 216
    txtVHDLFileExt.Enabled = not(VerilogEnabled);
    txtVHDLFileExt.ToolTip = VHDLFileExt_tt;
    % 217 219
    EntityConfPostfix_tt = 'Setting the postfix string for resolving entity or module name conflicts';
    EntityConfPostfixOP = 'EntityConflictPostfix';
    lblEntityConfPostfix.Type = 'text';
    lblEntityConfPostfix.Name = 'Entry conflict postfix: ';
    lblEntityConfPostfix.Tag = horzcat(tag, 'label');
    lblEntityConfPostfix.Tag = horzcat(tag, EntityConfPostfixOP, '_lbl');
    lblEntityConfPostfix.RowSpan = [3.0 3.0];
    lblEntityConfPostfix.ColSpan = [1.0 1.0];
    lblEntityConfPostfix.ToolTip = EntityConfPostfix_tt;
    % 227 229
    txtEntityConfPostfix.Type = 'edit';
    txtEntityConfPostfix.ObjectProperty = EntityConfPostfixOP;
    txtEntityConfPostfix.Tag = horzcat(tag, txtEntityConfPostfix.ObjectProperty);
    txtEntityConfPostfix.RowSpan = [3.0 3.0];
    txtEntityConfPostfix.ColSpan = [2.0 2.0];
    txtEntityConfPostfix.Source = hObjCLI;
    txtEntityConfPostfix.Mode = true;
    % 235 237
    txtEntityConfPostfix.ToolTip = EntityConfPostfix_tt;
    % 237 239
    PackagePostfixOP = 'PackagePostfix';
    PackagePostfix_tt = 'Specify a string to append to the specified filter name to form the name of a VHDL package file';
    lblPackagePostfix.Type = 'text';
    lblPackagePostfix.Name = ' Package postfix: ';
    lblPackagePostfix.Tag = horzcat(tag, PackagePostfixOP, '_lbl');
    lblPackagePostfix.RowSpan = [3.0 3.0];
    lblPackagePostfix.ColSpan = [3.0 3.0];
    lblPackagePostfix.Enabled = not(VerilogEnabled);
    lblPackagePostfix.ToolTip = PackagePostfix_tt;
    % 247 249
    txtPackagePostfix.Type = 'edit';
    txtPackagePostfix.ObjectProperty = PackagePostfixOP;
    txtPackagePostfix.Tag = horzcat(tag, txtPackagePostfix.ObjectProperty);
    txtPackagePostfix.RowSpan = [3.0 3.0];
    txtPackagePostfix.ColSpan = [4.0 4.0];
    txtPackagePostfix.Source = hObjCLI;
    txtPackagePostfix.Enabled = not(VerilogEnabled);
    txtPackagePostfix.ToolTip = PackagePostfix_tt;
    txtPackagePostfix.Mode = true;
    % 257 261
    % 258 261
    % 259 261
    ResWordPostfixOP = 'ReservedWordPostfix';
    ResWordPostfix_tt = 'Specify string to append to value names, postfix values, or labels that are VHDL or Verilog reserved words';
    lblResWordPostfix.Type = 'text';
    lblResWordPostfix.Name = 'Reserved word postfix: ';
    lblResWordPostfix.Tag = horzcat(tag, ResWordPostfixOP, '_lbl');
    lblResWordPostfix.RowSpan = [4.0 4.0];
    lblResWordPostfix.ColSpan = [1.0 1.0];
    lblResWordPostfix.ToolTip = ResWordPostfix_tt;
    % 268 270
    txtResWordPostfix.Type = 'edit';
    txtResWordPostfix.ObjectProperty = ResWordPostfixOP;
    txtResWordPostfix.Tag = horzcat(tag, txtResWordPostfix.ObjectProperty);
    txtResWordPostfix.RowSpan = [4.0 4.0];
    txtResWordPostfix.ColSpan = [2.0 2.0];
    txtResWordPostfix.Mode = true;
    % 275 277
    txtResWordPostfix.Source = hObjCLI;
    txtResWordPostfix.ToolTip = ResWordPostfix_tt;
    % 278 280
    chkSplitEntityOP = 'SplitEntityArch';
    chkSplitEntity_tt = 'Splitting entity and architecture code into separate files';
    chkSplitEntity.Name = 'Split entity and architecture';
    chkSplitEntity.Tag = horzcat(tag, chkSplitEntityOP);
    chkSplitEntity.Type = 'checkbox';
    chkSplitEntity.ObjectProperty = chkSplitEntityOP;
    chkSplitEntity.RowSpan = [4.0 4.0];
    chkSplitEntity.ColSpan = [3.0 4.0];
    chkSplitEntity.Mode = true;
    chkSplitEntity.DialogRefresh = true;
    chkSplitEntity.Source = hObjCLI;
    chkSplitEntity.Enabled = not(VerilogEnabled);
    chkSplitEntity.ToolTip = chkSplitEntity_tt;
    % 292 294
    SplitEntFilePostfixOP = 'SplitEntityFilePostfix';
    SplitEntFilePostfix_tt = 'Specify a string to append to the specified filter name to form the name of the file that is to contain the filter''s VHDL entity';
    lblSplitEntFilePostfix.Type = 'text';
    lblSplitEntFilePostfix.Tag = horzcat(tag, SplitEntFilePostfixOP, '_lbl');
    lblSplitEntFilePostfix.Name = ' Split entity file postfix: ';
    lblSplitEntFilePostfix.RowSpan = [5.0 5.0];
    lblSplitEntFilePostfix.ColSpan = [3.0 3.0];
    lblSplitEntFilePostfix.Enabled = isequal(hObjCLI.SplitEntityArch, 'on');
    lblSplitEntFilePostfix.ToolTip = SplitEntFilePostfix_tt;
    % 302 304
    txtSplitEntFilePostfix.Type = 'edit';
    txtSplitEntFilePostfix.Tag = horzcat(tag, SplitEntFilePostfixOP);
    txtSplitEntFilePostfix.ObjectProperty = SplitEntFilePostfixOP;
    txtSplitEntFilePostfix.RowSpan = [5.0 5.0];
    txtSplitEntFilePostfix.ColSpan = [4.0 4.0];
    txtSplitEntFilePostfix.Enabled = isequal(hObjCLI.SplitEntityArch, 'on');
    txtSplitEntFilePostfix.Source = hObjCLI;
    txtSplitEntFilePostfix.ToolTip = SplitEntFilePostfix_tt;
    txtSplitEntFilePostfix.Mode = true;
    % 312 316
    % 313 316
    % 314 316
    SplitArchFilePostfixOP = 'SplitArchFilePostfix';
    SplitArchFilePostfix_tt = 'Specify string to append to specified name to form the name of the file containing the filter''s VHDL architecture';
    lblSplitArchFilePostfix.Type = 'text';
    lblSplitArchFilePostfix.Name = ' Split arch file postfix: ';
    lblSplitArchFilePostfix.Tag = horzcat(tag, SplitArchFilePostfixOP, '_lbl');
    lblSplitArchFilePostfix.RowSpan = [6.0 6.0];
    lblSplitArchFilePostfix.ColSpan = [3.0 3.0];
    lblSplitArchFilePostfix.Enabled = isequal(hObjCLI.SplitEntityArch, 'on');
    lblSplitArchFilePostfix.ToolTip = SplitArchFilePostfix_tt;
    % 324 326
    txtSplitArchFilePostfix.Type = 'edit';
    txtSplitArchFilePostfix.ObjectProperty = SplitArchFilePostfixOP;
    txtSplitArchFilePostfix.Tag = horzcat(tag, txtSplitArchFilePostfix.ObjectProperty);
    txtSplitArchFilePostfix.RowSpan = [6.0 6.0];
    txtSplitArchFilePostfix.ColSpan = [4.0 4.0];
    txtSplitArchFilePostfix.Enabled = isequal(hObjCLI.SplitEntityArch, 'on');
    txtSplitArchFilePostfix.Source = hObjCLI;
    txtSplitArchFilePostfix.ToolTip = SplitArchFilePostfix_tt;
    txtSplitArchFilePostfix.Mode = true;
    % 334 337
    % 335 337
    ClockedProcessPostfix_tt = 'Specify string to append to HDL clock process names';
    ClockedProcessPostfixOP = 'ClockProcessPostfix';
    lblClockedProcessPostfix.Type = 'text';
    lblClockedProcessPostfix.Name = 'Clocked process postfix: ';
    lblClockedProcessPostfix.Tag = horzcat(tag, ClockedProcessPostfixOP, '_lbl');
    lblClockedProcessPostfix.RowSpan = [5.0 5.0];
    lblClockedProcessPostfix.ColSpan = [1.0 1.0];
    lblClockedProcessPostfix.ToolTip = ClockedProcessPostfix_tt;
    % 344 346
    txtClockedProcessPostfix.Type = 'edit';
    txtClockedProcessPostfix.Tag = horzcat(tag, ClockedProcessPostfixOP);
    txtClockedProcessPostfix.ObjectProperty = ClockedProcessPostfixOP;
    txtClockedProcessPostfix.RowSpan = [5.0 5.0];
    txtClockedProcessPostfix.ColSpan = [2.0 2.0];
    txtClockedProcessPostfix.Source = hObjCLI;
    txtClockedProcessPostfix.ToolTip = ClockedProcessPostfix_tt;
    txtClockedProcessPostfix.Mode = true;
    % 353 356
    % 354 356
    grpGeneral.Type = 'group';
    grpGeneral.Name = 'General';
    grpGeneral.RowSpan = [1.0 6.0];
    grpGeneral.ColSpan = [1.0 4.0];
    grpGeneral.LayoutGrid = [7.0 4.0];
    grpGeneral.ColStretch = [0.0 1.0 0.0 1.0];
    grpGeneral.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    grpGeneral.Items = cellhorzcat(lblComment, txtComment, lblVerilogFileExt, txtVerilogFileExt, lblVHDLFileExt, txtVHDLFileExt, lblEntityConfPostfix, txtEntityConfPostfix, lblPackagePostfix, txtPackagePostfix, lblResWordPostfix, txtResWordPostfix, chkSplitEntity, lblSplitEntFilePostfix, txtSplitEntFilePostfix, lblSplitArchFilePostfix, txtSplitArchFilePostfix, lblClockedProcessPostfix, txtClockedProcessPostfix);
    % 363 384
    % 364 384
    % 365 384
    % 366 384
    % 367 384
    % 368 384
    % 369 384
    % 370 384
    % 371 384
    % 372 384
    % 373 384
    % 374 384
    % 375 384
    % 376 384
    % 377 384
    % 378 384
    % 379 384
    % 380 384
    % 381 384
    % 382 384
    generalTab.Name = 'General';
    generalTab.Items = cellhorzcat(grpGeneral);
end % function
function portsTab = builtPortsTab(hObjCLI)
    % 387 391
    % 388 391
    % 389 391
    VerilogEnabled = isequal(hObjCLI.TargetLanguage, 'verilog');
    tag = 'ConfigSet_HDLCoder_GlbSettingsPanel_Ports_';
    % 392 394
    InputDataType_tt = 'Specify HDL data type for filter''s input port ';
    InputDataTypeOP = 'InputType';
    lblInputDataType.Type = 'text';
    lblInputDataType.Name = 'Input data type: ';
    lblInputDataType.Tag = horzcat(tag, InputDataTypeOP, '_lbl');
    lblInputDataType.RowSpan = [1.0 1.0];
    lblInputDataType.ColSpan = [1.0 1.0];
    lblInputDataType.Enabled = not(VerilogEnabled);
    lblInputDataType.ToolTip = InputDataType_tt;
    % 402 404
    cmbInputDataType.Type = 'combobox';
    cmbInputDataType.Tag = horzcat(tag, InputDataTypeOP);
    cmbInputDataType.Entries = ctranspose(set(hObjCLI, InputDataTypeOP));
    cmbInputDataType.ObjectProperty = InputDataTypeOP;
    cmbInputDataType.RowSpan = [1.0 1.0];
    cmbInputDataType.ColSpan = [2.0 2.0];
    cmbInputDataType.Mode = true;
    % 410 412
    cmbInputDataType.Source = hObjCLI;
    cmbInputDataType.Enabled = not(VerilogEnabled);
    cmbInputDataType.ToolTip = InputDataType_tt;
    cmbInputDataType.Mode = true;
    % 415 417
    OutputDataType_tt = 'Specify HDL data type for filter''s output port ';
    OutputDataTypeOP = 'OutputType';
    lblOutputDataType.Type = 'text';
    lblOutputDataType.Tag = horzcat(tag, OutputDataTypeOP, '_lbl');
    lblOutputDataType.Name = 'Output data type: ';
    lblOutputDataType.RowSpan = [2.0 2.0];
    lblOutputDataType.ColSpan = [1.0 1.0];
    lblOutputDataType.Enabled = not(VerilogEnabled);
    lblOutputDataType.ToolTip = OutputDataType_tt;
    % 425 427
    cmbOutputDataType.Type = 'combobox';
    cmbOutputDataType.Tag = horzcat(tag, OutputDataTypeOP);
    cmbOutputDataType.Entries = ctranspose(set(hObjCLI, OutputDataTypeOP));
    cmbOutputDataType.ObjectProperty = OutputDataTypeOP;
    cmbOutputDataType.RowSpan = [2.0 2.0];
    cmbOutputDataType.ColSpan = [2.0 2.0];
    cmbOutputDataType.Source = hObjCLI;
    cmbOutputDataType.Enabled = not(VerilogEnabled);
    cmbOutputDataType.ToolTip = OutputDataType_tt;
    cmbOutputDataType.Mode = true;
    % 436 439
    % 437 439
    ClockEnableOutputPort_tt = 'Specify name of clock enable output port';
    ClockEnableOutputPortOP = 'ClockEnableOutputPort';
    lblClockEnableOutputPort.Type = 'text';
    lblClockEnableOutputPort.Tag = horzcat(tag, ClockEnableOutputPortOP, '_lbl');
    lblClockEnableOutputPort.Name = 'Clock enable output port: ';
    lblClockEnableOutputPort.RowSpan = [3.0 3.0];
    lblClockEnableOutputPort.ColSpan = [1.0 1.0];
    lblClockEnableOutputPort.ToolTip = ClockEnableOutputPort_tt;
    % 446 449
    % 447 449
    cmbClockEnableOutputPort.Type = 'edit';
    cmbClockEnableOutputPort.Tag = horzcat(tag, ClockEnableOutputPortOP);
    cmbClockEnableOutputPort.ObjectProperty = ClockEnableOutputPortOP;
    cmbClockEnableOutputPort.RowSpan = [3.0 3.0];
    cmbClockEnableOutputPort.ColSpan = [2.0 2.0];
    cmbClockEnableOutputPort.Source = hObjCLI;
    cmbClockEnableOutputPort.ToolTip = ClockEnableOutputPort_tt;
    cmbClockEnableOutputPort.Mode = true;
    % 456 460
    % 457 460
    % 458 460
    grpPorts.Type = 'group';
    grpPorts.Name = 'Ports';
    % 461 463
    grpPorts.RowSpan = [1.0 4.0];
    grpPorts.ColSpan = [1.0 2.0];
    grpPorts.LayoutGrid = [5.0 2.0];
    grpPorts.ColStretch = [0.0 1.0];
    grpPorts.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    % 467 469
    grpPorts.Items = cellhorzcat(lblInputDataType, cmbInputDataType, lblOutputDataType, cmbOutputDataType, lblClockEnableOutputPort, cmbClockEnableOutputPort);
    % 469 477
    % 470 477
    % 471 477
    % 472 477
    % 473 477
    % 474 477
    % 475 477
    portsTab.Name = 'Ports';
    portsTab.Items = cellhorzcat(grpPorts);
end % function
function advancedTab = builtAdvancedTab(hObjCLI)
    % 480 484
    % 481 484
    % 482 484
    VerilogEnabled = isequal(hObjCLI.TargetLanguage, 'verilog');
    tag = 'ConfigSet_HDLCoder_GlbSettingsPanel_Advanced_';
    % 485 487
    chkRepConstantValueOP = 'UseAggregatesForConst';
    chkRepConstantValue.Type = 'checkbox';
    chkRepConstantValue.Name = 'Represent constant values by aggregates';
    chkRepConstantValue.Tag = horzcat(tag, chkRepConstantValueOP);
    chkRepConstantValue.ObjectProperty = chkRepConstantValueOP;
    chkRepConstantValue.RowSpan = [1.0 1.0];
    chkRepConstantValue.ColSpan = [1.0 1.0];
    chkRepConstantValue.Source = hObjCLI;
    chkRepConstantValue.Enabled = not(VerilogEnabled);
    chkRepConstantValue.ToolTip = 'Specify whether all constants are represented by aggregates, including constants that are less than 32 bits';
    chkRepConstantValue.Mode = true;
    % 497 501
    % 498 501
    % 499 501
    chkRisingEdgeOP = 'UseRisingEdge';
    chkRisingEdge.Type = 'checkbox';
    chkRisingEdge.Name = 'Use "rising_edge" for registers';
    chkRisingEdge.Tag = horzcat(tag, chkRisingEdgeOP);
    chkRisingEdge.ObjectProperty = chkRisingEdgeOP;
    chkRisingEdge.RowSpan = [2.0 2.0];
    chkRisingEdge.ColSpan = [1.0 1.0];
    chkRisingEdge.Source = hObjCLI;
    chkRisingEdge.Enabled = not(VerilogEnabled);
    chkRisingEdge.ToolTip = 'Specify VHDL coding style used to check for rising edges when operating on registers';
    chkRisingEdge.Mode = true;
    % 511 515
    % 512 515
    % 513 515
    chkLoopUnrollingOP = 'LoopUnrolling';
    chkLoopUnrolling.Type = 'checkbox';
    chkLoopUnrolling.Name = 'Loop unrolling';
    chkLoopUnrolling.Tag = horzcat(tag, chkLoopUnrollingOP);
    chkLoopUnrolling.ObjectProperty = chkLoopUnrollingOP;
    chkLoopUnrolling.RowSpan = [3.0 3.0];
    chkLoopUnrolling.ColSpan = [1.0 1.0];
    chkLoopUnrolling.Source = hObjCLI;
    if eq(VerilogEnabled, true)
        hObjCLI.LoopUnrolling = 'on';
    end % if
    chkLoopUnrolling.Enabled = not(VerilogEnabled);
    chkLoopUnrolling.ToolTip = 'Specify whether VHDL FOR and GENERATE loops are unrolled and omitted from generated VHDL code';
    chkLoopUnrolling.Mode = true;
    % 528 532
    % 529 532
    % 530 532
    chkCastBeforeSumOP = 'CastBeforeSum';
    chkCastBeforeSum.Type = 'checkbox';
    chkCastBeforeSum.Name = 'Cast before sum';
    chkCastBeforeSum.Tag = horzcat(tag, chkCastBeforeSumOP);
    chkCastBeforeSum.ObjectProperty = chkCastBeforeSumOP;
    chkCastBeforeSum.RowSpan = [4.0 4.0];
    chkCastBeforeSum.ColSpan = [1.0 1.0];
    chkCastBeforeSum.Source = hObjCLI;
    chkCastBeforeSum.ToolTip = 'Enable or disable type casting of input values for addition and subtraction operations prior to execution of the operation';
    % 540 542
    chkCastBeforeSum.Mode = true;
    % 542 546
    % 543 546
    % 544 546
    chkVerilogTimescaleOP = 'UseVerilogTimescale';
    chkVerilogTimescale.Type = 'checkbox';
    chkVerilogTimescale.Name = 'Use Verilog "timescale directives"';
    chkVerilogTimescale.Tag = horzcat(tag, chkVerilogTimescaleOP);
    chkVerilogTimescale.ObjectProperty = chkVerilogTimescaleOP;
    chkVerilogTimescale.RowSpan = [5.0 5.0];
    chkVerilogTimescale.ColSpan = [1.0 1.0];
    chkVerilogTimescale.Source = hObjCLI;
    chkVerilogTimescale.Enabled = VerilogEnabled;
    chkVerilogTimescale.ToolTip = 'Allow or exclude use of compiler timescale directives in generated Verilog code ';
    chkVerilogTimescale.Mode = true;
    % 556 560
    % 557 560
    % 558 560
    chkInlineVHDLOP = 'InlineConfigurations';
    chkInlineVHDL.Type = 'checkbox';
    chkInlineVHDL.Name = 'Inline VHDL configuration';
    chkInlineVHDL.Tag = horzcat(tag, chkInlineVHDLOP);
    chkInlineVHDL.ObjectProperty = chkInlineVHDLOP;
    chkInlineVHDL.RowSpan = [6.0 6.0];
    chkInlineVHDL.ColSpan = [1.0 1.0];
    chkInlineVHDL.Mode = true;
    % 567 569
    chkInlineVHDL.Source = hObjCLI;
    chkInlineVHDL.Enabled = not(VerilogEnabled);
    chkInlineVHDL.ToolTip = 'Specify whether generated VHDL code includes inline configurations';
    % 571 573
    chkConcatenateOP = 'SafeZeroConcat';
    chkConcatenate.Type = 'checkbox';
    chkConcatenate.Name = 'Concatenate type safe zeros';
    chkConcatenate.Tag = horzcat(tag, chkConcatenateOP);
    chkConcatenate.ObjectProperty = chkConcatenateOP;
    chkConcatenate.RowSpan = [7.0 7.0];
    chkConcatenate.ColSpan = [1.0 1.0];
    chkConcatenate.Mode = true;
    % 580 582
    chkConcatenate.Source = hObjCLI;
    chkConcatenate.Enabled = not(VerilogEnabled);
    chkConcatenate.ToolTip = 'Specify the syntax used in the generated VHDL code for concatenated zeros';
    % 584 586
    grpAdvanced.Type = 'group';
    grpAdvanced.Name = 'Advanced';
    grpAdvanced.RowSpan = [1.0 7.0];
    grpAdvanced.ColSpan = [1.0 1.0];
    grpAdvanced.LayoutGrid = [8.0 1.0];
    grpAdvanced.ColStretch = [0.0 1.0];
    grpAdvanced.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    % 592 594
    grpAdvanced.Items = cellhorzcat(chkRepConstantValue, chkRisingEdge, chkLoopUnrolling, chkCastBeforeSum, chkVerilogTimescale, chkInlineVHDL, chkConcatenate);
    % 594 602
    % 595 602
    % 596 602
    % 597 602
    % 598 602
    % 599 602
    % 600 602
    advancedTab.Name = 'Advanced';
    advancedTab.Items = cellhorzcat(grpAdvanced);
end % function
