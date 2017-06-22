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
    % 19 20
    DefaultNameLocation = 1.0;
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    tagObjProp = 'EntityType';
    % 27 28
    vis = 1.0;
    % 29 30
    EntityGenType = struct('Type', {'combobox'}, 'Name', {'Entity type:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
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
    % 44 45
    tagObjProp = 'ResponseWhenBlocked';
    % 46 47
    vis = 1.0;
    % 48 49
    EntityGenResponseWhenBlocked = struct('Type', {'combobox'}, 'Name', {'Response when blocked:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
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
    % 62 63
    tagObjProp = 'ResponseWhenUnblocked';
    % 64 65
    vis = isequal(h.ResponseWhenBlocked, EntityGenResponseWhenBlocked.Entries{1.0});
    EntityGenResponseWhenUnBlocked = struct('Type', {'combobox'}, 'Name', {'Response when unblocked:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 67 80
    % 68 80
    % 69 80
    % 70 80
    % 71 80
    % 72 80
    % 73 80
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    entityprop1.Type = 'group';
    % 81 82
    entityprop1.Items = cellhorzcat(EntityGenType, EntityGenResponseWhenBlocked, EntityGenResponseWhenUnBlocked);
    entityprop1.RowSpan = [2.0 2.0];
    entityprop1.ColSpan = [1.0 1.0];
    entityprop1.LayoutGrid = [3.0 4.0];
    % 86 93
    % 87 93
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    % 92 93
    tagObjProp = 'GenerateEntitiesUpon';
    vis = 1.0;
    % 95 96
    EntityGenInterGenOpt = struct('Type', {'combobox'}, 'Name', {'Generate entities with:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues('GenerateEntitiesUpon'))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 97 113
    % 98 113
    % 99 113
    % 100 113
    % 101 113
    % 102 113
    % 103 113
    % 104 113
    % 105 113
    % 106 113
    % 107 113
    % 108 113
    % 109 113
    % 110 113
    % 111 113
    % 112 113
    tagObjProp = 'Distribution';
    vis = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 115 116
    EntityGenDistribution = struct('Type', {'combobox'}, 'Name', {'Distribution:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,2.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 117 131
    % 118 131
    % 119 131
    % 120 131
    % 121 131
    % 122 131
    % 123 131
    % 124 131
    % 125 131
    % 126 131
    % 127 131
    % 128 131
    % 129 131
    % 130 131
    tagObjProp = 'Period';
    % 132 134
    % 133 134
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 135 136
    cond2 = double(isequal(h.Distribution, EntityGenDistribution.Entries{1.0}));
    vis = and(cond1, cond2);
    % 138 139
    EntityGenPeriod = struct('Type', {'edit'}, 'Name', {'Period:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
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
    % 151 152
    tagObjProp = 'Minimum';
    % 153 155
    % 154 155
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 156 157
    cond2 = isequal(h.Distribution, EntityGenDistribution.Entries{2.0});
    vis = and(cond1, cond2);
    % 159 160
    EntityGenMinimum = struct('Type', {'edit'}, 'Name', {'Minimum:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,2.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 161 173
    % 162 173
    % 163 173
    % 164 173
    % 165 173
    % 166 173
    % 167 173
    % 168 173
    % 169 173
    % 170 173
    % 171 173
    % 172 173
    tagObjProp = 'Maximum';
    % 174 176
    % 175 176
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 177 178
    cond2 = isequal(h.Distribution, EntityGenDistribution.Entries{2.0});
    vis = and(cond1, cond2);
    % 180 181
    EntityGenMaximum = struct('Type', {'edit'}, 'Name', {'Maximum:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 182 194
    % 183 194
    % 184 194
    % 185 194
    % 186 194
    % 187 194
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    % 193 194
    tagObjProp = 'InitialSeed';
    % 195 197
    % 196 197
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 198 199
    cond2 = isequal(h.Distribution, EntityGenDistribution.Entries{2.0});
    % 200 201
    cond3 = isequal(h.Distribution, EntityGenDistribution.Entries{3.0});
    vis = and(cond1, or(cond2, cond3));
    % 203 205
    % 204 205
    EntityGenInitialSeed = struct('Type', {'edit'}, 'Name', {'Initial seed:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 206 218
    % 207 218
    % 208 218
    % 209 218
    % 210 218
    % 211 218
    % 212 218
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    % 217 218
    tagObjProp = 'Mean';
    % 219 221
    % 220 221
    cond1 = isequal(h.GenerateEntitiesUpon, EntityGenInterGenOpt.Entries{1.0});
    % 222 223
    cond2 = isequal(h.Distribution, EntityGenDistribution.Entries{3.0});
    vis = and(cond1, cond2);
    % 225 226
    EntityGenMeanExpo = struct('Type', {'edit'}, 'Name', {'Mean:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,2.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 227 239
    % 228 239
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
    tagObjProp = 'GenerateEntityAtSimulationStart';
    % 240 241
    vis = 1.0;
    EntityGenerateEntityAtSimulationStart = struct('Type', {'checkbox'}, 'Name', {'Generate entity at simulation start'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[6.0,6.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 243 256
    % 244 256
    % 245 256
    % 246 256
    % 247 256
    % 248 256
    % 249 256
    % 250 256
    % 251 256
    % 252 256
    % 253 256
    % 254 256
    % 255 256
    tagObjProp = 'PriorityEntityGeneration';
    % 257 258
    vis = 1.0;
    % 259 260
    EntityGenEventPriority = struct('Type', {'edit'}, 'Name', {'Generation event priority:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[5.0,5.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 261 274
    % 262 274
    % 263 274
    % 264 274
    % 265 274
    % 266 274
    % 267 274
    % 268 274
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    % 273 274
    InterGenGroup.Type = 'group';
    InterGenGroup.Items = cellhorzcat(EntityGenInterGenOpt, EntityGenDistribution, EntityGenPeriod, EntityGenInitialSeed, EntityGenMinimum, EntityGenMaximum, EntityGenMeanExpo, EntityGenEventPriority, EntityGenerateEntityAtSimulationStart);
    % 276 277
    InterGenGroup.RowSpan = [1.0 1.0];
    InterGenGroup.ColSpan = [1.0 1.0];
    InterGenGroup.LayoutGrid = [7.0 4.0];
    % 280 284
    % 281 284
    % 282 284
    % 283 284
    tab1.Name = 'Entity Generation';
    tab1.Items = cellhorzcat(InterGenGroup);
    tab1.LayoutGrid = [2.0 1.0];
    tab1.RowStretch = [0.0 1.0];
    % 288 291
    % 289 291
    % 290 291
    tagObjProp = 'StatNumberDeparted';
    % 292 293
    vis = 1.0;
    en = vis;
    if isequal(h.EntityType, EntityGenType.Entries{1.0})
        temp = ctranspose(h.getPropAllowedValues(tagObjProp));
        entries = temp(1.0:minus(end, 1.0));
    else
        entries = ctranspose(h.getPropAllowedValues(tagObjProp));
    end % if
    % 301 302
    EntityGenStatCount = struct('Type', {'combobox'}, 'Name', {'Number of entities departed, #d:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(entries), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 303 339
    % 304 339
    % 305 339
    % 306 339
    % 307 339
    % 308 339
    % 309 339
    % 310 339
    % 311 339
    % 312 339
    % 313 339
    % 314 339
    % 315 339
    % 316 339
    % 317 339
    % 318 339
    % 319 339
    % 320 339
    % 321 339
    % 322 339
    % 323 339
    % 324 339
    % 325 339
    % 326 339
    % 327 339
    % 328 339
    % 329 339
    % 330 339
    % 331 339
    % 332 339
    % 333 339
    % 334 339
    % 335 339
    % 336 339
    % 337 339
    % 338 339
    tagObjProp = 'StatPendingEntity';
    % 340 341
    vis = 1.0;
    % 342 343
    EntityGenStatOutStatus = struct('Type', {'combobox'}, 'Name', {'Status of pending entity departure, pe:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 344 357
    % 345 357
    % 346 357
    % 347 357
    % 348 357
    % 349 357
    % 350 357
    % 351 357
    % 352 357
    % 353 357
    % 354 357
    % 355 357
    % 356 357
    tagObjProp = 'StatAverageIntergenerationTime';
    % 358 359
    vis = 1.0;
    % 360 361
    EntityGenStatInterGenTime = struct('Type', {'combobox'}, 'Name', {'Average intergeneration time, w:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', cellhorzcat(DefaultNameLocation));
    % 362 376
    % 363 376
    % 364 376
    % 365 376
    % 366 376
    % 367 376
    % 368 376
    % 369 376
    % 370 376
    % 371 376
    % 372 376
    % 373 376
    % 374 376
    % 375 376
    StatGroup.Type = 'group';
    StatGroup.Items = cellhorzcat(EntityGenStatCount, EntityGenStatOutStatus, EntityGenStatInterGenTime);
    StatGroup.RowSpan = [1.0 1.0];
    StatGroup.ColSpan = [1.0 1.0];
    StatGroup.LayoutGrid = [5.0 4.0];
    % 381 385
    % 382 385
    % 383 385
    % 384 385
    tab2.Name = 'Statistics';
    tab2.Items = cellhorzcat(StatGroup);
    tab2.LayoutGrid = [2.0 1.0];
    tab2.RowStretch = [0.0 1.0];
    % 389 392
    % 390 392
    % 391 392
    tabcont.Name = 'tabcont';
    tabcont.Type = 'tab';
    % 394 397
    % 395 397
    % 396 397
    tabcont.Tabs = cellhorzcat(tab1, tab2);
    % 398 401
    % 399 401
    % 400 401
    tabcont.RowSpan = [3.0 3.0];
    tabcont.ColSpan = [1.0 1.0];
    % 403 406
    % 404 406
    % 405 406
    descriptionPane = desGetDescriptionPaneLocal(h.Block, h.Block.MaskDescription);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 409 410
    EmptyTextWidget1 = struct('Type', {'text'}, 'Name', {''}, 'Tag', {'description'}, 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,1.0]});
    % 411 416
    % 412 416
    % 413 416
    % 414 416
    % 415 416
    mainPane.Type = 'panel';
    mainPane.Name = '';
    mainPane.Items = cellhorzcat(descriptionPane, entityprop1, tabcont, EmptyTextWidget1);
    mainPane.Tag = 'mainPane';
    mainPane.LayoutGrid = [4.0 1.0];
    mainPane.RowStretch = [0.0 0.0 0.0 1.0];
    % 422 425
    % 423 425
    % 424 425
    idx = findstr(h.Block.Name, sprintf('\n'));
    blkName = h.Block.Name;
    % 427 428
    dlgstruct = struct('DialogTitle', cellhorzcat(horzcat('Block parameters: ', blkName)), 'HelpMethod', {'eval'}, 'HelpArgs', {{'helpview(simeventsbhelp)'}}, 'Items', cellhorzcat(cellhorzcat(mainPane)), 'DialogTag', cellhorzcat(dialogTag), 'CloseMethod', {'closeCallback'}, 'CloseMethodArgs', {{'%dialog'}}, 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyCallback', {'des_ddg_preApply'}, 'PreApplyArgs', {{'%source','%dialog'}}, 'PreApplyArgsDT', {'handle'});
    % 429 445
    % 430 445
    % 431 445
    % 432 445
    % 433 445
    % 434 445
    % 435 445
    % 436 445
    % 437 445
    % 438 445
    % 439 445
    % 440 445
    % 441 445
    % 442 445
    % 443 445
    % 444 445
    [isLibrary, isLocked] = h.isLibraryBlock(h.Block);
    if isLibrary && isLocked
        dlgstruct.DisableDialog = 1.0;
        % 448 449
        return;
    end % if
    % 451 453
    % 452 453
    parenth = bdroot(h.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmp(simStatus, {'running','paused'}))
        dlgstruct = h.disableNontunables(dlgstruct);
    end % if
end % function
function descriptionPane = desGetDescriptionPaneLocal(block, text)
    % 460 469
    % 461 469
    % 462 469
    % 463 469
    % 464 469
    % 465 469
    % 466 469
    % 467 469
    % 468 469
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
