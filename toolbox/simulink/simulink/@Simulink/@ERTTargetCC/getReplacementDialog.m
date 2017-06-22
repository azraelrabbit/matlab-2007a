function dlg = getReplacementDialog(hObj, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    dlg = [];
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
    enable_Name = 'Replace data type names in the generated code';
    enable_Tooltip = 'Replace Real-Time Workshop data type names in the generated code.';
    title1_Name = 'Simulink';
    title2_Name = 'Real-Time Workshop';
    title3_Name = 'Replacement';
    title4_Name = 'Name';
    % 23 25
    double_tooltip = 'Replacement type for double.';
    single_tooltip = 'Replacement type for single.';
    int32_tooltip = 'Replacement type for int32.';
    int16_tooltip = 'Replacement type for int16.';
    int8_tooltip = 'Replacement type for int8.';
    uint32_tooltip = 'Replacement type for uint32.';
    uint16_tooltip = 'Replacement type for uint16.';
    uint8_tooltip = 'Replacement type for uint8.';
    boolean_tooltip = 'Replacement type for boolean.';
    int_tooltip = 'Replacement type for int.';
    uint_tooltip = 'Replacement type for uint.';
    char_tooltip = 'Replacement type for char.';
    % 36 38
    group_Name = 'Data type names';
    pageName = 'Data Type Replacement';
    widgetId = 'Simulink.ERTTargetCC.';
    rtwPageName = sprintf('%s/%s', title2_Name, pageName);
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    tag = 'Tag_ConfigSet_RTW_ERT_Replacement_';
    hSrc = hObj;
    % 47 49
    replacementVisible = strcmp(get_param(hSrc, 'EnableUserReplacementTypes'), 'on');
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    ObjectProperty = 'EnableUserReplacementTypes';
    widget = [];
    widget.Name = enable_Name;
    widget.Type = 'checkbox';
    widget.ToolTip = enable_Tooltip;
    widget.ObjectProperty = ObjectProperty;
    widget.Enabled = not(hSrc.isReadonlyProperty(widget.ObjectProperty));
    widget.Tag = horzcat(tag, widget.ObjectProperty);
    widget.Mode = 1.0;
    widget.DialogRefresh = 1.0;
    enable = widget;
    % 65 68
    % 66 68
    widget = [];
    widget.Name = title1_Name;
    widget.Type = 'text';
    builtIn = widget;
    % 71 74
    % 72 74
    widget = [];
    widget.Name = title4_Name;
    widget.Type = 'text';
    builtIn2 = widget;
    rtwDefault2 = builtIn2;
    replace2 = rtwDefault2;
    % 79 82
    % 80 82
    widget = [];
    widget.Name = title2_Name;
    widget.Type = 'text';
    rtwDefault = widget;
    % 85 88
    % 86 88
    widget = [];
    widget.Name = title3_Name;
    widget.Type = 'text';
    widget.Visible = replacementVisible;
    replace = widget;
    % 92 95
    % 93 95
    widget = [];
    widget.Name = '   ';
    widget.Type = 'text';
    space1 = widget;
    space2 = space1;
    space3 = space2;
    space0 = space3;
    % 101 104
    % 102 104
    [replaceDouble, builtInDouble, rtwDefaultDouble] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'double', 'real_T', double_tooltip, tag, '', rtwPageName);
    % 104 116
    % 105 116
    % 106 116
    % 107 116
    % 108 116
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    [replaceSingle, builtInSingle, rtwDefaultSingle] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'single', 'real32_T', single_tooltip, tag, widgetId, rtwPageName);
    % 116 128
    % 117 128
    % 118 128
    % 119 128
    % 120 128
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    [replaceInt32, builtInInt32, rtwDefaultInt32] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'int32', 'int32_T', int32_tooltip, tag, widgetId, rtwPageName);
    % 128 140
    % 129 140
    % 130 140
    % 131 140
    % 132 140
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    [replaceInt16, builtInInt16, rtwDefaultInt16] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'int16', 'int16_T', int16_tooltip, tag, widgetId, rtwPageName);
    % 140 152
    % 141 152
    % 142 152
    % 143 152
    % 144 152
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    [replaceInt8, builtInInt8, rtwDefaultInt8] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'int8', 'int8_T', int8_tooltip, tag, widgetId, rtwPageName);
    % 152 164
    % 153 164
    % 154 164
    % 155 164
    % 156 164
    % 157 164
    % 158 164
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    [replaceUint32, builtInUint32, rtwDefaultUint32] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'uint32', 'uint32_T', uint32_tooltip, tag, widgetId, rtwPageName);
    % 164 176
    % 165 176
    % 166 176
    % 167 176
    % 168 176
    % 169 176
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    [replaceUint16, builtInUint16, rtwDefaultUint16] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'uint16', 'uint16_T', uint16_tooltip, tag, widgetId, rtwPageName);
    % 176 188
    % 177 188
    % 178 188
    % 179 188
    % 180 188
    % 181 188
    % 182 188
    % 183 188
    % 184 188
    % 185 188
    % 186 188
    [replaceUint8, builtInUint8, rtwDefaultUint8] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'uint8', 'uint8_T', uint8_tooltip, tag, widgetId, rtwPageName);
    % 188 200
    % 189 200
    % 190 200
    % 191 200
    % 192 200
    % 193 200
    % 194 200
    % 195 200
    % 196 200
    % 197 200
    % 198 200
    [replaceBoolean, builtInBoolean, rtwDefaultBoolean] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'boolean', 'boolean_T', boolean_tooltip, tag, widgetId, rtwPageName);
    % 200 212
    % 201 212
    % 202 212
    % 203 212
    % 204 212
    % 205 212
    % 206 212
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    [replaceInt, builtInInt, rtwDefaultInt] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'int', 'int_T', int_tooltip, tag, widgetId, rtwPageName);
    % 212 224
    % 213 224
    % 214 224
    % 215 224
    % 216 224
    % 217 224
    % 218 224
    % 219 224
    % 220 224
    % 221 224
    % 222 224
    [replaceUint, builtInUint, rtwDefaultUint] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'uint', 'uint_T', uint_tooltip, tag, widgetId, rtwPageName);
    % 224 236
    % 225 236
    % 226 236
    % 227 236
    % 228 236
    % 229 236
    % 230 236
    % 231 236
    % 232 236
    % 233 236
    % 234 236
    [replaceChar, builtInChar, rtwDefaultChar] = local_getValidatingEditWidgetAndTwoLabels(hObj, hSrc, 'ReplacementTypes', replacementVisible, 'char', 'char_T', char_tooltip, tag, widgetId, rtwPageName);
    % 236 253
    % 237 253
    % 238 253
    % 239 253
    % 240 253
    % 241 253
    % 242 253
    % 243 253
    % 244 253
    % 245 253
    % 246 253
    % 247 253
    % 248 253
    % 249 253
    % 250 253
    % 251 253
    space0.RowSpan = [1.0 1.0];
    space0.ColSpan = [2.0 2.0];
    builtIn.RowSpan = [2.0 2.0];
    builtIn.ColSpan = [1.0 1.0];
    space1.RowSpan = [2.0 2.0];
    space1.ColSpan = [2.0 2.0];
    rtwDefault.RowSpan = [2.0 2.0];
    rtwDefault.ColSpan = [3.0 3.0];
    space2.RowSpan = [2.0 2.0];
    space2.ColSpan = [4.0 4.0];
    replace.RowSpan = [2.0 2.0];
    replace.ColSpan = [5.0 5.0];
    builtIn2.RowSpan = [3.0 3.0];
    builtIn2.ColSpan = [1.0 1.0];
    rtwDefault2.RowSpan = [3.0 3.0];
    rtwDefault2.ColSpan = [3.0 3.0];
    replace2.RowSpan = [3.0 3.0];
    replace2.ColSpan = [5.0 5.0];
    space3.RowSpan = [4.0 4.0];
    space3.ColSpan = [1.0 5.0];
    builtInDouble.RowSpan = [5.0 5.0];
    builtInDouble.ColSpan = [1.0 1.0];
    rtwDefaultDouble.RowSpan = [5.0 5.0];
    rtwDefaultDouble.ColSpan = [3.0 3.0];
    replaceDouble.RowSpan = [5.0 5.0];
    replaceDouble.ColSpan = [5.0 5.0];
    builtInSingle.RowSpan = [6.0 6.0];
    builtInSingle.ColSpan = [1.0 1.0];
    rtwDefaultSingle.RowSpan = [6.0 6.0];
    rtwDefaultSingle.ColSpan = [3.0 3.0];
    replaceSingle.RowSpan = [6.0 6.0];
    replaceSingle.ColSpan = [5.0 5.0];
    builtInInt32.RowSpan = [7.0 7.0];
    builtInInt32.ColSpan = [1.0 1.0];
    rtwDefaultInt32.RowSpan = [7.0 7.0];
    rtwDefaultInt32.ColSpan = [3.0 3.0];
    replaceInt32.RowSpan = [7.0 7.0];
    replaceInt32.ColSpan = [5.0 5.0];
    builtInInt16.RowSpan = [8.0 8.0];
    builtInInt16.ColSpan = [1.0 1.0];
    rtwDefaultInt16.RowSpan = [8.0 8.0];
    rtwDefaultInt16.ColSpan = [3.0 3.0];
    replaceInt16.RowSpan = [8.0 8.0];
    replaceInt16.ColSpan = [5.0 5.0];
    builtInInt8.RowSpan = [9.0 9.0];
    builtInInt8.ColSpan = [1.0 1.0];
    rtwDefaultInt8.RowSpan = [9.0 9.0];
    rtwDefaultInt8.ColSpan = [3.0 3.0];
    replaceInt8.RowSpan = [9.0 9.0];
    replaceInt8.ColSpan = [5.0 5.0];
    builtInUint32.RowSpan = [10.0 10.0];
    builtInUint32.ColSpan = [1.0 1.0];
    rtwDefaultUint32.RowSpan = [10.0 10.0];
    rtwDefaultUint32.ColSpan = [3.0 3.0];
    replaceUint32.RowSpan = [10.0 10.0];
    replaceUint32.ColSpan = [5.0 5.0];
    builtInUint16.RowSpan = [11.0 11.0];
    builtInUint16.ColSpan = [1.0 1.0];
    rtwDefaultUint16.RowSpan = [11.0 11.0];
    rtwDefaultUint16.ColSpan = [3.0 3.0];
    replaceUint16.RowSpan = [11.0 11.0];
    replaceUint16.ColSpan = [5.0 5.0];
    builtInUint8.RowSpan = [12.0 12.0];
    builtInUint8.ColSpan = [1.0 1.0];
    rtwDefaultUint8.RowSpan = [12.0 12.0];
    rtwDefaultUint8.ColSpan = [3.0 3.0];
    replaceUint8.RowSpan = [12.0 12.0];
    replaceUint8.ColSpan = [5.0 5.0];
    builtInBoolean.RowSpan = [13.0 13.0];
    builtInBoolean.ColSpan = [1.0 1.0];
    rtwDefaultBoolean.RowSpan = [13.0 13.0];
    rtwDefaultBoolean.ColSpan = [3.0 3.0];
    replaceBoolean.RowSpan = [13.0 13.0];
    replaceBoolean.ColSpan = [5.0 5.0];
    builtInInt.RowSpan = [14.0 14.0];
    builtInInt.ColSpan = [1.0 1.0];
    rtwDefaultInt.RowSpan = [14.0 14.0];
    rtwDefaultInt.ColSpan = [3.0 3.0];
    replaceInt.RowSpan = [14.0 14.0];
    replaceInt.ColSpan = [5.0 5.0];
    builtInUint.RowSpan = [15.0 15.0];
    builtInUint.ColSpan = [1.0 1.0];
    rtwDefaultUint.RowSpan = [15.0 15.0];
    rtwDefaultUint.ColSpan = [3.0 3.0];
    replaceUint.RowSpan = [15.0 15.0];
    replaceUint.ColSpan = [5.0 5.0];
    builtInChar.RowSpan = [16.0 16.0];
    builtInChar.ColSpan = [1.0 1.0];
    rtwDefaultChar.RowSpan = [16.0 16.0];
    rtwDefaultChar.ColSpan = [3.0 3.0];
    replaceChar.RowSpan = [16.0 16.0];
    replaceChar.ColSpan = [5.0 5.0];
    group.Name = group_Name;
    group.Type = 'group';
    group.Items = cellhorzcat(space0, builtIn, rtwDefault, replace, builtIn2, rtwDefault2, replace2, space1, space2, space3, builtInDouble, rtwDefaultDouble, replaceDouble, builtInSingle, rtwDefaultSingle, replaceSingle, builtInInt32, rtwDefaultInt32, replaceInt32, builtInInt16, rtwDefaultInt16, replaceInt16, builtInInt8, rtwDefaultInt8, replaceInt8, builtInUint32, rtwDefaultUint32, replaceUint32, builtInUint16, rtwDefaultUint16, replaceUint16, builtInUint8, rtwDefaultUint8, replaceUint8, builtInBoolean, rtwDefaultBoolean, replaceBoolean, builtInInt, rtwDefaultInt, replaceInt, builtInUint, rtwDefaultUint, replaceUint, builtInChar, rtwDefaultChar, replaceChar);
    % 347 362
    % 348 362
    % 349 362
    % 350 362
    % 351 362
    % 352 362
    % 353 362
    % 354 362
    % 355 362
    % 356 362
    % 357 362
    % 358 362
    % 359 362
    % 360 362
    group.LayoutGrid = [17.0 5.0];
    group.ColStretch = [0.0 0.0 0.0 0.0 1.0];
    group.RowStretch = [0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0];
    group.Visible = replacementVisible;
    % 365 371
    % 366 371
    % 367 371
    % 368 371
    % 369 371
    enable.RowSpan = [1.0 1.0];
    group.RowSpan = [2.0 2.0];
    dlg.Name = pageName;
    dlg.Items = cellhorzcat(enable, group);
    dlg.LayoutGrid = [3.0 1.0];
    dlg.RowStretch = [0.0 0.0 1.0];
