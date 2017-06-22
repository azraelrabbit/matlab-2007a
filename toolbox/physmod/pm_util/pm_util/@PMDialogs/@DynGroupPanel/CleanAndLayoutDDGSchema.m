function retSchema = CleanAndLayoutDDGSchema(hThis, hNode, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    if not(isempty(varargin)) && numel(varargin) && ischar(varargin{1.0})
        layoutHint = varargin{1.0};
    else
        layoutHint = [];
    end
    % 28 31
    % 29 31
    scaleUpCols = 100.0;
    % 31 34
    % 32 34
    schema = lScaleColsDownToLeaves(hNode, scaleUpCols);
    % 34 37
    % 35 37
    retSchema = lMapAndBurstDdgContainers(schema, layoutHint);
    % 37 40
    % 38 40
    if iscell(retSchema)
        retSchema = horzcat(retSchema{:});
    end
end
function schema = lScaleColsDownToLeaves(hNode, nNewCols)
    % 44 47
    % 45 47
    if not(lIsContainer(hNode))
        schema = hNode;
        return
    end
    % 50 52
    origColSpan = hNode.ColSpan;
    origLayoutGrid = hNode.LayoutGrid;
    % 53 56
    % 54 56
    hNode.LayoutGrid(2.0) = nNewCols;
    if isfield(hNode, 'ColStretch')
        hNode.ColStretch = zeros(nNewCols);
        hNode.ColStretch(1.0) = .5;
        hNode.ColStretch(nNewCols) = .5;
    end
    % 61 64
    % 62 64
    origNodeWidth = origLayoutGrid(2.0);
    % 64 66
    hNode.Items = lSortKidsLeftToRight(hNode.Items);
    % 66 68
    nItems = numel(hNode.Items);
    for idx=1.0:nItems
        hItem = hNode.Items{idx};
        if not(isfield(hItem, 'ColSpan'))
            hItem.ColSpan = [1.0 1.0];
        end
        srcSpan = hItem.ColSpan;
        % 74 76
        origItemWidth = plus(minus(srcSpan(2.0), srcSpan(1.0)), 1.0);
        newItemWidth = floor(mtimes(mrdivide(origItemWidth, origNodeWidth), nNewCols));
        % 77 79
        if eq(srcSpan(1.0), 1.0)
            startCol = 1.0;
        else
            startCol = ceil(mtimes(mrdivide(minus(srcSpan(1.0), 1.0), origNodeWidth), nNewCols));
            prevIdx = minus(idx, 1.0);
            if gt(idx, 1.0) && le(startCol, hNode.Items{prevIdx}.ColSpan(2.0))
                startCol = plus(hNode.Items{prevIdx}.ColSpan(2.0), 1.0);
            end
        end
        % 87 89
        endCol = minus(plus(startCol, newItemWidth), 1.0);
        if gt(endCol, nNewCols)
            endCol = nNewCols;
        end
        % 92 94
        hItem.ColSpan = horzcat(startCol, endCol);
        if lIsContainer(hItem)
            hItem = lScaleColsDownToLeaves(hItem, newItemWidth);
        end
        % 97 99
        hNode.Items{idx} = hItem;
    end % for
    % 100 102
    schema = hNode;
end
function retItems = lMapAndBurstDdgContainers(hNodeItem, layoutHint)
    % 104 108
    % 105 108
    % 106 108
    retItems = {};
    % 108 111
    % 109 111
    if lIsWidget(hNodeItem)
        retItems = cellhorzcat(hNodeItem);
        return
    end
    % 114 116
    nKids = numel(hNodeItem.Items);
    % 116 119
    % 117 119
    for idx=1.0:nKids
        newLst = lMapAndBurstDdgContainers(hNodeItem.Items{idx}, layoutHint);
        retItems = cellhorzcat(retItems{:}, newLst{:});
    end % for
    % 122 126
    % 123 126
    % 124 126
    if not(lItemIsBurstable(hNodeItem))
        hNodeItem.Items = retItems;
        % 127 129
        hNodeItem = lAdjustLayout(hNodeItem, layoutHint);
        if not(iscell(hNodeItem))
            retItems = cellhorzcat(hNodeItem);
        else
            retItems = hNodeItem;
        end
        return
    end
    % 136 138
    nItems = numel(retItems);
    parentGridCols = hNodeItem.LayoutGrid(2.0);
    parentColSpan = hNodeItem.ColSpan;
    parentRowSpan = hNodeItem.RowSpan;
    parentSpanWidth = plus(minus(hNodeItem.ColSpan(2.0), hNodeItem.ColSpan(1.0)), 1.0);
    % 142 145
    % 143 145
    for idx=1.0:nItems
        hItem = retItems{idx};
        srcSpan = hItem.ColSpan;
        % 147 149
        origItemWidth = plus(minus(srcSpan(2.0), srcSpan(1.0)), 1.0);
        newItemWidth = floor(mtimes(mrdivide(origItemWidth, parentGridCols), parentSpanWidth));
        % 150 152
        if eq(srcSpan(1.0), 1.0)
            startCol = parentColSpan(1.0);
        else
            startCol = plus(parentColSpan(1.0), ceil(mtimes(mrdivide(minus(srcSpan(1.0), 1.0), parentGridCols), parentSpanWidth)));
            prevIdx = minus(idx, 1.0);
            if gt(idx, 1.0) && le(startCol, retItems{prevIdx}.ColSpan(2.0))
                startCol = plus(retItems{prevIdx}.ColSpan(2.0), 1.0);
            end
        end
        % 160 162
        endCol = minus(plus(startCol, newItemWidth), 1.0);
        if gt(endCol, parentColSpan(2.0))
            endCol = parentColSpan(2.0);
        end
        % 165 167
        hItem.ColSpan = horzcat(startCol, endCol);
        hItem.RowSpan = parentRowSpan;
        % 168 170
        retItems{idx} = hItem;
    end % for
    % 171 173
    if not(iscell(retItems))
        retItems = cellhorzcat(retItems)
    end
    % 175 177
end
function retStatus = lIsWidget(item)
    % 178 180
    typeList = {'pushbutton','radiobutton','combobox','checkbox','listbox','table','edit','editarea','text','image','hyperlink','textbrowser'};
    % 180 183
    % 181 183
    retStatus = any(strcmpi(item.Type, typeList));
end
function retStatus = lIsContainer(item)
    % 185 187
    typeList = {'panel','group','toggelpanel','tab'};
    retStatus = any(strcmpi(item.Type, typeList));
end
function retStatus = lItemIsBurstable(item)
    % 190 192
    retStatus = any(strcmpi(item.Type, {'panel'}));
end
function sortLst = lSortKidsLeftToRight(locKids)
    % 194 196
    nKids = numel(locKids);
    if not(nKids)
        sortLst = [];
        return
    end
    % 200 202
    sortLst = locKids(1.0);
    for idx=2.0:nKids
        itemAdded = false;
        for retIdx=1.0:numel(sortLst)
            if lt(locKids{idx}.ColSpan(1.0), sortLst{retIdx}.ColSpan(1.0))
                swpItem = sortLst{retIdx};
                sortLst{retIdx} = locKids{idx};
                for tmpIdx=plus(retIdx, 1.0):numel(sortLst)
                    swpItem2 = sortLst{tmpIdx};
                    sortLst{tmpIdx} = swpItem;
                    swpItem = swpItem2;
                end % for
                sortLst{plus(numel(sortLst), 1.0)} = swpItem;
                itemAdded = true;
                break
            end
        end % for
        if not(itemAdded)
            sortLst{plus(end, 1.0)} = locKids{idx};
        end
    end % for
end
function hRetNodeItem = lAdjustLayout(hNodeItem, layoutHint)
    % 224 226
    if isempty(layoutHint)
        hRetNodeItem = hNodeItem;
        return
    end
    % 229 231
    switch layoutHint
    case 'Unset'
        hRetNodeItem = hNodeItem;
        return
    case {'1ColLayout','2ColLayout','3ColLayout'}
    otherwise
        % 236 238
        error('DynGroupPanel:Render:UnsupportedLayoutHint', 'Layout Type not handled, ignored: ''%s''.', layoutHint);
        % 238 240
        return
    end
    % 241 243
    nRows = hNodeItem.LayoutGrid(1.0);
    nCols = hNodeItem.LayoutGrid(2.0);
    nItems = numel(hNodeItem.Items);
    % 245 247
    for rowIdx=1.0:nRows
        rowItemIndexes = [];
        % 248 250
        for idx=1.0:nItems
            if eq(hNodeItem.Items{idx}.RowSpan(1.0), rowIdx) && eq(hNodeItem.Items{idx}.RowSpan(2.0), rowIdx)
                % 251 253
                rowItemIndexes = horzcat(rowItemIndexes, idx);
            end
        end % for
        % 255 257
        numRowItems = numel(rowItemIndexes);
        if lt(numRowItems, 1.0)
            continue;
        end
        % 260 262
        switch layoutHint
        case '1ColLayout'
            if lt(numRowItems, 2.0)
                continue;
            end
            hNodeItem.Items{rowItemIndexes(1.0)}.ColSpan(1.0) = 1.0;
            hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0) = nCols;
        case '2ColLayout'
            % 269 271
            numRowItems = numel(rowItemIndexes);
            if lt(numRowItems, 2.0)
                continue;
            end
            % 274 276
            nLeftItems = floor(mrdivide(numRowItems, 2.0));
            % 276 280
            % 277 280
            % 278 280
            hNodeItem.Items{rowItemIndexes(nLeftItems)}.ColSpan(2.0) = floor(mrdivide(nCols, 2.0));
            hNodeItem.Items{rowItemIndexes(plus(nLeftItems, 1.0))}.ColSpan(1.0) = plus(floor(mrdivide(nCols, 2.0)), 1.0);
            % 281 283
            lastCol = hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0);
            if lt(abs(mrdivide(minus(lastCol, nCols), nCols)), 3.0)
                hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0) = nCols;
            end
            % 286 288
            lastCol = hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0);
            if lt(abs(mrdivide(minus(lastCol, nCols), nCols)), .03)
                hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0) = nCols;
            end
        case '3ColLayout'
            % 292 294
            numRowItems = numel(rowItemIndexes);
            if lt(numRowItems, 2.0)
                continue;
            end
            % 297 301
            % 298 301
            % 299 301
            hNodeItem.Items{rowItemIndexes(1.0)}.ColSpan(2.0) = floor(mrdivide(nCols, 3.0));
            hNodeItem.Items{rowItemIndexes(2.0)}.ColSpan(1.0) = plus(floor(mrdivide(nCols, 3.0)), 1.0);
            % 302 304
            lastCol = hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0);
            if lt(abs(mrdivide(minus(lastCol, nCols), nCols)), .03)
                hNodeItem.Items{rowItemIndexes(numRowItems)}.ColSpan(2.0) = nCols;
            end
        end
    end % for
    hRetNodeItem = hNodeItem;
end
