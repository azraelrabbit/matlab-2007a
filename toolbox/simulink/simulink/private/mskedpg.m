function mskedpg(pagename, dlgHandle, BlockHandle, position)
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
    % 12 13
    switch pagename
    case 'IconPage'
        % 15 16
        IconPage(dlgHandle, BlockHandle, position)
    case 'ParamPage'
        % 18 19
        ParamPage(dlgHandle, BlockHandle, position)
    case 'DocPage'
        % 21 22
        DocPage(dlgHandle, BlockHandle, position)
    otherwise
        % 24 25
        error(horzcat('Unknown page of the Mask Editor : ', pagename));
        % 26 27
    end % switch
end % function
function DocPage(dlgHandle, BlockHandle, position)
    % 30 48
    % 31 48
    % 32 48
    % 33 48
    % 34 48
    % 35 48
    % 36 48
    % 37 48
    % 38 48
    % 39 48
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    SyncData = masksync('SyncDocPage', dlgHandle, BlockHandle);
    UIData = masksync('UIGeom', dlgHandle, BlockHandle, position);
    Data = get(dlgHandle, 'UserData');
    DocPageNumber = 'page3';
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    uicontrol('Style', 'text', 'Tag', DocPageNumber, 'horizontalalignment', 'left', 'Position', horzcat(15.0, minus(UIData.Height, 70.0), 125.0, 20.0), 'Visible', 'off', 'String', 'Block description:');
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    Data.DocPage.MaskDescriptionHandle = uicontrol('Style', 'edit', 'Tag', DocPageNumber, 'Min', 0.0, 'Max', 2.0, 'HorizontalAlignment', 'left', 'Visible', 'off', 'String', cellhorzcat(SyncData.DescriptionString), 'Position', horzcat(20.0, minus(UIData.Height, 160.0), minus(UIData.Width, 15.0), 90.0), 'backgroundColor', [1.0 1.0 1.0]);
    % 65 78
    % 66 78
    % 67 78
    % 68 78
    % 69 78
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    % 77 78
    uicontrol('Tag', DocPageNumber, 'Style', 'text', 'HorizontalAlignment', 'left', 'Position', horzcat(15.0, minus(UIData.Height, 205.0), 200.0, 20.0), 'Visible', 'off', 'String', 'Block help:');
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    % 85 86
    Data.DocPage.MaskHelpHandle = uicontrol('Tag', DocPageNumber, 'Style', 'edit', 'Min', 0.0, 'Max', 2.0, 'horizontalAlignment', 'left', 'Position', horzcat(20.0, minus(UIData.Height, 315.0), minus(UIData.Width, 15.0), 110.0), 'Visible', 'off', 'String', cellhorzcat(SyncData.HelpString), 'BackgroundColor', [1.0 1.0 1.0]);
    % 87 100
    % 88 100
    % 89 100
    % 90 100
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    % 99 100
    set(dlgHandle, 'UserData', Data);
