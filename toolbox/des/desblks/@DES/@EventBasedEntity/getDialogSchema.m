function dlgstruct = getDialogSchema(h, dialogTag)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    DefaultNameLocation = 1.0;
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    tagObjProp = 'EntityType';
    % 26 28
    vis = 1.0;
    % 28 30
    EntityGenType = struct('Type', {'combobox'}, 'Name', {'Entity type:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,2.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 30 45
    % 31 45
    % 32 45
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    tagObjProp = 'AllowBlocking';
    % 45 47
    vis = 1.0;
    % 47 49
    EntityGenBlockable = struct('Type', {'checkbox'}, 'Name', {'Allow OUT port blocking'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', {[6.0]});
    % 49 63
    % 50 63
    % 51 63
    % 52 63
    % 53 63
    % 54 63
    % 55 63
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    tagObjProp = 'ResponseDuringBlockage';
    % 63 65
    vis = h.AllowBlocking;
    % 65 67
    EntityGenResponseBlocked = struct('Type', {'combobox'}, 'Name', {'Response during blockage period:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 67 81
    % 68 81
    % 69 81
    % 70 81
    % 71 81
    % 72 81
    % 73 81
    % 74 81
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    entityprop1.Type = 'group';
    % 81 83
    entityprop1.Items = cellhorzcat(EntityGenType, EntityGenBlockable, EntityGenResponseBlocked);
    entityprop1.RowSpan = [2.0 2.0];
    entityprop1.ColSpan = [1.0 1.0];
    entityprop1.LayoutGrid = [3.0 4.0];
    % 86 94
    % 87 94
    % 88 94
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    tagObjProp = 'GenerateEntitiesUpon';
    vis = 1.0;
    % 95 97
    EntityGenInterGenOpt = struct('Type', {'combobox'}, 'Name', {'Generate entities upon:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues('GenerateEntitiesUpon'))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 97 111
    % 98 111
    % 99 111
    % 100 111
    % 101 111
    % 102 111
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    tagObjProp = 'SignalEdgeType';
    % 111 113
    switch h.GenerateEntitiesUpon
    case EntityGenInterGenOpt.Entries{2.0}
        prompt = 'Trigger type:';
        vis = 1.0;
    case EntityGenInterGenOpt.Entries{3.0}
        prompt = 'Type of value change:';
        vis = 1.0;
    otherwise
        prompt = 'Type of value change:';
        vis = 0.0;
    end % switch
    % 123 125
    EntityGenTrigger = struct('Type', {'combobox'}, 'Name', cellhorzcat(prompt), 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 125 139
    % 126 139
    % 127 139
    % 128 139
    % 129 139
    % 130 139
    % 131 139
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    tagObjProp = 'SpecifyEventPriority';
    vis = 1.0;
    name = 'Resolve simultaneous signal updates according to event priority';
    EntityGenSLHitsOpt = struct('Type', {'checkbox'}, 'Name', cellhorzcat(name), 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 142 155
    % 143 155
    % 144 155
    % 145 155
    % 146 155
    % 147 155
    % 148 155
    % 149 155
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    tagObjProp = 'GenerateEntityAtSimulationStart';
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    cond2 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{4.0});
    vis = or(cond1, cond2);
    if cond1
        name = 'Generate entity at simulation start';
    else
        if cond2
            name = 'Allow entity generation at simulation start';
        else
            name = 'Generate entity at simulation start';
        end % if
    end % if
    EntityGenAtStart = struct('Type', {'checkbox'}, 'Name', cellhorzcat(name), 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[6.0,6.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 168 179
    % 169 179
    % 170 179
    % 171 179
    % 172 179
    % 173 179
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    tagObjProp = 'PriorityEntityGeneration';
    vis = h.SpecifyEventPriority;
    % 180 182
    EntityGenEventPriority = struct('Type', {'edit'}, 'Name', {'Event priority:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[5.0,5.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 182 196
    % 183 196
    % 184 196
    % 185 196
    % 186 196
    % 187 196
    % 188 196
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    InterGenGroup.Type = 'group';
    InterGenGroup.Items = cellhorzcat(EntityGenInterGenOpt, EntityGenTrigger, EntityGenSLHitsOpt, EntityGenEventPriority, EntityGenAtStart);
    % 197 199
    InterGenGroup.RowSpan = [1.0 1.0];
    InterGenGroup.ColSpan = [1.0 1.0];
    InterGenGroup.LayoutGrid = [7.0 4.0];
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    tab1.Name = 'Entity Generation';
    tab1.Items = cellhorzcat(InterGenGroup);
    tab1.LayoutGrid = [2.0 1.0];
    tab1.RowStretch = [0.0 1.0];
    % 209 213
    % 210 213
    % 211 213
    tagObjProp = 'StatNumberDeparted';
    % 213 215
    vis = 1.0;
    en = vis;
    if isequal(h.entityType, EntityGenType.Entries{1.0})
        temp = ctranspose(h.getPropAllowedValues(tagObjProp));
        entries = temp(1.0:minus(end, 1.0));
    else
        entries = ctranspose(h.getPropAllowedValues(tagObjProp));
    end % if
    % 222 226
    % 223 226
    % 224 226
    EntityGenStatCount = struct('Type', {'combobox'}, 'Name', {'Number of entities departed, #d:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(entries), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 226 263
    % 227 263
    % 228 263
    % 229 263
    % 230 263
    % 231 263
    % 232 263
    % 233 263
    % 234 263
    % 235 263
    % 236 263
    % 237 263
    % 238 263
    % 239 263
    % 240 263
    % 241 263
    % 242 263
    % 243 263
    % 244 263
    % 245 263
    % 246 263
    % 247 263
    % 248 263
    % 249 263
    % 250 263
    % 251 263
    % 252 263
    % 253 263
    % 254 263
    % 255 263
    % 256 263
    % 257 263
    % 258 263
    % 259 263
    % 260 263
    % 261 263
    tagObjProp = 'StatPendingEntity';
    % 263 265
    vis = 1.0;
    % 265 267
    EntityGenStatOutStatus = struct('Type', {'combobox'}, 'Name', {'Status of pending entity departure, pe:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 267 281
    % 268 281
    % 269 281
    % 270 281
    % 271 281
    % 272 281
    % 273 281
    % 274 281
    % 275 281
    % 276 281
    % 277 281
    % 278 281
    % 279 281
    tagObjProp = 'StatAverageIntergenerationTime';
    % 281 283
    vis = 1.0;
    % 283 285
    EntityGenStatInterGenTime = struct('Type', {'combobox'}, 'Name', {'Average intergeneration time, w:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 285 300
    % 286 300
    % 287 300
    % 288 300
    % 289 300
    % 290 300
    % 291 300
    % 292 300
    % 293 300
    % 294 300
    % 295 300
    % 296 300
    % 297 300
    % 298 300
    StatGroup.Type = 'group';
    StatGroup.Items = cellhorzcat(EntityGenStatCount, EntityGenStatOutStatus, EntityGenStatInterGenTime);
    StatGroup.RowSpan = [1.0 1.0];
    StatGroup.ColSpan = [1.0 1.0];
    StatGroup.LayoutGrid = [5.0 4.0];
    % 304 309
    % 305 309
    % 306 309
    % 307 309
    tab2.Name = 'Statistics';
    tab2.Items = cellhorzcat(StatGroup);
    tab2.LayoutGrid = [2.0 1.0];
    tab2.RowStretch = [0.0 1.0];
    % 312 340
    % 313 340
    % 314 340
    % 315 340
    % 316 340
    % 317 340
    % 318 340
    % 319 340
    % 320 340
    % 321 340
    % 322 340
    % 323 340
    % 324 340
    % 325 340
    % 326 340
    % 327 340
    % 328 340
    % 329 340
    % 330 340
    % 331 340
    % 332 340
    % 333 340
    % 334 340
    % 335 340
    % 336 340
    % 337 340
    % 338 340
    tabcont.Name = 'tabcont';
    tabcont.Type = 'tab';
    % 341 345
    % 342 345
    % 343 345
    tabcont.Tabs = cellhorzcat(tab1, tab2);
    % 345 349
    % 346 349
    % 347 349
    tabcont.RowSpan = [3.0 3.0];
    tabcont.ColSpan = [1.0 1.0];
    % 350 354
    % 351 354
    % 352 354
    descriptionPane = desGetDescriptionPaneLocal(h.Block, h.Block.MaskDescription);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 356 358
    EmptyTextWidget1 = struct('Type', {'text'}, 'Name', {''}, 'Tag', {'description'}, 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,1.0]});
    % 358 364
    % 359 364
    % 360 364
    % 361 364
    % 362 364
    mainPane.Type = 'panel';
    mainPane.Name = '';
    mainPane.Items = cellhorzcat(descriptionPane, entityprop1, tabcont, EmptyTextWidget1);
    mainPane.Tag = 'mainPane';
    mainPane.LayoutGrid = [4.0 1.0];
    mainPane.RowStretch = [0.0 0.0 0.0 1.0];
    % 369 373
    % 370 373
    % 371 373
    idx = findstr(h.Block.Name, sprintf('\n'));
    blkName = h.Block.Name;
    % 374 376
    dlgstruct = struct('DialogTitle', cellhorzcat(horzcat('Block parameters: ', blkName)), 'HelpMethod', {'eval'}, 'HelpArgs', {{'helpview(simeventsbhelp)'}}, 'Items', cellhorzcat(cellhorzcat(mainPane)), 'DialogTag', cellhorzcat(dialogTag), 'CloseMethod', {'closeCallback'}, 'CloseMethodArgs', {{'%dialog'}}, 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyCallback', {'des_ddg_preApply'}, 'PreApplyArgs', {{'%source','%dialog'}}, 'PreApplyArgsDT', {'handle'});
    % 376 393
    % 377 393
    % 378 393
    % 379 393
    % 380 393
    % 381 393
    % 382 393
    % 383 393
    % 384 393
    % 385 393
    % 386 393
    % 387 393
    % 388 393
    % 389 393
    % 390 393
    % 391 393
    [isLibrary, isLocked] = h.isLibraryBlock(h.Block);
    if isLibrary && isLocked
        dlgstruct.DisableDialog = 1.0;
        % 395 397
        return;
    end % if
    % 398 401
    % 399 401
    parenth = bdroot(h.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmp(simStatus, {'running','paused'}))
        dlgstruct = h.disableNontunables(dlgstruct);
    end % if
end % function
function descriptionPane = desGetDescriptionPaneLocal(block, text)
    % 407 417
    % 408 417
    % 409 417
    % 410 417
    % 411 417
    % 412 417
    % 413 417
    % 414 417
    % 415 417
    description.Type = 'text';
    description.Name = text;
    description.Tag = 'description';
    description.WordWrap = 1.0;
    descriptionPane.Type = 'group';
    descriptionPane.Name = block.MaskType;
    descriptionPane.Tag = 'descriptionPane';
    descriptionPane.Items = cellhorzcat(description);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    descriptionPane.Tag = 'descriptionPane';
end % function
