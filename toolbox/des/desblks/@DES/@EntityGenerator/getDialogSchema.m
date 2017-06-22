function dlgstruct = getDialogSchema(h, dialogTag)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    tagObjProp = 'entityType';
    % 26 27
    vis = 1.0;
    % 28 29
    EntityGenType = struct('Type', {'combobox'}, 'Name', {'Entity type:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,2.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 30 60
    % 31 60
    % 32 60
    % 33 60
    % 34 60
    % 35 60
    % 36 60
    % 37 60
    % 38 60
    % 39 60
    % 40 60
    % 41 60
    % 42 60
    % 43 60
    % 44 60
    % 45 60
    % 46 60
    % 47 60
    % 48 60
    % 49 60
    % 50 60
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    % 59 60
    tagObjProp = 'blockable';
    % 61 62
    vis = 1.0;
    % 63 64
    EntityGenBlockable = struct('Type', {'combobox'}, 'Name', {'Blockable:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
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
    % 78 79
    entityprop1.Type = 'group';
    % 80 81
    entityprop1.Items = cellhorzcat(EntityGenType, EntityGenBlockable);
    entityprop1.RowSpan = [2.0 2.0];
    entityprop1.ColSpan = [1.0 1.0];
    entityprop1.LayoutGrid = [2.0 4.0];
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    % 91 92
    tagObjProp = 'interGenTime';
    vis = 1.0;
    % 94 95
    EntityGenInterGenOpt = struct('Type', {'combobox'}, 'Name', {'Generate entities:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues('interGenTime'))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 96 114
    % 97 114
    % 98 114
    % 99 114
    % 100 114
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    tagObjProp = 'distribution';
    vis = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 116 117
    EntityGenDistribution = struct('Type', {'combobox'}, 'Name', {'Distribution:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,2.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 118 135
    % 119 135
    % 120 135
    % 121 135
    % 122 135
    % 123 135
    % 124 135
    % 125 135
    % 126 135
    % 127 135
    % 128 135
    % 129 135
    % 130 135
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    tagObjProp = 'time';
    % 136 138
    % 137 138
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 139 140
    cond2 = double(isequal(h.distribution, EntityGenDistribution.Entries{1.0}));
    vis = and(cond1, cond2);
    % 142 143
    EntityGenInterGenTime = struct('Type', {'edit'}, 'Name', {'Period (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
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
    % 156 157
    tagObjProp = 'minUnif';
    % 158 160
    % 159 160
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 161 162
    cond2 = isequal(h.distribution, EntityGenDistribution.Entries{2.0});
    vis = and(cond1, cond2);
    % 164 165
    EntityGenMinUnif = struct('Type', {'edit'}, 'Name', {'Minimum (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,2.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 166 181
    % 167 181
    % 168 181
    % 169 181
    % 170 181
    % 171 181
    % 172 181
    % 173 181
    % 174 181
    % 175 181
    % 176 181
    % 177 181
    % 178 181
    % 179 181
    % 180 181
    tagObjProp = 'maxUnif';
    % 182 184
    % 183 184
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 185 186
    cond2 = isequal(h.distribution, EntityGenDistribution.Entries{2.0});
    vis = and(cond1, cond2);
    % 188 189
    EntityGenMaxUnif = struct('Type', {'edit'}, 'Name', {'Maximum (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 190 203
    % 191 203
    % 192 203
    % 193 203
    % 194 203
    % 195 203
    % 196 203
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    % 202 203
    tagObjProp = 'seed';
    % 204 206
    % 205 206
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 207 208
    cond2 = isequal(h.distribution, EntityGenDistribution.Entries{2.0});
    % 209 210
    cond3 = isequal(h.distribution, EntityGenDistribution.Entries{3.0});
    vis = and(cond1, or(cond2, cond3));
    % 212 214
    % 213 214
    EntityGenSeed = struct('Type', {'edit'}, 'Name', {'Initial seed:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 215 228
    % 216 228
    % 217 228
    % 218 228
    % 219 228
    % 220 228
    % 221 228
    % 222 228
    % 223 228
    % 224 228
    % 225 228
    % 226 228
    % 227 228
    tagObjProp = 'mean';
    % 229 231
    % 230 231
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 232 233
    cond2 = isequal(h.distribution, EntityGenDistribution.Entries{3.0});
    vis = and(cond1, cond2);
    % 235 236
    EntityGenMeanExpo = struct('Type', {'edit'}, 'Name', {'Mean (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,2.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 237 251
    % 238 251
    % 239 251
    % 240 251
    % 241 251
    % 242 251
    % 243 251
    % 244 251
    % 245 251
    % 246 251
    % 247 251
    % 248 251
    % 249 251
    % 250 251
    tagObjProp = 'sampleTime';
    % 252 253
    vis = 0.0;
    % 254 259
    % 255 259
    % 256 259
    % 257 259
    % 258 259
    EntityGenInterGenSampleTime = struct('Type', {'edit'}, 'Name', {'Sample time (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,2.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 260 274
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
    tagObjProp = 'offsetTime';
    % 275 276
    vis = 0.0;
    % 277 282
    % 278 282
    % 279 282
    % 280 282
    % 281 282
    EntityGenInterGenOffsetTime = struct('Type', {'edit'}, 'Name', {'Offset time (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[3.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 283 296
    % 284 296
    % 285 296
    % 286 296
    % 287 296
    % 288 296
    % 289 296
    % 290 296
    % 291 296
    % 292 296
    % 293 296
    % 294 296
    % 295 296
    tagObjProp = 'trigger';
    % 297 298
    vis = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{4.0});
    % 299 300
    EntityGenTrigger = struct('Type', {'combobox'}, 'Name', {'Type of change in signal value:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[2.0,2.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 301 315
    % 302 315
    % 303 315
    % 304 315
    % 305 315
    % 306 315
    % 307 315
    % 308 315
    % 309 315
    % 310 315
    % 311 315
    % 312 315
    % 313 315
    % 314 315
    tagObjProp = 'genFirstEvtOpt';
    % 316 318
    % 317 318
    cond1 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{1.0});
    % 319 320
    cond2 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{2.0});
    vis = or(cond1, cond2);
    % 322 323
    EntityGenFirstEvtOpt = struct('Type', {'checkbox'}, 'Name', {'Generate entity at simulation start'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[6.0,6.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 324 337
    % 325 337
    % 326 337
    % 327 337
    % 328 337
    % 329 337
    % 330 337
    % 331 337
    % 332 337
    % 333 337
    % 334 337
    % 335 337
    % 336 337
    NameOptions = {'Handle sample time hit:','Handle trigger signal:','Handle function call signal:'};
    tagObjProp = 'schedule';
    % 339 340
    cond(1.0) = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{3.0});
    cond(2.0) = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{4.0});
    cond(3.0) = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{5.0});
    vis = any(cond);
    % 344 346
    % 345 346
    if vis
        name = NameOptions{find(cond)};
    else
        % 349 350
        name = NameOptions{1.0};
    end % if
    % 352 353
    EntityGenSLHitsOpt = struct('Type', {'combobox'}, 'Name', cellhorzcat(name), 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 354 368
    % 355 368
    % 356 368
    % 357 368
    % 358 368
    % 359 368
    % 360 368
    % 361 368
    % 362 368
    % 363 368
    % 364 368
    % 365 368
    % 366 368
    % 367 368
    tagObjProp = 'PriorityEntityGeneration';
    % 369 370
    cond1 = isequal(h.schedule, EntityGenSLHitsOpt.Entries{1.0});
    cond2 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{3.0});
    cond3 = isequal(h.interGenTime, EntityGenInterGenOpt.Entries{4.0});
    % 373 374
    vis = not(or(and(cond2, cond1), and(cond3, cond1)));
    % 375 376
    EntityGenEventPriority = struct('Type', {'edit'}, 'Name', {'Generation event priority:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[0.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[5.0,5.0]}, 'ColSpan', {[1.0,4.0]}, 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 377 391
    % 378 391
    % 379 391
    % 380 391
    % 381 391
    % 382 391
    % 383 391
    % 384 391
    % 385 391
    % 386 391
    % 387 391
    % 388 391
    % 389 391
    % 390 391
    InterGenGroup.Type = 'group';
    InterGenGroup.Items = cellhorzcat(EntityGenInterGenOpt, EntityGenTrigger, EntityGenDistribution, EntityGenInterGenTime, EntityGenMinUnif, EntityGenMaxUnif, EntityGenMeanExpo, EntityGenInterGenSampleTime, EntityGenInterGenOffsetTime, EntityGenSLHitsOpt, EntityGenFirstEvtOpt, EntityGenEventPriority, EntityGenSeed);
    % 393 394
    InterGenGroup.RowSpan = [1.0 1.0];
    InterGenGroup.ColSpan = [1.0 1.0];
    InterGenGroup.LayoutGrid = [7.0 4.0];
    % 397 401
    % 398 401
    % 399 401
    % 400 401
    tab1.Name = 'Intergeneration Time';
    tab1.Items = cellhorzcat(InterGenGroup);
    tab1.LayoutGrid = [2.0 1.0];
    tab1.RowStretch = [0.0 1.0];
    % 405 408
    % 406 408
    % 407 408
    tagObjProp = 'statCountOpt';
    % 409 410
    vis = 1.0;
    en = vis;
    if isequal(h.entityType, EntityGenType.Entries{1.0})
        temp = ctranspose(h.getPropAllowedValues(tagObjProp));
        entries = temp(1.0:minus(end, 1.0));
    else
        entries = ctranspose(h.getPropAllowedValues(tagObjProp));
    end % if
    % 418 419
    EntityGenStatCount = struct('Type', {'combobox'}, 'Name', {'Number of entities departed:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[1.0,1.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(entries), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 420 457
    % 421 457
    % 422 457
    % 423 457
    % 424 457
    % 425 457
    % 426 457
    % 427 457
    % 428 457
    % 429 457
    % 430 457
    % 431 457
    % 432 457
    % 433 457
    % 434 457
    % 435 457
    % 436 457
    % 437 457
    % 438 457
    % 439 457
    % 440 457
    % 441 457
    % 442 457
    % 443 457
    % 444 457
    % 445 457
    % 446 457
    % 447 457
    % 448 457
    % 449 457
    % 450 457
    % 451 457
    % 452 457
    % 453 457
    % 454 457
    % 455 457
    % 456 457
    tagObjProp = 'outPortStatus';
    % 458 459
    vis = 1.0;
    % 460 461
    EntityGenStatOutStatus = struct('Type', {'combobox'}, 'Name', {'OUT port blockage status:'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[3.0,3.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 462 476
    % 463 476
    % 464 476
    % 465 476
    % 466 476
    % 467 476
    % 468 476
    % 469 476
    % 470 476
    % 471 476
    % 472 476
    % 473 476
    % 474 476
    % 475 476
    tagObjProp = 'avgGenTimeOpt';
    % 477 478
    vis = 1.0;
    % 479 480
    EntityGenStatInterGenTime = struct('Type', {'combobox'}, 'Name', {'Average intergeneration time (s):'}, 'Tag', cellhorzcat(tagObjProp), 'ObjectProperty', cellhorzcat(tagObjProp), 'DialogRefresh', {[1.0]}, 'Mode', {[1.0]}, 'Visible', cellhorzcat(vis), 'Enabled', cellhorzcat(vis), 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,4.0]}, 'Entries', cellhorzcat(ctranspose(h.getPropAllowedValues(tagObjProp))), 'NameLocation', {[4.0]}, 'Tunable', cellhorzcat(false));
    % 481 496
    % 482 496
    % 483 496
    % 484 496
    % 485 496
    % 486 496
    % 487 496
    % 488 496
    % 489 496
    % 490 496
    % 491 496
    % 492 496
    % 493 496
    % 494 496
    % 495 496
    StatGroup.Type = 'group';
    StatGroup.Items = cellhorzcat(EntityGenStatCount, EntityGenStatOutStatus, EntityGenStatInterGenTime);
    StatGroup.RowSpan = [1.0 1.0];
    StatGroup.ColSpan = [1.0 1.0];
    StatGroup.LayoutGrid = [5.0 4.0];
    % 501 505
    % 502 505
    % 503 505
    % 504 505
    tab2.Name = 'Statistics';
    tab2.Items = cellhorzcat(StatGroup);
    tab2.LayoutGrid = [2.0 1.0];
    tab2.RowStretch = [0.0 1.0];
    % 509 536
    % 510 536
    % 511 536
    % 512 536
    % 513 536
    % 514 536
    % 515 536
    % 516 536
    % 517 536
    % 518 536
    % 519 536
    % 520 536
    % 521 536
    % 522 536
    % 523 536
    % 524 536
    % 525 536
    % 526 536
    % 527 536
    % 528 536
    % 529 536
    % 530 536
    % 531 536
    % 532 536
    % 533 536
    % 534 536
    % 535 536
    tabcont.Name = 'tabcont';
    tabcont.Type = 'tab';
    % 538 541
    % 539 541
    % 540 541
    tabcont.Tabs = cellhorzcat(tab1, tab2);
    % 542 545
    % 543 545
    % 544 545
    tabcont.RowSpan = [3.0 3.0];
    tabcont.ColSpan = [1.0 1.0];
    % 547 550
    % 548 550
    % 549 550
    descriptionPane = desGetDescriptionPaneLocal(h.Block, h.Block.MaskDescription);
    descriptionPane.RowSpan = [1.0 1.0];
    descriptionPane.ColSpan = [1.0 1.0];
    % 553 554
    EmptyTextWidget1 = struct('Type', {'text'}, 'Name', {''}, 'Tag', {'description'}, 'RowSpan', {[4.0,4.0]}, 'ColSpan', {[1.0,1.0]});
    % 555 560
    % 556 560
    % 557 560
    % 558 560
    % 559 560
    mainPane.Type = 'panel';
    mainPane.Name = '';
    mainPane.Items = cellhorzcat(descriptionPane, entityprop1, tabcont, EmptyTextWidget1);
    mainPane.Tag = 'mainPane';
    mainPane.LayoutGrid = [4.0 1.0];
    mainPane.RowStretch = [0.0 0.0 0.0 1.0];
    % 566 569
    % 567 569
    % 568 569
    idx = findstr(h.Block.Name, sprintf('\n'));
    blkName = h.Block.Name;
    % 571 572
    dlgstruct = struct('DialogTitle', cellhorzcat(horzcat('Block parameters: ', blkName)), 'HelpMethod', {'eval'}, 'HelpArgs', {{'helpview(simeventsbhelp)'}}, 'Items', cellhorzcat(cellhorzcat(mainPane)), 'DialogTag', cellhorzcat(dialogTag), 'CloseMethod', {'closeCallback'}, 'CloseMethodArgs', {{'%dialog'}}, 'CloseMethodArgsDT', {{'handle'}}, 'PreApplyCallback', {'des_ddg_preApply'}, 'PreApplyArgs', {{'%source','%dialog'}}, 'PreApplyArgsDT', {'handle'});
    % 573 589
    % 574 589
    % 575 589
    % 576 589
    % 577 589
    % 578 589
    % 579 589
    % 580 589
    % 581 589
    % 582 589
    % 583 589
    % 584 589
    % 585 589
    % 586 589
    % 587 589
    % 588 589
    [isLibrary, isLocked] = h.isLibraryBlock(h.Block);
    if isLibrary && isLocked
        dlgstruct.DisableDialog = 1.0;
        % 592 593
        return;
    end % if
    % 595 597
    % 596 597
    parenth = bdroot(h.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmp(simStatus, {'running','paused'}))
        dlgstruct = h.disableNontunables(dlgstruct);
    end % if
end % function
function descriptionPane = desGetDescriptionPaneLocal(block, text)
    % 604 613
    % 605 613
    % 606 613
    % 607 613
    % 608 613
    % 609 613
    % 610 613
    % 611 613
    % 612 613
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