end % function
function ParamPage(dlgHandle, BlockHandle, position)
    % 103 121
    % 104 121
    % 105 121
    % 106 121
    % 107 121
    % 108 121
    % 109 121
    % 110 121
    % 111 121
    % 112 121
    % 113 121
    % 114 121
    % 115 121
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    % 120 121
    SyncData = masksync('SyncParamPage', dlgHandle, BlockHandle);
    UIData = masksync('UIGeom', dlgHandle, BlockHandle, position);
    Data = get(dlgHandle, 'UserData');
    ParamPageNumber = 'page2';
    % 125 129
    % 126 129
    % 127 129
    % 128 129
    uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(90.0, minus(UIData.Height, 49.0), 120.0, 17.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'String', 'Prompt');
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    % 135 136
    uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(265.0, minus(UIData.Height, 49.0), 55.0, 17.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'String', 'Type');
    % 137 143
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    % 142 143
    uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(320.0, minus(UIData.Height, 49.0), 70.0, 17.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'String', 'Variable');
    % 144 154
    % 145 154
    % 146 154
    % 147 154
    % 148 154
    % 149 154
    % 150 154
    % 151 154
    % 152 154
    % 153 154
    Data.ParamPage.ParamListBox = uicontrol('style', 'listbox', 'tag', ParamPageNumber, 'Callback', 'mskeddlg Listbox UpdateEdit', 'String', SyncData.ParamString, 'min', 0.0, 'max', 0.0, 'UserData', SyncData.ParamData, 'FontName', UIData.ListboxFontname, 'FontSize', UIData.ListboxFontsize, 'FontWeight', 'normal', 'Visible', 'off', 'Position', horzcat(90.0, minus(UIData.Height, 160.0), 310.0, 110.0));
    % 155 172
    % 156 172
    % 157 172
    % 158 172
    % 159 172
    % 160 172
    % 161 172
    % 162 172
    % 163 172
    % 164 172
    % 165 172
    % 166 172
    % 167 172
    % 168 172
    % 169 172
    % 170 172
    % 171 172
    Data.ParamPage.NewButtonHandle = uicontrol('Style', 'pushbutton', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 71.0), 70.0, 20.0), 'HorizontalAlignment', 'center', 'Visible', 'off', 'Callback', 'mskeddlg Listbox New', 'String', 'Add');
    % 173 181
    % 174 181
    % 175 181
    % 176 181
    % 177 181
    % 178 181
    % 179 181
    % 180 181
    Data.ParamPage.DeleteButtonHandle = uicontrol('Style', 'pushbutton', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 99.0), 70.0, 20.0), 'HorizontalAlignment', 'center', 'Visible', 'off', 'enable', SyncData.EnableDeleteButton, 'Callback', 'mskeddlg Listbox Delete', 'String', 'Delete');
    % 182 191
    % 183 191
    % 184 191
    % 185 191
    % 186 191
    % 187 191
    % 188 191
    % 189 191
    % 190 191
    Data.ParamPage.UpButtonHandle = uicontrol('Style', 'pushbutton', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 127.0), 70.0, 20.0), 'HorizontalAlignment', 'center', 'Visible', 'off', 'enable', SyncData.EnableUpButton, 'Callback', 'mskeddlg Listbox Up', 'String', 'Up');
    % 192 201
    % 193 201
    % 194 201
    % 195 201
    % 196 201
    % 197 201
    % 198 201
    % 199 201
    % 200 201
    Data.ParamPage.DownButtonHandle = uicontrol('Style', 'pushbutton', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 155.0), 70.0, 20.0), 'HorizontalAlignment', 'center', 'Visible', 'off', 'enable', SyncData.EnableDownButton, 'Callback', 'mskeddlg Listbox Down', 'String', 'Down');
    % 202 215
    % 203 215
    % 204 215
    % 205 215
    % 206 215
    % 207 215
    % 208 215
    % 209 215
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    % 214 215
    Data.ParamPage.MaskPStringHandle = uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 182.0), 50.0, 15.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'enable', SyncData.EnablePromptText, 'String', 'Prompt: ');
    % 216 224
    % 217 224
    % 218 224
    % 219 224
    % 220 224
    % 221 224
    % 222 224
    % 223 224
    Data.ParamPage.MaskPromptsHandle = uicontrol('Style', 'edit', 'Tag', ParamPageNumber, 'min', 0.0, 'max', 1.0, 'Callback', 'mskeddlg Listbox Edit', 'String', SyncData.PromptString, 'Position', horzcat(65.0, minus(UIData.Height, 183.0), 130.0, UIData.EditSize), 'Visible', 'off', 'enable', SyncData.EnablePromptEdit, 'HorizontalAlignment', 'left', 'backgroundColor', [1.0 1.0 1.0]);
    % 225 240
    % 226 240
    % 227 240
    % 228 240
    % 229 240
    % 230 240
    % 231 240
    % 232 240
    % 233 240
    % 234 240
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    % 239 240
    Data.ParamPage.MaskVStringHandle = uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(15.0, minus(UIData.Height, 212.0), 50.0, 20.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'enable', SyncData.EnableVariableText, 'String', 'Variable: ');
    % 241 249
    % 242 249
    % 243 249
    % 244 249
    % 245 249
    % 246 249
    % 247 249
    % 248 249
    Data.ParamPage.MaskVariablesHandle = uicontrol('Style', 'edit', 'Tag', ParamPageNumber, 'min', 0.0, 'max', 1.0, 'Callback', 'mskeddlg Listbox Edit', 'String', SyncData.FirstVariable, 'Visible', 'off', 'enable', SyncData.EnableVariableEdit, 'Position', horzcat(65.0, minus(UIData.Height, 208.0), 130.0, UIData.EditSize), 'HorizontalAlignment', 'left', 'backgroundColor', [1.0 1.0 1.0]);
    % 250 265
    % 251 265
    % 252 265
    % 253 265
    % 254 265
    % 255 265
    % 256 265
    % 257 265
    % 258 265
    % 259 265
    % 260 265
    % 261 265
    % 262 265
    % 263 265
    % 264 265
    Data.ParamPage.MaskParamStringHandle = uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(230.0, minus(UIData.Height, 187.0), 80.0, 20.0), 'horizontalalignment', 'left', 'enable', SyncData.EnableControlText, 'Visible', 'off', 'String', 'Control type:');
    % 266 274
    % 267 274
    % 268 274
    % 269 274
    % 270 274
    % 271 274
    % 272 274
    % 273 274
    Data.ParamPage.MaskParamTypeHandle = uicontrol('Style', 'popup', 'String', 'Edit|Checkbox|Popup', 'Tag', ParamPageNumber, 'Position', horzcat(310.0, UIData.TypePopupOffset, 90.0, UIData.PopupSize), 'Visible', 'off', 'enable', SyncData.EnableControlPopup, 'Backgroundcolor', UIData.PopupColor, 'value', SyncData.Value, 'Callback', 'mskeddlg Listbox Edit');
    % 275 289
    % 276 289
    % 277 289
    % 278 289
    % 279 289
    % 280 289
    % 281 289
    % 282 289
    % 283 289
    % 284 289
    % 285 289
    % 286 289
    % 287 289
    % 288 289
    Data.ParamPage.MaskEvalStringHandle = uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'Position', horzcat(230.0, minus(UIData.Height, 212.0), 80.0, 20.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'enable', SyncData.EnableAssgnText, 'String', 'Assignment:');
    % 290 298
    % 291 298
    % 292 298
    % 293 298
    % 294 298
    % 295 298
    % 296 298
    % 297 298
    Data.ParamPage.MaskEvalHandle = uicontrol('Style', 'popup', 'Tag', ParamPageNumber, 'Visible', 'off', 'enable', SyncData.EnableAssgnPopup, 'String', 'Evaluate|Literal', 'Backgroundcolor', UIData.PopupColor, 'Value', SyncData.FirstEvalType, 'Callback', 'mskeddlg Listbox Edit', 'Position', horzcat(310.0, UIData.EvalPopupOffset, 90.0, UIData.PopupSize));
    % 299 313
    % 300 313
    % 301 313
    % 302 313
    % 303 313
    % 304 313
    % 305 313
    % 306 313
    % 307 313
    % 308 313
    % 309 313
    % 310 313
    % 311 313
    % 312 313
    Data.ParamPage.MaskPopupText = uicontrol('Style', 'text', 'Tag', ParamPageNumber, 'enable', SyncData.EnablePopupString, 'Position', horzcat(15.0, minus(UIData.Height, 234.0), 90.0, 15.0), 'HorizontalAlignment', 'left', 'Visible', 'off', 'String', 'Popup strings:');
    % 314 322
    % 315 322
    % 316 322
    % 317 322
    % 318 322
    % 319 322
    % 320 322
    % 321 322
    Data.ParamPage.MaskPopupStrings = uicontrol('Style', 'edit', 'Tag', ParamPageNumber, 'Position', horzcat(110.0, minus(UIData.Height, 234.0), minus(UIData.Width, 105.0), UIData.EditSize), 'String', SyncData.FirstPopupString, 'enable', SyncData.EnablePopupString, 'Visible', 'off', 'HorizontalAlignment', 'left', 'Callback', 'mskeddlg Listbox Edit', 'backgroundColor', [1.0 1.0 1.0]);
    % 323 337
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
    uicontrol('Tag', ParamPageNumber, 'Style', 'text', 'HorizontalAlignment', 'left', 'Position', horzcat(15.0, minus(UIData.Height, 260.0), 200.0, 15.0), 'Visible', 'off', 'String', 'Initialization commands:');
    % 338 345
    % 339 345
    % 340 345
    % 341 345
    % 342 345
    % 343 345
    % 344 345
    Data.ParamPage.MaskInitCommandsHandle = uicontrol('Tag', ParamPageNumber, 'Style', 'edit', 'HorizontalAlignment', 'left', 'Min', 0.0, 'Max', 2.0, 'Position', horzcat(20.0, minus(UIData.Height, 317.0), minus(UIData.Width, 15.0), 55.0), 'Visible', 'off', 'String', SyncData.InitString, 'BackgroundColor', [1.0 1.0 1.0]);
    % 346 359
    % 347 359
    % 348 359
    % 349 359
    % 350 359
    % 351 359
    % 352 359
    % 353 359
    % 354 359
    % 355 359
    % 356 359
    % 357 359
    % 358 359
    set(dlgHandle, 'UserData', Data);
