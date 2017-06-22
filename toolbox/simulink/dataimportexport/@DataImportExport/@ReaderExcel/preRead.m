function preRead(hReader, hIntermediate, hCustomizer, Options)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    s_loadExcelFile(hReader);
    % 9 12
    % 10 12
    s_preprocessExcelSheets(hReader, hCustomizer);
    % 12 14
function s_loadExcelFile(hReader)
    % 14 30
    % 15 30
    % 16 30
    % 17 30
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    ReadOKFlag = hReader.verifyFileName();
    % 30 33
    % 31 33
    if ReadOKFlag
        % 33 35
        FileName = hReader.FileName;
        % 35 38
        % 36 38
        [FileType, SheetNames] = xlsfinfo(FileName);
        % 38 41
        % 39 41
        if not(isempty(FileType))
            % 41 43
            NumSheetNames = length(SheetNames);
            % 43 46
            % 44 46
            PageInput = cell(NumSheetNames, 1.0);
            PageDescription = struct('SheetName', SheetNames, 'ClassName', '', 'FunctionalType', '', 'PropertyColumns', [], 'IDColumns', [], 'RawInformationColumns', [], 'ArrayName', {''}, 'ArrayID', {''}, 'SourceID', {''});
            % 47 55
            % 48 55
            % 49 55
            % 50 55
            % 51 55
            % 52 55
            % 53 55
            for idx=1.0:NumSheetNames
                % 55 57
                [junkNum, junkText, PageInput{idx}] = xlsread(FileName, SheetNames{idx});
                % 57 59
            end % for
            % 59 62
            % 60 62
            hReader.PageInput = PageInput;
            hReader.PageDescription = PageDescription;
        else
            % 64 67
            % 65 67
            error('The file "%s" could not be loaded in Excel.', FileName);
        end % if
    end % if
    % 69 71
