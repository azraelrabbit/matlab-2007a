function edasTab = getTabDialogSchema(this, schemaName, hTopObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tagpf = horzcat(getWidgetTagPrefix(this), 'EDAScript_');
    % 8 10
    standalone = isa(hTopObj, 'hdlcoderprops.CLI');
    if standalone
        src = hTopObj;
    else
        % 13 15
        src = hTopObj.HDLCoder.CoderParameterObject.CLI;
    end % if
    % 16 18
    useEda.Name = 'Generate EDA scripts';
    useEda.Type = 'checkbox';
    useEda.ObjectProperty = 'EDAScriptGeneration';
    useEda.Source = src;
    useEda.Tag = horzcat(tagpf, 'EDAScriptGeneration');
    useEda.RowSpan = [1.0 1.0];
    useEda.ColSpan = [1.0 6.0];
    useEda.Mode = true;
    useEda.ToolTip = 'Enable generation of scripts for HDL simulators and synthesis tools';
    useEda.DialogRefresh = true;
    % 27 31
    % 28 31
    % 29 31
    scriptList.Type = 'listbox';
    scriptList.Graphical = true;
    scriptList.Entries = {'Compilation script ','Simulation script ','Synthesis script '};
    % 33 36
    % 34 36
    scriptList.Source = this;
    scriptList.ObjectProperty = 'ScriptSelection';
    scriptList.MultiSelect = 0.0;
    scriptList.RowSpan = [2.0 6.0];
    scriptList.ColSpan = [1.0 1.0];
    scriptList.Tag = horzcat(tagpf, 'EDAScriptList');
    scriptList.ToolTip = 'Select an EDA script category';
    scriptList.Mode = true;
    scriptList.DialogRefresh = true;
    % 44 47
    % 45 47
    pf = hdlcoderui.getpixunit;
    % 47 49
    ColSpan = [4.0 6.0];
    pfColSpan = [4.0 5.0];
    StandaloneMinimumSize = mtimes([100.0 60.0], pf);
    AttachedMinimumSize = mtimes([100.0 10.0], pf);
    % 52 55
    % 53 55
    postfix.Type = 'edit';
    postfix.Name = 'Compile file postfix: ';
    postfix.ObjectProperty = 'HDLCompileFilePostfix';
    postfix.Source = src;
    postfix.Tag = horzcat(tagpf, 'HDLCompileFilePostfix');
    postfix.RowSpan = [2.0 2.0];
    postfix.ColSpan = pfColSpan;
    postfix.Mode = true;
    postfix.Visible = eq(this.ScriptSelection, 0.0);
    postfix.ToolTip = 'Compilation file name postfix';
    itemHDLCompileFilePostfix = postfix;
    % 65 68
    % 66 68
    item.Type = 'editarea';
    item.Name = 'Compile initialization:';
    item.ObjectProperty = 'HDLCompileInit';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLCompileInit');
    item.RowSpan = [3.0 3.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Visible = eq(this.ScriptSelection, 0.0);
    item.Mode = true;
    item.ToolTip = 'fprintf format string to write the Init section of the compilation script';
    itemHDLCompileInit = item;
    % 84 87
    % 85 87
    item.Type = 'editarea';
    item.Name = 'Compile command for VHDL:';
    item.ObjectProperty = 'HDLCompileVHDLCmd';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLCompileVHDLCmd');
    item.RowSpan = [4.0 4.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    % 99 102
    % 100 102
    item.Visible = eq(this.ScriptSelection, 0.0);
    item.Mode = true;
    item.ToolTip = sprintf('%s\n%s\n%s', 'fprintf format string to write the Cmd section of VHDL compilation script');
    itemHDLCompileVHDLCmd = item;
    if standalone
        itemHDLCompileVHDLCmd.Enabled = strcmpi(hTopObj.TargetLanguage, 'vhdl');
    else
        itemHDLCompileVHDLCmd.Enabled = strcmpi(hTopObj.HDLCoder.CoderParameterObject.CLI.TargetLanguage, 'vhdl');
    end % if
    % 110 113
    % 111 113
    item.Type = 'editarea';
    item.Name = 'Compile command for Verilog:';
    item.ObjectProperty = 'HDLCompileVerilogCmd';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLCompileVerilogCmd');
    item.RowSpan = [5.0 5.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    % 125 127
    item.Visible = eq(this.ScriptSelection, 0.0);
    item.Mode = true;
    item.ToolTip = sprintf('%s\n%s\n%s', 'fprintf format string to write the Cmd section of Verilog compilation script');
    itemHDLCompileVerilogCmd = item;
    if standalone
        itemHDLCompileVerilogCmd.Enabled = strcmpi(hTopObj.TargetLanguage, 'verilog');
    else
        itemHDLCompileVerilogCmd.Enabled = strcmpi(hTopObj.HDLCoder.CoderParameterObject.CLI.TargetLanguage, 'verilog');
    end % if
    % 135 138
    % 136 138
    item.Type = 'editarea';
    item.Name = 'Compile termination:';
    item.ObjectProperty = 'HDLCompileTerm';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLCompileTerm');
    item.RowSpan = [6.0 6.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 0.0);
    item.ToolTip = 'fprintf format string to write the Term portion of the compilation script';
    itemHDLCompileTerm = item;
    % 154 157
    % 155 157
    postfix.Type = 'edit';
    postfix.Name = 'Simulation file postfix: ';
    postfix.ObjectProperty = 'HDLSimFilePostfix';
    postfix.Source = src;
    postfix.Tag = horzcat(tagpf, 'HDLSimFilePostfix');
    postfix.RowSpan = [2.0 2.0];
    postfix.ColSpan = pfColSpan;
    postfix.Mode = true;
    postfix.Visible = eq(this.ScriptSelection, 1.0);
    postfix.ToolTip = 'Simulation file name postfix';
    itemHDLSimFilePostfix = postfix;
    % 167 170
    % 168 170
    item.Type = 'editarea';
    item.Name = 'Simulation initialization:';
    item.ObjectProperty = 'HDLSimInit';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSimInit');
    item.RowSpan = [3.0 3.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 1.0);
    item.ToolTip = 'fprintf format string to write the Init section of the simulation script';
    itemHDLSimInit = item;
    % 186 189
    % 187 189
    item.Type = 'editarea';
    item.Name = 'Simulation command:';
    item.ObjectProperty = 'HDLSimCmd';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSimCmd');
    item.RowSpan = [4.0 4.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 1.0);
    item.ToolTip = 'fprintf format string to write the simulation command';
    itemHDLSimCmd = item;
    % 205 208
    % 206 208
    item.Type = 'editarea';
    item.Name = 'Simulation waveform viewing command:';
    item.ObjectProperty = 'HDLSimViewWaveCmd';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSimViewWaveCmd');
    item.RowSpan = [5.0 5.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 1.0);
    item.ToolTip = sprintf('%s\n%s', 'fprintf format string to write the simulation script waveform viewing command');
    itemHDLSimViewWaveCmd = item;
    % 224 227
    % 225 227
    item.Type = 'editarea';
    item.Name = 'Simulation termination:';
    item.ObjectProperty = 'HDLSimTerm';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSimTerm');
    item.RowSpan = [6.0 6.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 1.0);
    item.ToolTip = 'fprintf format string to write the Term portion of the simulation script';
    itemHDLSimTerm = item;
    % 243 246
    % 244 246
    postfix.Type = 'edit';
    postfix.Name = 'Synthesis file postfix: ';
    postfix.ObjectProperty = 'HDLSynthFilePostfix';
    postfix.Source = src;
    postfix.Tag = horzcat(tagpf, 'HDLSynthFilePostfix');
    postfix.RowSpan = [2.0 2.0];
    postfix.ColSpan = pfColSpan;
    postfix.Mode = true;
    postfix.Visible = eq(this.ScriptSelection, 2.0);
    postfix.ToolTip = 'Synthesis file name postfix';
    itemHDLSynthFilePostfix = postfix;
    % 256 259
    % 257 259
    item.Type = 'editarea';
    item.Name = 'Synthesis initialization:';
    item.ObjectProperty = 'HDLSynthInit';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSynthInit');
    item.RowSpan = [3.0 3.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 2.0);
    item.ToolTip = sprintf('%s\n%s\n%s', 'fprintf format string passed to fprintf to write the Init section of the synthesis script');
    itemHDLSynthInit = item;
    % 275 278
    % 276 278
    item.Type = 'editarea';
    item.Name = 'Synthesis command:';
    item.ObjectProperty = 'HDLSynthCmd';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSynthCmd');
    item.RowSpan = [4.0 4.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 2.0);
    item.ToolTip = sprintf('%s\n%s', 'fprintf format string to write the Cmd section of the synthesis script');
    itemHDLSynthCmd = item;
    % 294 297
    % 295 297
    item.Type = 'editarea';
    item.Name = 'Synthesis termination:';
    item.ObjectProperty = 'HDLSynthTerm';
    item.Source = src;
    item.Tag = horzcat(tagpf, 'HDLSynthTerm');
    item.RowSpan = [5.0 5.0];
    item.ColSpan = ColSpan;
    if standalone
        item.MinimumSize = StandaloneMinimumSize;
    else
        item.MinimumSize = AttachedMinimumSize;
    end % if
    item.WordWrap = true;
    item.Mode = true;
    item.Visible = eq(this.ScriptSelection, 2.0);
    item.ToolTip = 'fprintf format string to write the Term section of the synthesis script';
    itemHDLSynthTerm = item;
    % 313 321
    % 314 321
    % 315 321
    % 316 321
    % 317 321
    % 318 321
    % 319 321
    edagroup.Type = 'group';
    edagroup.Name = 'EDA Tool Scripts';
    % 322 324
    edagroup.Items = cellhorzcat(useEda, scriptList, itemHDLCompileFilePostfix, itemHDLSimFilePostfix, itemHDLSynthFilePostfix, itemHDLCompileInit, itemHDLCompileVHDLCmd, itemHDLCompileVerilogCmd, itemHDLCompileTerm, itemHDLSimInit, itemHDLSimCmd, itemHDLSimViewWaveCmd, itemHDLSimTerm, itemHDLSynthInit, itemHDLSynthCmd, itemHDLSynthTerm);
    % 324 328
    % 325 328
    % 326 328
    edagroup.LayoutGrid = [6.0 6.0];
    edagroup.ColStretch = [0.0 0.0 0.0 1.0 1.0 1.0];
    edagroup.RowStretch = [1.0 0.0 1.0 1.0 1.0 1.0];
    % 330 332
    if not(standalone)
        edasTab.Name = 'EDA Tool Scripts';
    end % if
    % 334 336
    edasTab.Items = cellhorzcat(edagroup);
