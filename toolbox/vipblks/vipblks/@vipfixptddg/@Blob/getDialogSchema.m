function dlgStruct = getDialogSchema(this, dummy)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    isOutFixpt = strncmp(this.outDT, 'Spe', 3.0);
    isConnFour = strncmp(this.conn, '4', 1.0);
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    MaxRowsInAnyTab = 9.0;
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    area = dspGetLeafWidgetBase('checkbox', 'Area', 'area', this, 'area');
    % 27 29
    area.RowSpan = [1.0 1.0];
    area.ColSpan = [1.0 1.0];
    % 30 33
    % 31 33
    centroid = dspGetLeafWidgetBase('checkbox', 'Centroid', 'centroid', this, 'centroid');
    % 33 35
    centroid.RowSpan = [2.0 2.0];
    centroid.ColSpan = [1.0 1.0];
    centroid.DialogRefresh = 1.0;
    if this.centroid
        % 38 40
        this.FixptDialog.DataTypeRows(3.0).Visible = 1.0;
    else
        this.FixptDialog.DataTypeRows(3.0).Visible = 0.0;
    end % if
    % 43 46
    % 44 46
    bBox = dspGetLeafWidgetBase('checkbox', 'Bounding box', 'bBox', this, 'bBox');
    bBox.RowSpan = [3.0 3.0];
    bBox.ColSpan = [1.0 1.0];
    % 48 51
    % 49 51
    majorAxis = dspGetLeafWidgetBase('checkbox', 'Major axis length', 'majorAxis', this, 'majorAxis');
    % 51 53
    majorAxis.RowSpan = [4.0 4.0];
    majorAxis.ColSpan = [1.0 1.0];
    % 54 56
    if isOutFixpt
        majorAxis.Enabled = 0.0;
    else
        majorAxis.Enabled = 1.0;
    end % if
    % 60 63
    % 61 63
    minorAxis = dspGetLeafWidgetBase('checkbox', 'Minor axis length', 'minorAxis', this, 'minorAxis');
    % 63 65
    minorAxis.RowSpan = [5.0 5.0];
    minorAxis.ColSpan = [1.0 1.0];
    % 66 68
    if isOutFixpt
        minorAxis.Enabled = 0.0;
    else
        minorAxis.Enabled = 1.0;
    end % if
    % 72 75
    % 73 75
    angle = dspGetLeafWidgetBase('checkbox', 'Orientation', 'angle', this, 'angle');
    % 75 77
    angle.ColSpan = [2.0 2.0];
    angle.RowSpan = [1.0 1.0];
    % 78 80
    if isOutFixpt
        angle.Enabled = 0.0;
    else
        angle.Enabled = 1.0;
    end % if
    % 84 87
    % 85 87
    eccentricity = dspGetLeafWidgetBase('checkbox', 'Eccentricity', 'eccentricity', this, 'eccentricity');
    % 87 89
    eccentricity.ColSpan = [2.0 2.0];
    eccentricity.RowSpan = [2.0 2.0];
    % 90 92
    if isOutFixpt
        eccentricity.Enabled = 0.0;
    else
        eccentricity.Enabled = 1.0;
    end % if
    % 96 99
    % 97 99
    equivDiameterSq = dspGetLeafWidgetBase('checkbox', 'Equivalent diameter squared', 'equivDiameterSq', this, 'equivDiameterSq');
    % 99 101
    equivDiameterSq.ColSpan = [2.0 2.0];
    equivDiameterSq.RowSpan = [3.0 3.0];
    equivDiameterSq.DialogRefresh = 1.0;
    if this.equivDiameterSq
        % 104 106
        this.FixptDialog.DataTypeRows(1.0).Visible = 1.0;
        % 106 108
        this.FixptDialog.DataTypeRows(4.0).Visible = 1.0;
    else
        this.FixptDialog.DataTypeRows(1.0).Visible = 0.0;
        this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
    end % if
    % 112 115
    % 113 115
    extent = dspGetLeafWidgetBase('checkbox', 'Extent', 'extent', this, 'extent');
    extent.ColSpan = [2.0 2.0];
    extent.RowSpan = [4.0 4.0];
    extent.DialogRefresh = 1.0;
    if this.extent
        % 119 121
        this.FixptDialog.DataTypeRows(5.0).Visible = 1.0;
    else
        this.FixptDialog.DataTypeRows(5.0).Visible = 0.0;
    end % if
    % 124 127
    % 125 127
    perimeter = dspGetLeafWidgetBase('checkbox', 'Perimeter', 'perimeter', this, 'perimeter');
    % 127 129
    perimeter.ColSpan = [2.0 2.0];
    perimeter.RowSpan = [5.0 5.0];
    perimeter.DialogRefresh = 1.0;
    if this.perimeter
        % 132 134
        this.FixptDialog.DataTypeRows(6.0).Visible = 1.0;
    else
        this.FixptDialog.DataTypeRows(6.0).Visible = 0.0;
    end % if
    % 137 140
    % 138 140
    outDT = dspGetLeafWidgetBase('combobox', 'Statistics output data type:', 'outDT', this, 'outDT');
    % 140 142
    outDT.Entries = ctranspose(set(this, 'outDT'));
    outDT.DialogRefresh = 1.0;
    outDT.ColSpan = [1.0 2.0];
    outDT.RowSpan = [6.0 6.0];
    % 145 148
    % 146 148
    dtypeMsg.Type = 'text';
    if isOutFixpt
        dtypeMsg.Name = 'Note:  Area and Bounding box outputs are data type int32. Major axis length, Minor axis length, Orientation and Eccentricity are not available in fixed-point mode.';
    else
        dtypeMsg.Name = 'Note:  Area and Bounding box outputs are data type int32.';
    end % if
    dtypeMsg.Tag = 'DTypeMsg';
    dtypeMsg.WordWrap = 1.0;
    dtypeMsg.ColSpan = [1.0 2.0];
    dtypeMsg.RowSpan = [7.0 7.0];
    % 157 160
    % 158 160
    statsGroup = dspGetContainerWidgetBase('group', 'Statistics', 'statsGroup');
    statsGroup.Items = dspTrimItemList(cellhorzcat(area, centroid, bBox, majorAxis, minorAxis, angle, eccentricity, equivDiameterSq, extent, perimeter, outDT, dtypeMsg));
    % 161 164
    % 162 164
    statsGroup.RowSpan = [1.0 1.0];
    statsGroup.ColSpan = [1.0 1.0];
    statsGroup.LayoutGrid = [7.0 2.0];
    statsGroup.Tag = 'statsGroup';
    % 167 174
    % 168 174
    % 169 174
    % 170 174
    % 171 174
    % 172 174
    conn = dspGetLeafWidgetBase('combobox', 'Connectivity:', 'conn', this, 'conn');
    % 174 176
    conn.Entries = ctranspose(set(this, 'conn'));
    conn.DialogRefresh = 1.0;
    % 177 180
    % 178 180
    isLabel = dspGetLeafWidgetBase('checkbox', 'Output label matrix', 'isLabel', this, 'isLabel');
    % 180 183
    % 181 183
    labelGroup = dspGetContainerWidgetBase('group', 'Label Parameters', 'labelGroup');
    labelGroup.Items = dspTrimItemList(cellhorzcat(conn, isLabel));
    % 184 186
    labelGroup.RowSpan = [2.0 2.0];
    labelGroup.ColSpan = [1.0 1.0];
    % 187 189
    labelGroup.Tag = 'labelGroup';
    % 189 193
    % 190 193
    % 191 193
    MainTabItems = cellhorzcat(statsGroup, labelGroup);
    % 193 199
    % 194 199
    % 195 199
    % 196 199
    % 197 199
    maxBlobs = dspGetLeafWidgetBase('edit', 'Maximum number of blobs:', 'maxBlobs', this, 'maxBlobs');
    % 199 203
    % 200 203
    % 201 203
    maxBlobs.RowSpan = [1.0 1.0];
    maxBlobs.ColSpan = [1.0 2.0];
    % 204 207
    % 205 207
    warnIfNumBlobsExceeded = dspGetLeafWidgetBase('checkbox', 'Warn if maximum number of blobs is exceeded', 'warnIfNumBlobsExceeded', this, 'warnIfNumBlobsExceeded');
    % 207 211
    % 208 211
    % 209 211
    warnIfNumBlobsExceeded.RowSpan = [2.0 2.0];
    warnIfNumBlobsExceeded.ColSpan = [1.0 2.0];
    % 212 215
    % 213 215
    isCount = dspGetLeafWidgetBase('checkbox', 'Output number of blobs found', 'isCount', this, 'isCount');
    % 215 217
    isCount.RowSpan = [3.0 3.0];
    isCount.ColSpan = [1.0 2.0];
    % 218 221
    % 219 221
    useMinArea = dspGetLeafWidgetBase('checkbox', 'Specify minimum blob area in pixels', 'useMinArea', this, 'useMinArea');
    % 221 223
    useMinArea.DialogRefresh = 1.0;
    useMinArea.RowSpan = [4.0 4.0];
    useMinArea.ColSpan = [1.0 1.0];
    % 225 228
    % 226 228
    minArea = dspGetLeafWidgetBase('edit', '', 'minArea', this, 'minArea');
    % 228 230
    minArea.RowSpan = [4.0 4.0];
    minArea.ColSpan = [2.0 2.0];
    % 231 233
    if this.useMinArea
        minArea.Visible = 1.0;
        minArea.Tunable = 1.0;
        useMinArea.Name = 'Specify minimum blob area in pixels:';
    else
        minArea.Visible = 0.0;
        minArea.Tunable = 0.0;
        useMinArea.Name = 'Specify minimum blob area in pixels';
    end % if
    % 241 244
    % 242 244
    useMaxArea = dspGetLeafWidgetBase('checkbox', 'Specify maximum blob area in pixels', 'useMaxArea', this, 'useMaxArea');
    % 244 246
    useMaxArea.RowSpan = [5.0 5.0];
    useMaxArea.ColSpan = [1.0 1.0];
    % 247 249
    useMaxArea.DialogRefresh = 1.0;
    % 249 252
    % 250 252
    maxArea = dspGetLeafWidgetBase('edit', '', 'maxArea', this, 'maxArea');
    % 252 254
    maxArea.RowSpan = [5.0 5.0];
    maxArea.ColSpan = [2.0 2.0];
    % 255 257
    if this.useMaxArea
        maxArea.Visible = 1.0;
        maxArea.Tunable = 1.0;
        useMaxArea.Name = 'Specify maximum blob area in pixels:';
    else
        maxArea.Visible = 0.0;
        maxArea.Tunable = 0.0;
        useMaxArea.Name = 'Specify maximum blob area in pixels';
    end % if
    % 265 268
    % 266 268
    excludeBorderBlob = dspGetLeafWidgetBase('checkbox', 'Exclude blobs touching image border', 'excludeBorderBlob', this, 'excludeBorderBlob');
    % 268 270
    excludeBorderBlob.RowSpan = [6.0 6.0];
    excludeBorderBlob.ColSpan = [1.0 2.0];
    % 271 274
    % 272 274
    isFill = dspGetLeafWidgetBase('checkbox', 'Fill empty spaces in outputs', 'isFill', this, 'isFill');
    % 274 276
    isFill.DialogRefresh = 1.0;
    % 276 278
    isFill.RowSpan = [7.0 7.0];
    isFill.ColSpan = [1.0 2.0];
    % 279 282
    % 280 282
    fillValues = dspGetLeafWidgetBase('edit', 'Fill values:', 'fillValues', this, 'fillValues');
    % 282 284
    fillValues.Entries = ctranspose(set(this, 'fillValues'));
    % 284 286
    fillValues.RowSpan = [8.0 8.0];
    fillValues.ColSpan = [1.0 2.0];
    % 287 289
    if this.isFill
        fillValues.Visible = 1.0;
    else
        fillValues.Visible = 0.0;
    end % if
    % 293 295
    blobParametersGroup = dspGetContainerWidgetBase('group', 'Parameters', 'blobParametersGroup');
    blobParametersGroup.Items = dspTrimItemList(cellhorzcat(maxBlobs, warnIfNumBlobsExceeded, isCount, useMinArea, minArea, useMaxArea, maxArea, excludeBorderBlob, isFill, fillValues));
    % 296 301
    % 297 301
    % 298 301
    % 299 301
    blobParametersGroup.LayoutGrid = horzcat(MaxRowsInAnyTab, 2.0);
    blobParametersGroup.RowStretch = horzcat(zeros(1.0, minus(MaxRowsInAnyTab, 1.0)), 1.0);
    blobParametersGroup.Tag = 'blobParametersGroup';
    % 303 308
    % 304 308
    % 305 308
    % 306 308
    BlobTabItems = cellhorzcat(blobParametersGroup);
    % 308 311
    % 309 311
    dlgStruct = this.getRootSchemaStruct({});
    % 311 314
    % 312 314
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.Items = MainTabItems;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0} = dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0};
    % 315 319
    % 316 319
    % 317 319
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items = BlobTabItems;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Name = 'Blob Properties';
    % 320 324
    % 321 324
    % 322 324
    emptyFixpt = dspGetLeafWidgetBase('text', sprintf(' When the Statistics output data type parameter is set to double or single,\n fixed-point parameters are not applicable.'), 'emptyFixpt', 0.0);
    % 324 329
    % 325 329
    % 326 329
    % 327 329
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items = cellhorzcat(emptyFixpt, dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{1.0});
    % 329 336
    % 330 336
    % 331 336
    % 332 336
    % 333 336
    % 334 336
    if any(strcmp(this.Root.SimulationStatus, {'running','paused'}))
        % 336 338
        dlgStruct = this.disableNontunables(dlgStruct);
    end % if
    % 339 345
    % 340 345
    % 341 345
    % 342 345
    % 343 345
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.LayoutGrid = [3.0 1.0];
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{1.0}.RowStretch = [0.0 0.0 1.0];
    % 346 348
    if isOutFixpt
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{1.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{2.0}.Visible = 1.0;
    else
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{1.0}.Visible = 1.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{2.0}.Visible = 0.0;
    end % if
    % 354 358
    % 355 358
    % 356 358
    if isConnFour
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{2.0}.Items{end}.Items{53.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{2.0}.Items{end}.Items{54.0}.Visible = 0.0;
        dlgStruct.Items{1.0}.Items{2.0}.Tabs{3.0}.Items{2.0}.Items{end}.Items{55.0}.Visible = 0.0;
    end % if