end
function replacementName = locGetReplacementField(hObj, fieldName)
    % 378 380
    replacementName = '';
    if hasProp(hObj, 'ReplacementTypes')
        replacements = get_param(hObj, 'ReplacementTypes');
        if isfield(replacements, fieldName)
            replacementName = getfield(replacements, fieldName);
        end
    end
end
function [widget, widgetLblSim, widgetLblRTW] = local_getValidatingEditWidgetAndTwoLabels(a_hController, a_hSrc, a_Property, a_Visible, a_NameSim, a_NameRTW, a_ToolTip, a_TagPrefix, a_WidgetIdPrefix, a_PageName)
    % 388 403
    % 389 403
    % 390 403
    % 391 403
    % 392 403
    % 393 403
    % 394 403
    % 395 403
    % 396 403
    % 397 403
    % 398 403
    % 399 403
    % 400 403
    % 401 403
    widgetLblSim = [];
    widgetLblSim.Name = a_NameSim;
    widgetLblSim.Type = 'text';
    widgetLblSim.Tag = horzcat(a_TagPrefix, a_Property, '_', a_NameSim, '_SimName');
    widgetLblSim.Visible = a_Visible;
    widgetLblSim.ToolTip = a_ToolTip;
    % 408 410
    widgetLblRTW = [];
    widgetLblRTW.Name = a_NameRTW;
    widgetLblRTW.Type = 'text';
    widgetLblRTW.Tag = horzcat(a_TagPrefix, a_Property, '_', a_NameSim, '_RTWName');
    widgetLblRTW.Visible = a_Visible;
    widgetLblRTW.ToolTip = a_ToolTip;
    % 415 417
    widget.Type = 'edit';
    widget.Name = '';
    widget.Enabled = double(not(a_hSrc.isReadonlyProperty(a_Property)));
    widget.Visible = a_Visible;
    widget.DialogRefresh = false;
    widget.Tag = horzcat(a_TagPrefix, a_Property, '_', a_NameSim);
    widget.ToolTip = a_ToolTip;
    widget.Source = a_hController;
    widget.Value = locGetReplacementField(a_hController, a_NameSim);
    % 425 433
    % 426 433
    % 427 433
    % 428 433
    % 429 433
    % 430 433
    % 431 433
    widget.ObjectMethod = 'dialogCallback';
    widget.MethodArgs = cellhorzcat('%dialog', widget.Tag, '');
    widget.ArgDataTypes = {'handle','string','string'};
    % 435 437
    widget.UserData.ObjectProperty = a_Property;
    % 437 441
    % 438 441
    % 439 441
    widget.UserData.FieldName = horzcat(a_NameSim, ', ', a_NameRTW);
    widget.UserData.Validate = a_Visible && widget.Enabled;
    widget.UserData.PageName = a_PageName;
    widget.Mode = 0.0;
end
