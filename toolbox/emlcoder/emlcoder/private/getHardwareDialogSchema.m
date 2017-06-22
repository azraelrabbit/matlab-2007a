function dlgstruct = getHardwareDialogSchema(hSrc, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tag = 'Tag_ConfigSet_Hardware_';
    widgetId = 'emlcoder.HardwareCC.';
    % 8 12
    % 9 12
    % 10 12
    group1Name = 'Embedded hardware';
    % 12 15
    % 13 15
    wProdDevice_Name = 'Device type:';
    prodDeviceTypeToolTip = sprintf('Select a predefined hardware device to specify the C language\nconstraints for your microprocessor or Custom if your microprocessor\nis not listed.  Select ASIC/FPGA for no constraints.');
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    numOfBits_Name = 'Number of bits:';
    numBitsToolTip = 'Hardware word sizes.';
    % 22 24
    charToolTip = 'Number of bits used to represent C type char.';
    shortToolTip = 'Number of bits used to represent C type short.';
    intToolTip = 'Number of bits used to represent C type int.';
    longToolTip = 'Number of bits used to represent C type long.';
    % 27 29
    prodBitPerChar_Name = 'char:';
    prodBitPerShort_Name = 'short:';
    prodBitPerInt_Name = 'int:';
    prodBitPerLong_Name = 'long:';
    % 32 34
    prodEndian_Name = 'Byte ordering:';
    % 34 36
    prodWord_Name = 'native word size:';
    % 36 38
    intDivRoundTo_Name = 'Signed integer division rounds to:';
    intDivisionToolTip = sprintf('Specify how your C compiler rounds the result of dividing two signed\nintegers.  This information enables efficient C code to be generated\nfrom this model.');
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    shiftRight_Name = 'Shift right on a signed integer as arithmetic shift';
    arithmeticShiftToolTip = sprintf('Specify that your C compiler implements a right shift of a signed integer\nas an arithmetic right shift. Virtually all compilers do this.');
    % 45 49
    % 46 49
    % 47 49
    endianToolTip = sprintf('Specify if the byte ordering of the target is Big Endian (most\nsignificant byte first) or Little Endian (least significant byte\nfirst).  If left unspecified, Real-Time Workshop generates executable\ncode to compute the result.');
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    nativeWordToolTip = sprintf('The number of bits that the target processor can process at one time.\nProviding the processor''s native word size allows for more efficient\ncode to be generated when converting the endian byte order of data types.');
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    pageName = 'Hardware Implementation';
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    ObjectProperty = 'ProdHWDeviceType';
    widgetLbl = [];
    widgetLbl.Name = wProdDevice_Name;
    widgetLbl.Type = 'text';
    % 69 71
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    wProdDeviceLbl = widgetLbl;
    % 73 75
    widget = [];
    widget.Type = 'combobox';
    widget.ObjectProperty = ObjectProperty;
    widget.Entries = getComboboxEntries(hSrc, ObjectProperty);
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    widget.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty));
    widget.Tag = horzcat(tag, ObjectProperty);
    widget.WidgetId = horzcat(widgetId, ObjectProperty);
    % 83 87
    % 84 87
    % 85 87
    widget.ToolTip = prodDeviceTypeToolTip;
    widget.UserData.ObjectProperty = ObjectProperty;
    widget.UserData.Name = widgetLbl.Name;
    wProdDevice = widget;
    % 90 93
    % 91 93
    widget = [];
    widget.Name = numOfBits_Name;
    widget.Type = 'text';
    widget.ToolTip = numBitsToolTip;
    widget.Mode = 1.0;
    numOfBits = widget;
    % 98 101
    % 99 101
    ObjectProperty = 'ProdBitPerChar';
    [prodBitPerChar, prodBitPerCharLbl] = getValidatingEditWidgetAndLabel(hSrc, ObjectProperty, hSrc.isVisibleProperty(ObjectProperty), hSrc.isEnabledProperty(ObjectProperty), false, prodBitPerChar_Name, charToolTip, tag, widgetId, pageName);
    % 102 115
    % 103 115
    % 104 115
    % 105 115
    % 106 115
    % 107 115
    % 108 115
    % 109 115
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    ObjectProperty = 'ProdBitPerShort';
    [prodBitPerShort, prodBitPerShortLbl] = getValidatingEditWidgetAndLabel(hSrc, ObjectProperty, hSrc.isVisibleProperty(ObjectProperty), hSrc.isEnabledProperty(ObjectProperty), false, prodBitPerShort_Name, shortToolTip, tag, widgetId, pageName);
    % 116 129
    % 117 129
    % 118 129
    % 119 129
    % 120 129
    % 121 129
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    ObjectProperty = 'ProdBitPerInt';
    [prodBitPerInt, prodBitPerIntLbl] = getValidatingEditWidgetAndLabel(hSrc, ObjectProperty, hSrc.isVisibleProperty(ObjectProperty), hSrc.isEnabledProperty(ObjectProperty), false, prodBitPerInt_Name, intToolTip, tag, widgetId, pageName);
    % 130 143
    % 131 143
    % 132 143
    % 133 143
    % 134 143
    % 135 143
    % 136 143
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    ObjectProperty = 'ProdBitPerLong';
    [prodBitPerLong, prodBitPerLongLbl] = getValidatingEditWidgetAndLabel(hSrc, 'ProdBitPerLong', hSrc.isVisibleProperty(ObjectProperty), hSrc.isEnabledProperty(ObjectProperty), false, prodBitPerLong_Name, longToolTip, tag, widgetId, pageName);
    % 144 157
    % 145 157
    % 146 157
    % 147 157
    % 148 157
    % 149 157
    % 150 157
    % 151 157
    % 152 157
    % 153 157
    % 154 157
    % 155 157
    ObjectProperty = 'ProdWordSize';
    [prodWord, prodWordLbl] = getValidatingEditWidgetAndLabel(hSrc, ObjectProperty, hSrc.isVisibleProperty(ObjectProperty), hSrc.isEnabledProperty(ObjectProperty), false, prodWord_Name, nativeWordToolTip, tag, widgetId, pageName);
    % 158 171
    % 159 171
    % 160 171
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    ObjectProperty = 'ProdIntDivRoundTo';
    widgetLbl = [];
    widgetLbl.Name = intDivRoundTo_Name;
    widgetLbl.Type = 'text';
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    widgetLbl.Visible = hSrc.isVisibleProperty(ObjectProperty);
    prodIntDivRoundToLbl = widgetLbl;
    % 178 180
    widget = [];
    widget.Type = 'combobox';
    widget.ObjectProperty = ObjectProperty;
    widget.Entries = getComboboxEntries(hSrc, ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty)) && hSrc.isEnabledProperty(ObjectProperty);
    widget.Visible = prodIntDivRoundToLbl.Visible;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.WidgetId = horzcat(widgetId, widget.ObjectProperty);
    widget.ToolTip = intDivisionToolTip;
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    prodIntDivRoundTo = widget;
    % 191 194
    % 192 194
    ObjectProperty = 'ProdEndianess';
    widgetLbl = [];
    widgetLbl.Name = prodEndian_Name;
    widgetLbl.Type = 'text';
    % 197 199
    widgetLbl.Tag = horzcat(tag, ObjectProperty, 'Lbl');
    widgetLbl.WidgetId = horzcat(widgetId, ObjectProperty);
    widgetLbl.Visible = hSrc.isVisibleProperty(ObjectProperty);
    prodEndianLbl = widgetLbl;
    % 202 204
    widget = [];
    widget.Type = 'combobox';
    widget.ObjectProperty = ObjectProperty;
    widget.Entries = getComboboxEntries(hSrc, ObjectProperty);
    widget.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty)) && hSrc.isEnabledProperty(ObjectProperty);
    widget.Visible = prodEndianLbl.Visible;
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.WidgetId = horzcat(widgetId, widget.ObjectProperty);
    widget.ToolTip = endianToolTip;
    widget.UserData.Name = widgetLbl.Name;
    widget.Mode = 1.0;
    prodEndian = widget;
    % 215 218
    % 216 218
    ObjectProperty = 'ProdShiftRightIntArith';
    widget = [];
    widget.Name = shiftRight_Name;
    widget.Type = 'checkbox';
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(ObjectProperty)) && hSrc.isEnabledProperty(ObjectProperty);
    widget.Visible = hSrc.isVisibleProperty(ObjectProperty);
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.WidgetId = horzcat(widgetId, widget.ObjectProperty);
    widget.ToolTip = arithmeticShiftToolTip;
    widget.Mode = 1.0;
    prodShiftRight = widget;
    % 229 235
    % 230 235
    % 231 235
    % 232 235
    % 233 235
    prodBitPerCharLbl.RowSpan = [1.0 1.0];
    prodBitPerCharLbl.ColSpan = [1.0 1.0];
    prodBitPerChar.RowSpan = [1.0 1.0];
    prodBitPerChar.ColSpan = [2.0 2.0];
    % 238 240
    prodBitPerChar.MaximumSize = [50.0 50.0];
    prodBitPerShortLbl.RowSpan = [1.0 1.0];
    prodBitPerShortLbl.ColSpan = [3.0 3.0];
    prodBitPerShort.RowSpan = [1.0 1.0];
    prodBitPerShort.ColSpan = [4.0 4.0];
    % 244 246
    prodBitPerShort.MaximumSize = [50.0 50.0];
    prodBitPerIntLbl.RowSpan = [1.0 1.0];
    prodBitPerIntLbl.ColSpan = [5.0 5.0];
    prodBitPerInt.RowSpan = [1.0 1.0];
    prodBitPerInt.ColSpan = [6.0 6.0];
    % 250 252
    prodBitPerInt.MaximumSize = [50.0 50.0];
    prodBitPerLongLbl.RowSpan = [2.0 2.0];
    prodBitPerLongLbl.ColSpan = [1.0 1.0];
    prodBitPerLong.RowSpan = [2.0 2.0];
    prodBitPerLong.ColSpan = [2.0 2.0];
    % 256 258
    prodBitPerLong.MaximumSize = [50.0 50.0];
    prodWordLbl.RowSpan = [2.0 2.0];
    prodWordLbl.ColSpan = [3.0 5.0];
    prodWord.RowSpan = [2.0 2.0];
    prodWord.ColSpan = [6.0 6.0];
    % 262 264
    prodWord.MaximumSize = [50.0 50.0];
    group.Name = 'word size';
    group.Type = 'panel';
    group.Items = cellhorzcat(prodBitPerCharLbl, prodBitPerChar, prodBitPerShortLbl, prodBitPerShort, prodBitPerIntLbl, prodBitPerInt, prodBitPerLongLbl, prodBitPerLong, prodWordLbl, prodWord);
    % 267 272
    % 268 272
    % 269 272
    % 270 272
    group.LayoutGrid = [2.0 6.0];
    group.ColStretch = [0.0 1.0 0.0 1.0 0.0 1.0];
    prodWS = group;
    % 274 277
    % 275 277
    wProdDeviceLbl.RowSpan = [1.0 1.0];
    wProdDeviceLbl.ColSpan = [1.0 1.0];
    wProdDevice.RowSpan = [1.0 1.0];
    wProdDevice.ColSpan = [2.0 3.0];
    numOfBits.Visible = hSrc.isVisibleProperty('prodBitPerChar');
    numOfBits.RowSpan = [2.0 2.0];
    numOfBits.ColSpan = [1.0 1.0];
    prodWS.RowSpan = [2.0 3.0];
    prodWS.ColSpan = [2.0 3.0];
    prodEndianLbl.RowSpan = [4.0 4.0];
    prodEndianLbl.ColSpan = [1.0 2.0];
    prodEndian.RowSpan = [4.0 4.0];
    prodEndian.ColSpan = [3.0 3.0];
    prodIntDivRoundToLbl.RowSpan = [5.0 5.0];
    prodIntDivRoundToLbl.ColSpan = [1.0 2.0];
    prodIntDivRoundTo.RowSpan = [5.0 5.0];
    prodIntDivRoundTo.ColSpan = [3.0 3.0];
    prodShiftRight.RowSpan = [6.0 6.0];
    prodShiftRight.ColSpan = [1.0 3.0];
    prodhw.Name = group1Name;
    prodhw.Type = 'group';
    prodhw.Items = cellhorzcat(wProdDeviceLbl, wProdDevice, numOfBits, prodWS, prodEndianLbl, prodEndian, prodIntDivRoundToLbl, prodIntDivRoundTo, prodShiftRight);
    % 298 303
    % 299 303
    % 300 303
    % 301 303
    prodhw.LayoutGrid = [6.0 3.0];
    prodhw.ColStretch = [0.0 0.0 1.0];
    % 304 306
    prodhw.RowSpan = [1.0 1.0];
    content.Name = 'content';
    content.Type = 'panel';
    content.Items = cellhorzcat(prodhw);
    content.LayoutGrid = [3.0 1.0];
    content.RowStretch = [0.0 0.0 1.0];
    % 311 314
    % 312 314
    dlgstruct.DialogTitle = pageName;
    dlgstruct.Items = cellhorzcat(content);
    % 315 320
    % 316 320
    % 317 320
    % 318 320
    dlgstruct.LayoutGrid = [2.0 1.0];
    dlgstruct.RowStretch = [0.0 1.0];
end
function comboentries = getComboboxEntries(h, id)
    % 323 325
    combolist = ctranspose(set(h, id));
    charList = char(combolist);
    charList(1.0:length(combolist)) = upper(charList(1.0:length(combolist)));
    combolist = cellstr(charList);
    comboentries = ctranspose(combolist);
end