function s_preprocessExcelSheets(hReader, hCustomizer)
    % 71 85
    % 72 85
    % 73 85
    % 74 85
    % 75 85
    % 76 85
    % 77 85
    % 78 85
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    PageInput = hReader.PageInput;
    NumPages = length(PageInput);
    % 86 89
    % 87 89
    PageDescription = hReader.PageDescription;
    % 89 92
    % 90 92
    KeepPagesLogical = false(NumPages, 1.0);
    % 92 95
    % 93 95
    LayoutInfo = hReader.LayoutInfo;
    % 95 98
    % 96 98
    ArrayID = [];
    ArrayName = [];
    % 99 102
    % 100 102
    for idx=1.0:NumPages
        % 102 104
        CurrentPage = PageInput{idx};
        if ischar(CurrentPage)
            CurrentPage = cellhorzcat(CurrentPage);
        end % if
        CurrentPageDescription = PageDescription(idx);
        % 108 111
        % 109 111
        PageClass = CurrentPage(LayoutInfo.CLASS_ROW, LayoutInfo.CLASS_COLUMN);
        % 111 113
        if iscell(PageClass)
            PageClass = PageClass{1.0};
        end % if
        PageClass = s_applyClassTransforms(LayoutInfo, PageClass, hCustomizer);
        % 116 119
        % 117 119
        FunctionalType = hReader.getClassFunctionalType(PageClass);
        % 119 122
        % 120 122
        if not(isempty(FunctionalType))
            % 122 124
            KeepPagesLogical(idx) = true;
            % 124 127
            % 125 127
            CurrentPageDescription.ClassName = PageClass;
            CurrentPageDescription.FunctionalType = FunctionalType;
            % 128 131
            % 129 131
            [HeaderLabels, IDLabels] = s_getColumnHeaders(CurrentPage, CurrentPageDescription.SheetName, LayoutInfo);
            % 131 136
            % 132 136
            % 133 136
            % 134 136
            HeaderLabels = s_applyNameTransforms(LayoutInfo, PageClass, HeaderLabels, hCustomizer);
            % 136 140
            % 137 140
            % 138 140
            NumHeaderLabels = length(HeaderLabels);
            HeaderIndices = plus(plus(1.0:NumHeaderLabels, LayoutInfo.NAME_COLUMN_OFFSET), length(IDLabels));
            % 141 143
            PropertyColumns = s_getPropertyColumns(HeaderLabels, HeaderIndices);
            % 143 146
            % 144 146
            NumIDLabels = length(IDLabels);
            IDColumns.Names = IDLabels;
            IDColumns.Columns = 1.0:plus(NumIDLabels, LayoutInfo.NAME_COLUMN_OFFSET);
            % 148 151
            % 149 151
            CurrentPageDescription.PropertyColumns = PropertyColumns;
            CurrentPageDescription.IDColumns = IDColumns;
            % 152 155
            % 153 155
            [CurrentArrayName, CurrentArrayID, CurrentSourceID] = s_getArrayInfo(hReader, CurrentPage, IDLabels, LayoutInfo);
            % 155 159
            % 156 159
            % 157 159
            CurrentPageDescription.ArrayName = CurrentArrayName;
            CurrentPageDescription.ArrayID = CurrentArrayID;
            CurrentPageDescription.SourceID = CurrentSourceID;
            % 161 167
            % 162 167
            % 163 167
            % 164 167
            % 165 167
            CurrentPageDescription.RawInformationColumns = 1.0:plus(plus(NumHeaderLabels, NumIDLabels), LayoutInfo.NAME_COLUMN_OFFSET);
            % 167 172
            % 168 172
            % 169 172
            % 170 172
            PageDescription(idx) = CurrentPageDescription;
            % 172 176
            % 173 176
            % 174 176
            ArrayName = vertcat(ArrayName, CurrentArrayName);
            ArrayID = vertcat(ArrayID, horzcat(repmat(sum(double(KeepPagesLogical)), size(CurrentArrayID)), CurrentArrayID));
        else
            % 178 180
            % 179 182
            % 180 182
            ShowPageWarning = true;
            % 182 185
            % 183 185
            if not(ischar(PageClass))
                % 185 187
                if isequal(numel(CurrentPage), 1.0) && isnan(CurrentPage)
                    % 187 189
                    ShowPageWarning = false;
                end % if
            end % if
            % 191 194
            % 192 194
            if ShowPageWarning
                % 194 196
                warning('off', 'backtrace')
                warning('The sheet "%s" is not specified correctly and will be ignored.', CurrentPageDescription.SheetName);
                % 197 199
                warning('on', 'backtrace')
            end % if
        end % if
    end % for
    % 202 205
    % 203 205
    hReader.PageInput = PageInput(KeepPagesLogical);
    hReader.PageDescription = PageDescription(KeepPagesLogical);
    % 206 209
    % 207 209
    hReader.ArrayID = ArrayID;
    hReader.ArrayName = ArrayName;
    % 210 212
function [HeaderLabels, IDLabels] = s_getColumnHeaders(Page, SheetName, LayoutInfo)
    % 212 223
    % 213 223
    % 214 223
    % 215 223
    % 216 223
    % 217 223
    % 218 223
    % 219 223
    % 220 223
    % 221 223
    ColumnLabelIndex = plus([1.0 2.0], LayoutInfo.NAME_COLUMN_OFFSET);
    % 223 226
    % 224 226
    if le(max(ColumnLabelIndex), size(Page, 2.0))
        % 226 228
        FirstTwoColumnLabels = Page(LayoutInfo.HEADER_ROW, ColumnLabelIndex);
    else
        % 229 231
        % 230 233
        % 231 233
        FirstTwoColumnLabels = {'',''};
    end % if
    % 234 237
    % 235 237
    NameLabelColumn = strcmp('Name', FirstTwoColumnLabels);
    ValueLabelColumn = strcmp('Value', FirstTwoColumnLabels);
    % 238 241
    % 239 241
    if any(ValueLabelColumn) && any(NameLabelColumn)
        % 241 243
        IDLabels = FirstTwoColumnLabels(NameLabelColumn);
        HeaderLabels = FirstTwoColumnLabels(ValueLabelColumn);
    else
        % 245 248
        % 246 248
        SourceIDLabelColumn = strcmp('Source ID', FirstTwoColumnLabels);
        % 248 251
        % 249 251
        if any(SourceIDLabelColumn) && any(NameLabelColumn)
            % 251 253
            IDLabels = FirstTwoColumnLabels(or(NameLabelColumn, SourceIDLabelColumn));
            % 253 255
            HeaderLabels = Page(LayoutInfo.HEADER_ROW, plus(plus(1.0, length(IDLabels)), LayoutInfo.NAME_COLUMN_OFFSET):end);
        else
            % 256 258
            if any(NameLabelColumn)
                % 258 260
                IDLabels = FirstTwoColumnLabels(NameLabelColumn);
                HeaderLabels = Page(LayoutInfo.HEADER_ROW, plus(plus(1.0, length(IDLabels)), LayoutInfo.NAME_COLUMN_OFFSET):end);
            else
                % 262 264
                % 263 265
                error('The sheet "%s" has invalid header information.', SheetName);
            end % if
        end % if
        % 267 270
        % 268 270
    end % if
    HeaderLabels = strtrim(HeaderLabels);
    IDLabels = strtrim(IDLabels);