end % function
function IconPage(dlgHandle, BlockHandle, position)
    % 362 383
    % 363 383
    % 364 383
    % 365 383
    % 366 383
    % 367 383
    % 368 383
    % 369 383
    % 370 383
    % 371 383
    % 372 383
    % 373 383
    % 374 383
    % 375 383
    % 376 383
    % 377 383
    % 378 383
    % 379 383
    % 380 383
    % 381 383
    % 382 383
    SyncData = masksync('SyncIconPage', dlgHandle, BlockHandle);
    UIData = masksync('UIGeom', dlgHandle, BlockHandle, position);
    Data = get(dlgHandle, 'UserData');
    IconPage = 'page1';
    IconPageVisible = 'on';
    % 388 395
    % 389 395
    % 390 395
    % 391 395
    % 392 395
    % 393 395
    % 394 395
    uicontrol('Style', 'text', 'Position', horzcat(15.0, minus(UIData.Height, 28.0), 75.0, 20.0), 'HorizontalAlignment', 'left', 'String', 'Mask type: ');
    % 396 401
    % 397 401
    % 398 401
    % 399 401
    % 400 401
    Data.IconPage.MaskTypeHandle = uicontrol('Style', 'edit', 'Tag', 'page0', 'HorizontalAlignment', 'left', 'String', SyncData.TypeString, 'Position', horzcat(90.0, minus(UIData.Height, 23.0), minus(UIData.Width, 85.0), UIData.EditSize), 'backgroundColor', [1.0 1.0 1.0]);
    % 402 416
    % 403 416
    % 404 416
    % 405 416
    % 406 416
    % 407 416
    % 408 416
    % 409 416
    % 410 416
    % 411 416
    % 412 416
    % 413 416
    % 414 416
    % 415 416
    uicontrol('Tag', IconPage, 'Style', 'text', 'HorizontalAlignment', 'left', 'Position', horzcat(15.0, minus(UIData.Height, 57.0), 160.0, 20.0), 'Visible', IconPageVisible, 'String', 'Drawing commands:');
    % 417 424
    % 418 424
    % 419 424
    % 420 424
    % 421 424
    % 422 424
    % 423 424
    Data.IconPage.MaskDisplayHandle = uicontrol('Tag', IconPage, 'Style', 'edit', 'HorizontalAlignment', 'left', 'Min', 0.0, 'Max', 2.0, 'Position', horzcat(20.0, minus(UIData.Height, 195.0), minus(UIData.Width, 15.0), 138.0), 'Visible', IconPageVisible, 'String', cellhorzcat(SyncData.DisplayString), 'BackgroundColor', [1.0 1.0 1.0]);
    % 425 438
    % 426 438
    % 427 438
    % 428 438
    % 429 438
    % 430 438
    % 431 438
    % 432 438
    % 433 438
    % 434 438
    % 435 438
    % 436 438
    % 437 438
    uicontrol('Tag', IconPage, 'Style', 'text', 'horizontalalignment', 'right', 'Visible', IconPageVisible, 'Position', horzcat(145.0, minus(UIData.Height, 232.0), 140.0, UIData.RadioHeight), 'String', 'Icon frame:');
    % 439 446
    % 440 446
    % 441 446
    % 442 446
    % 443 446
    % 444 446
    % 445 446
    Data.IconPage.MaskFrameIconHandle = uicontrol('Tag', IconPage, 'Style', 'popup', 'Position', horzcat(290.0, UIData.FrameOffset, 110.0, UIData.PopupSize), 'Value', SyncData.FrameValue, 'Backgroundcolor', UIData.PopupColor, 'HorizontalAlignment', 'left', 'Visible', IconPageVisible, 'String', 'Invisible|Visible');
    % 447 459
    % 448 459
    % 449 459
    % 450 459
    % 451 459
    % 452 459
    % 453 459
    % 454 459
    % 455 459
    % 456 459
    % 457 459
    % 458 459
    uicontrol('Tag', IconPage, 'Style', 'text', 'horizontalalignment', 'right', 'Visible', IconPageVisible, 'Position', horzcat(145.0, minus(UIData.Height, 262.0), 140.0, UIData.RadioHeight), 'String', 'Icon transparency:');
    % 460 468
    % 461 468
    % 462 468
    % 463 468
    % 464 468
    % 465 468
    % 466 468
    % 467 468
    Data.IconPage.MaskOpaqueIconHandle = uicontrol('Tag', IconPage, 'Style', 'popup', 'Position', horzcat(290.0, UIData.OpaqueOffset, 110.0, UIData.PopupSize), 'Value', SyncData.OpaqueValue, 'Backgroundcolor', UIData.PopupColor, 'HorizontalAlignment', 'left', 'Visible', IconPageVisible, 'String', 'Transparent|Opaque');
    % 469 481
    % 470 481
    % 471 481
    % 472 481
    % 473 481
    % 474 481
    % 475 481
    % 476 481
    % 477 481
    % 478 481
    % 479 481
    % 480 481
    uicontrol('Tag', IconPage, 'Style', 'text', 'horizontalalignment', 'right', 'Position', horzcat(145.0, minus(UIData.Height, 292.0), 140.0, UIData.RadioHeight), 'Visible', IconPageVisible, 'String', 'Icon rotation:');
    % 482 489
    % 483 489
    % 484 489
    % 485 489
    % 486 489
    % 487 489
    % 488 489
    Data.IconPage.MaskRotateIconHandle = uicontrol('Tag', IconPage, 'Style', 'popup', 'Position', horzcat(290.0, UIData.RotateOffset, 110.0, UIData.PopupSize), 'Value', SyncData.RotateValue, 'Backgroundcolor', UIData.PopupColor, 'HorizontalAlignment', 'left', 'Visible', IconPageVisible, 'String', 'Fixed|Rotates');
    % 490 502
    % 491 502
    % 492 502
    % 493 502
    % 494 502
    % 495 502
    % 496 502
    % 497 502
    % 498 502
    % 499 502
    % 500 502
    % 501 502
    iconCoordsText = uicontrol('Tag', IconPage, 'Style', 'text', 'horizontalalignment', 'right', 'Position', horzcat(135.0, minus(UIData.Height, 322.0), 150.0, UIData.RadioHeight), 'Visible', IconPageVisible, 'String', 'Drawing coordinates:');
    % 503 510
    % 504 510
    % 505 510
    % 506 510
    % 507 510
    % 508 510
    % 509 510
    Data.IconPage.MaskDrawingCoordsHandle = uicontrol('Tag', IconPage, 'Style', 'popup', 'Position', horzcat(290.0, UIData.CoordsOffset, 110.0, UIData.PopupSize), 'Backgroundcolor', UIData.PopupColor, 'Value', SyncData.NormalValue, 'Visible', IconPageVisible, 'HorizontalAlignment', 'left', 'String', 'Pixel|Autoscale|Normalized');
    % 511 523
    % 512 523
    % 513 523
    % 514 523
    % 515 523
    % 516 523
    % 517 523
    % 518 523
    % 519 523
    % 520 523
    % 521 523
    % 522 523
    set(dlgHandle, 'UserData', Data);
end % function
