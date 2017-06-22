function dlgStruct = getDialogSchema(this, dummy)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    descr.Type = 'text';
    descr.Name = this.Block.MaskDescription;
    descr.Tag = 'descriptionText';
    descr.WordWrap = 1.0;
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    descrGroup.Type = 'group';
    descrGroup.Name = this.Block.MaskType;
    descrGroup.Tag = 'descriptionGroup';
    descrGroup.Items = cellhorzcat(descr);
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    fnText.Type = 'text';
    fnText.Name = 'VCD file name:';
    fnText.Tag = 'fnText';
    fnText.RowSpan = [2.0 2.0];
    fnText.ColSpan = [1.0 1.0];
    % 39 40
    fnEdit.Type = 'edit';
    fnEdit.Tag = 'FileName';
    fnEdit.MatlabMethod = 'cosimDDGSync';
    fnEdit.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    fnEdit.ObjectProperty = 'FileName';
    fnEdit.Mode = 1.0;
    fnEdit.Tunable = 0.0;
    fnEdit.Alignment = 5.0;
    fnEdit.RowSpan = [3.0 3.0];
    fnEdit.ColSpan = [1.0 1.0];
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    inportText.Type = 'text';
    inportText.Name = 'Number of input ports:';
    inportText.Tag = 'fnText';
    inportText.RowSpan = [5.0 5.0];
    inportText.ColSpan = [1.0 1.0];
    % 60 61
    inportEdit.Type = 'edit';
    inportEdit.Tag = 'NumInport';
    inportEdit.MatlabMethod = 'cosimDDGSync';
    inportEdit.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    inportEdit.ObjectProperty = 'NumInport';
    inportEdit.Mode = 1.0;
    inportEdit.Tunable = 0.0;
    inportEdit.Alignment = 5.0;
    inportEdit.RowSpan = [5.0 5.0];
    inportEdit.ColSpan = [2.0 2.0];
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
    % 82 83
    fillerRow1Label.Type = 'text';
    fillerRow1Label.Name = '';
    fillerRow1Label.Tag = 'fillerRow1Label';
    fillerRow1Label.Mode = 1.0;
    fillerRow1Label.Tunable = 0.0;
    fillerRow1Label.Alignment = 5.0;
    % 89 90
    oneSecLabel.Type = 'text';
    oneSecLabel.Name = '1 second in Simulink corresponds to';
    oneSecLabel.Tag = 'OneSecLabel';
    oneSecLabel.Mode = 1.0;
    oneSecLabel.Tunable = 0.0;
    oneSecLabel.RowSpan = [2.0 2.0];
    oneSecLabel.ColSpan = [1.0 1.0];
    oneSecLabel.Alignment = 5.0;
    % 98 102
    % 99 102
    % 100 102
    % 101 102
    timingScaleFactor.Type = 'edit';
    timingScaleFactor.Tag = 'TimingScaleFactor';
    timingScaleFactor.MatlabMethod = 'cosimDDGSync';
    timingScaleFactor.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    timingScaleFactor.ObjectProperty = 'TimingScaleFactor';
    timingScaleFactor.Mode = 1.0;
    timingScaleFactor.Tunable = 0.0;
    timingScaleFactor.RowSpan = [2.0 2.0];
    timingScaleFactor.ColSpan = [2.0 2.0];
    timingScaleFactor.Alignment = 5.0;
    % 112 114
    % 113 114
    timingMode.Type = 'combobox';
    timingMode.Tag = 'TimingMode';
    timingMode.Name = '';
    timingMode.MatlabMethod = 'cosimDDGSync';
    timingMode.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    timingMode.ObjectProperty = 'TimingMode';
    timingMode.Entries = transpose(set(this, 'TimingMode'));
    timingMode.Mode = 1.0;
    timingMode.Tunable = 0.0;
    timingMode.RowSpan = [2.0 2.0];
    timingMode.ColSpan = [3.0 3.0];
    timingMode.Alignment = 5.0;
    % 126 128
    % 127 128
    modLabel.Type = 'text';
    modLabel.Name = 'in the HDL simulator';
    modLabel.Tag = 'modLabel';
    modLabel.Mode = 1.0;
    modLabel.Tunable = 0.0;
    modLabel.RowSpan = [2.0 2.0];
    modLabel.ColSpan = [4.0 4.0];
    modLabel.Alignment = 5.0;
    % 136 140
    % 137 140
    % 138 140
    % 139 140
    tickText.Type = 'text';
    tickText.Name = '1 HDL tick is defined as ';
    tickText.Tag = 'tickText';
    tickText.Mode = 1.0;
    tickText.Tunable = 0.0;
    tickText.RowSpan = [4.0 4.0];
    tickText.ColSpan = [1.0 1.0];
    tickText.Alignment = 5.0;
    % 148 152
    % 149 152
    % 150 152
    % 151 152
    tickScale.Type = 'combobox';
    tickScale.Tag = 'HdlTickScale';
    tickScale.MatlabMethod = 'cosimDDGSync';
    tickScale.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    tickScale.ObjectProperty = 'HdlTickScale';
    tickScale.Entries = transpose(set(this, 'HdlTickScale'));
    tickScale.Mode = 1.0;
    tickScale.Tunable = 0.0;
    tickScale.RowSpan = [4.0 4.0];
    tickScale.ColSpan = [2.0 2.0];
    tickScale.Alignment = 5.0;
    % 163 165
    % 164 165
    tickMode.Type = 'combobox';
    tickMode.Tag = 'HdlTickMode';
    tickMode.MatlabMethod = 'cosimDDGSync';
    tickMode.MatlabArgs = cellhorzcat(this, '%dialog', '%tag');
    tickMode.ObjectProperty = 'HdlTickMode';
    tickMode.Entries = transpose(set(this, 'HdlTickMode'));
    tickMode.Mode = 1.0;
    tickMode.Tunable = 0.0;
    tickMode.RowSpan = [4.0 4.0];
    tickMode.ColSpan = [3.0 3.0];
    tickMode.Alignment = 5.0;
    % 176 182
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    % 181 182
    timingGroup.Type = 'group';
    timingGroup.Name = 'Timescale';
    timingGroup.Tag = 'timingGroup';
    timingGroup.Items = cellhorzcat(fillerRow1Label, oneSecLabel, timingScaleFactor, timingMode, modLabel, fillerRow1Label, tickText, tickScale, tickMode, fillerRow1Label);
    % 186 192
    % 187 192
    % 188 192
    % 189 192
    % 190 192
    % 191 192
    timingGroup.LayoutGrid = [5.0 4.0];
    % 193 199
    % 194 199
    % 195 199
    % 196 199
    % 197 199
    % 198 199
    paramGroup.Type = 'group';
    paramGroup.Name = 'Parameters';
    paramGroup.Tag = 'paramGroup';
    paramGroup.Items = cellhorzcat(fillerRow1Label, fnText, fnEdit, fillerRow1Label, inportText, inportEdit, fillerRow1Label, timingGroup);
    % 203 226
    % 204 226
    % 205 226
    % 206 226
    % 207 226
    % 208 226
    % 209 226
    % 210 226
    % 211 226
    % 212 226
    % 213 226
    % 214 226
    % 215 226
    % 216 226
    % 217 226
    % 218 226
    % 219 226
    % 220 226
    % 221 226
    % 222 226
    % 223 226
    % 224 226
    % 225 226
    mainPanel.Type = 'panel';
    mainPanel.Tag = 'mainPanel';
    mainPanel.Items = cellhorzcat(descrGroup, paramGroup);
    % 229 239
    % 230 239
    % 231 239
    % 232 239
    % 233 239
    % 234 239
    % 235 239
    % 236 239
    % 237 239
    % 238 239
    title = this.Block.Name;
    % 240 241
    title(find(eq(double(title), 10.0))) = ' ';
    dlgStruct.DialogTitle = horzcat('Block Parameters: ', title);
    dlgStruct.HelpMethod = 'eval';
    dlgStruct.HelpArgs = cellhorzcat(this.Block.MaskHelp);
    dlgStruct.Items = cellhorzcat(mainPanel);
    dlgStruct.DialogTag = this.Block.Name;
    dlgStruct.PreApplyMethod = 'preApply';
    dlgStruct.PreApplyArgs = {'%dialog'};
    dlgStruct.PreApplyArgsDT = {'handle'};
    dlgStruct.SmartApply = 0.0;
    dlgStruct.CloseMethod = 'closeCallback';
    dlgStruct.CloseMethodArgs = {'%dialog'};
    dlgStruct.CloseMethodArgsDT = {'handle'};
    dlgStruct.DefaultOk = false;
    % 255 256
    if any(strcmp(this.Root.SimulationStatus, {'running','paused'}))
        dlgStruct.DisableDialog = 1.0;
    end % if
end % function