function PropertyColumns = s_getPropertyColumns(HeaderLabels, HeaderIndices)
    % 273 283
    % 274 283
    % 275 283
    % 276 283
    % 277 283
    % 278 283
    % 279 283
    % 280 283
    % 281 283
    NumHeaders = length(HeaderLabels);
    % 283 286
    % 284 286
    [TopPropNames, RemainderNames] = s_getTopPropName(HeaderLabels);
    % 286 289
    % 287 289
    UniquePropNames = unique(TopPropNames);
    UniquePropNames = UniquePropNames(not(cellfun(@isempty, UniquePropNames)));
    NumUniquePropNames = length(UniquePropNames);
    % 291 294
    % 292 294
    PropertyNames = UniquePropNames;
    % 294 297
    % 295 297
    Columns = NaN(NumUniquePropNames, 1.0);
    % 297 300
    % 298 300
    SubProperties = [];
    % 300 303
    % 301 303
    for idx=1.0:NumUniquePropNames
        % 303 305
        HeaderLocation = find(strcmp(UniquePropNames{idx}, HeaderLabels), 1.0);
        % 305 308
        % 306 308
        if any(HeaderLocation)
            % 308 310
            Columns(idx) = HeaderIndices(HeaderLocation);
        end % if
        % 311 314
        % 312 314
        CurrentPropLocation = strcmp(UniquePropNames{idx}, TopPropNames);
        % 314 317
        % 315 317
        SubHeaderLabels = RemainderNames(CurrentPropLocation);
        SubHeaderIndices = HeaderIndices(CurrentPropLocation);
        % 318 321
        % 319 321
        SubPropertiesStruct = s_getPropertyColumns(SubHeaderLabels, SubHeaderIndices);
        % 321 325
        % 322 325
        % 323 325
        if not(isempty(SubProperties))
            % 325 327
            SubProperties(idx) = SubPropertiesStruct;
        else
            % 328 331
            % 329 331
            SubProperties = SubPropertiesStruct;
        end % if
    end % for
    % 333 336
    % 334 336
    if not(isempty(PropertyNames))
        % 336 338
        PropertyNames = cellhorzcat(PropertyNames);
    else
        % 339 342
        % 340 342
        PropertyNames = [];
    end % if
    % 343 346
    % 344 346
    PropertyColumns = struct('Names', PropertyNames, 'Columns', Columns, 'SubProperties', SubProperties);
    % 346 351
    % 347 351
    % 348 351
    % 349 351
