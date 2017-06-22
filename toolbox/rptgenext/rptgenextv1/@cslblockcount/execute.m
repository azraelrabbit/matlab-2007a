function out = execute(c)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    parentLoop = getparentloop(c);
    % 8 10
    errMsg = '';
    fullNames = logical(0);
    switch parentLoop
    case 'Model'
        if strcmp(c.att.IncludeBlocks, 'all')
            mdlName = c.zslmethods.Model;
            if not(isempty(mdlName))
                bList = find_system(mdlName, 'type', 'block');
            else
                % 18 20
                bList = {};
            end
        else
            bList = c.zslmethods.ReportedBlockList;
        end
        fullNames = logical(1);
    case 'System'
        currSys = c.zslmethods.System;
        if not(isempty(currSys))
            bList = find_system(currSys, 'SearchDepth', 1.0, 'type', 'block');
            % 29 32
            % 30 32
            bList = setdiff(bList, currSys);
        else
            bList = {};
        end
        fullNames = logical(0);
    case 'Block'
        errMsg = 'Error - can not count blocktypes inside block loop';
        bList = {};
        fullNames = logical(0);
    case 'Signal'
        errMsg = 'Error - can not count blocktypes inside signal loop';
        bList = {};
        fullNames = logical(0);
    otherwise
        startModels = find_system('type', 'block_diagram', 'blockdiagramtype', 'model');
        % 46 48
        bList = find_system(startModels, 'type', 'block');
        % 48 50
        fullNames = logical(1);
    end
    % 51 53
    if not(isempty(errMsg))
        status(c, errMsg, 1.0)
        out = '';
        return
    else
        if isempty(bList)
            status(c, 'Warning - no blocks found for block count', 2.0);
            out = '';
            return
        end
    end
    allTypes = getparam(c.zslmethods, bList, 'blocktype');
    [uniqTypes, aIndex, bIndex] = unique(allTypes);
    % 65 67
    for i=length(uniqTypes):-1.0:1.0
        origIndex = find(eq(bIndex, bIndex(aIndex(i))));
        numTypes{i, 1.0} = length(origIndex);
        typeBlocks{i, 1.0} = bList(origIndex);
        % 70 80
        % 71 80
        % 72 80
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
    end % for
    % 80 82
    switch c.att.SortOrder
    case 'alpha'
        [sortedTypes, sortIndex] = sort(uniqTypes);
    case 'numblocks'
        [sortedNums, sortIndex] = sort(horzcat(numTypes{:}));
        % 86 88
        sortIndex = sortIndex(end:-1.0:1.0);
    otherwise
        sortIndex = 1.0:length(uniqTypes);
    end
    % 91 93
    tableCells = horzcat(vertcat({'BlockType'}, uniqTypes(sortIndex)), vertcat({'# of Occurrences'}, numTypes(sortIndex)));
    % 93 96
    % 94 96
    if c.att.isBlockName
        typeBlocks = typeBlocks(sortIndex);
        % 97 100
        % 98 100
        linkComp = c.rptcomponent.comps.cfrlink;
        linkComp.att.LinkType = 'Link';
        % 101 103
        listComp = c.rptcomponent.comps.cfrlist;
        listComp.att.ListStyle = 'SimpleList';
        % 104 107
        % 105 107
        colIndex = 3.0;
        for i=length(typeBlocks):-1.0:1.0
            bHandles = get_param(typeBlocks{i}, 'Handle');
            bHandles = horzcat(bHandles{:});
            % 110 112
            listCells = {};
            for j=length(bHandles):-1.0:1.0
                if fullNames
                    bName = getfullname(bHandles(j));
                else
                    bName = get_param(bHandles(j), 'Name');
                end
                % 118 120
                linkComp.att.LinkID = linkid(c.zslmethods, bHandles(j), 'blk');
                linkComp.att.LinkText = bName;
                % 121 123
                listCells{j} = runcomponent(linkComp, 0.0);
            end % for
            listComp.att.SourceCell = listCells;
            tableCells{plus(i, 1.0), colIndex} = runcomponent(listComp, 0.0);
            % 126 133
            % 127 133
            % 128 133
            % 129 133
            % 130 133
            % 131 133
        end % for
        tableCells{1.0, colIndex} = 'Block Names';
        % 134 136
        cWid = [2.0 1.0 4.0];
    else
        cWid = [3.0 1.0];
    end
    % 139 141
    tableComp = c.rptcomponent.comps.cfrcelltable;
    % 141 143
    att = tableComp.att;
    att.TableCells = tableCells;
    att.ColumnWidths = cWid;
    att.numHeaderRows = 1.0;
    att.TableTitle = c.att.TableTitle;
    tableComp.att = att;
    % 148 150
    out = runcomponent(tableComp, 0.0);
end
function sorted = LocSort(unsorted, SortOrder, InvertSort)
    % 152 155
    % 153 155
    if strcmp(SortOrder, 'numblocks')
        [sortVec, sortIndex] = sort(horzcat(unsorted.Count));
    else
        sortIndex = 1.0:length(unsorted);
    end
    % 159 161
    if InvertSort
        sortIndex = sortIndex(end:-1.0:1.0);
    end
    % 163 165
    sorted = unsorted(sortIndex);
end