function [ArrayName, ArrayID, SourceID] = s_getArrayInfo(hReader, Page, IDLabels, LayoutInfo)
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
    NameColumn = plus(find(strcmp('Name', IDLabels)), LayoutInfo.NAME_COLUMN_OFFSET);
    % 362 366
    % 363 366
    % 364 366
    ArrayName = Page(LayoutInfo.OBJECT_START_ROW:end, NameColumn);
    ArrayID = ctranspose(LayoutInfo.OBJECT_START_ROW:size(Page, 1.0));
    % 367 370
    % 368 370
    SourceID = [];
    % 370 373
    % 371 373
    if not(isempty(ArrayName))
        % 373 375
        ValidNameRows = cellfun(@ischar, ArrayName);
        % 375 378
        % 376 378
        ArrayName = ArrayName(ValidNameRows);
        ArrayID = ArrayID(ValidNameRows);
        % 379 382
        % 380 382
        SourceIDColumn = plus(find(strcmp('Source ID', IDLabels)), LayoutInfo.NAME_COLUMN_OFFSET);
        % 382 386
        % 383 386
        % 384 386
        if not(isempty(SourceIDColumn))
            % 386 388
            SourceID = Page(LayoutInfo.OBJECT_START_ROW:end, SourceIDColumn);
            % 388 391
            % 389 391
            SourceID = SourceID(ValidNameRows);
        else
            % 392 397
            % 393 397
            % 394 397
            % 395 397
            SourceID = num2cell(minus(hReader.SourceObjectsLastIndex, 1.0:length(ArrayName)));
            % 397 401
            % 398 401
            % 399 401
            hReader.SourceObjectsLastIndex = SourceID{end};
        end % if
    end % if
    % 403 406
    % 404 406
function [TopNames, RemainderNames] = s_getTopPropName(Names)
    % 406 416
    % 407 416
    % 408 416
    % 409 416
    % 410 416
    % 411 416
    % 412 416
    % 413 416
    % 414 416
    NumNames = length(Names);
    % 416 419
    % 417 419
    TopNames = cell(NumNames, 1.0);
    RemainderNames = cell(NumNames, 1.0);
    % 420 423
    % 421 423
    for idx=1.0:length(Names)
        % 423 425
        CurrentName = Names{idx};
        % 425 428
        % 426 428
        PointIndex = find(eq('.', CurrentName));
        % 428 431
        % 429 431
        if not(isempty(PointIndex))
            % 431 433
            TopNames{idx} = CurrentName(1.0:minus(PointIndex, 1.0));
            RemainderNames{idx} = CurrentName(plus(PointIndex, 1.0):end);
        else
            % 435 438
            % 436 438
            TopNames{idx} = CurrentName;
            RemainderNames{idx} = '';
        end % if
    end % for
    % 441 444
    % 442 444
    TopNames = strtrim(TopNames);
    RemainderNames = strtrim(RemainderNames);
    % 445 447
function Class = s_applyClassTransforms(LayoutInfo, Class, hCustomizer)
    % 447 458
    % 448 458
    % 449 458
    % 450 458
    % 451 458
    % 452 458
    % 453 458
    % 454 458
    % 455 458
    % 456 458
    if not(isempty(hCustomizer))
        % 458 460
        ClassTransform = hCustomizer.getReverseClassTransform(Class);
        % 460 463
        % 461 463
        if not(isempty(ClassTransform))
            % 463 465
            Class = ClassTransform{1.0};
        end % if
    end % if
    % 467 469
function HeaderLabels = s_applyNameTransforms(LayoutInfo, Class, HeaderLabels, hCustomizer)
    % 469 480
    % 470 480
    % 471 480
    % 472 480
    % 473 480
    % 474 480
    % 475 480
    % 476 480
    % 477 480
    % 478 480
    if not(isempty(hCustomizer))
        % 480 482
        NameTransform = hCustomizer.getTransform(Class, 'Name');
        % 482 485
        % 483 485
        if not(isempty(NameTransform))
            % 485 487
            PropNamesNew = NameTransform{2.0};
            PropNamesOriginal = NameTransform{3.0};
            % 488 491
            % 489 491
            [junk, HeaderIndices, NameIndices] = intersect(HeaderLabels, PropNamesOriginal);
            % 491 498
            % 492 498
            % 493 498
            % 494 498
            % 495 498
            % 496 498
            HeaderLabels(HeaderIndices) = PropNamesNew(NameIndices);
        end % if
    end % if
    % 500 502
