function out = execute(c, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    out = '';
    % 10 12
    switch lower(getContextType(rptgen_sl.appdata_sl, c, logical(0)))
    case 'model'
        if strcmp(c.IncludeBlocks, 'all')
            mdlName = get(rptgen_sl.appdata_sl, 'CurrentModel');
            if not(isempty(mdlName))
                bList = find_system(mdlName, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'block');
            else
                % 18 21
                % 19 21
                % 20 22
                c.status(xlate('No current model'), 2.0);
                return
            end
        else
            bList = get(rptgen_sl.appdata_sl, 'ReportedBlockList');
        end
    case 'system'
        currSys = get(rptgen_sl.appdata_sl, 'CurrentSystem');
        if not(isempty(currSys))
            bList = find_system(currSys, 'SearchDepth', 1.0, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'block');
            % 31 37
            % 32 37
            % 33 37
            % 34 37
            % 35 37
            bList = bList(2.0:end);
        else
            c.status(xlate('No current system'), 2.0);
            return
        end
    case 'block'
        c.status(xlate('Can not count blocktypes inside block loop'), 2.0);
        return
    case 'signal'
        c.status(xlate('Can not count blocktypes inside signal loop'), 2.0);
        return
    case 'annotation'
        c.status(xlate('Can not count blocktypes inside annotation loop'), 2.0);
        return
    case 'configset'
        c.status(xlate('Can not count blocktypes inside configuration set loop'), 2.0);
        return
    otherwise
        startModels = find_system('type', 'block_diagram', 'blockdiagramtype', 'model');
        % 55 57
        startModels = setdiff(startModels, {'temp_rptgen_model'});
        bList = find_system(startModels, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'type', 'block');
        % 58 62
        % 59 62
        % 60 62
    end
    % 62 64
    if isempty(bList)
        c.status('No blocks found', 2.0);
        return
    end
    % 67 69
    allTypes = rptgen.safeGet(bList, 'MaskType', 'get_param');
    emptyMask = cellfun('isempty', allTypes);
    emptyMaskIdx = find(emptyMask);
    if not(isempty(emptyMaskIdx))
        allTypes(emptyMaskIdx) = rptgen.safeGet(bList(emptyMaskIdx), 'BlockType', 'get_param');
    end
    maskIdx = find(not(emptyMask));
    if not(isempty(maskIdx))
        allTypes(maskIdx) = strcat(allTypes(maskIdx), ' (m)');
    end
    % 78 81
    % 79 81
    [uniqTypes, aIndex, bIndex] = unique(allTypes);
    % 81 83
    for i=length(uniqTypes):-1.0:1.0
        origIndex = find(eq(bIndex, bIndex(aIndex(i))));
        numTypes{i, 1.0} = length(origIndex);
        typeBlocks{i, 1.0} = bList(origIndex);
    end % for
    % 87 89
    switch c.SortOrder
    case 'alpha'
        [sortedTypes, sortIndex] = sort(uniqTypes);
    case 'numblocks'
        [sortedNums, sortIndex] = sort(horzcat(numTypes{:}));
        % 93 95
        sortIndex = sortIndex(end:-1.0:1.0);
    otherwise
        sortIndex = 1.0:length(uniqTypes);
    end
    % 98 100
    tableCells = horzcat(vertcat(cellhorzcat(xlate('BlockType')), uniqTypes(sortIndex)), vertcat(cellhorzcat(xlate('Count')), numTypes(sortIndex)));
    % 100 103
    % 101 103
    r = rptgen.appdata_rg;
    psSL = rptgen_sl.propsrc_sl;
    if c.isBlockName
        typeBlocks = typeBlocks(sortIndex);
        % 106 109
        % 107 109
        colIndex = 3.0;
        tableCells{1.0, colIndex} = xlate('Block Names');
        % 110 112
        for i=length(typeBlocks):-1.0:1.0
            tableCells{plus(i, 1.0), colIndex} = psSL.makeLink(typeBlocks{i}, '', 'link', d, '', ', ');
            % 113 115
        end % for
        cWid = [2.0 1.0 4.0];
    else
        cWid = [3.0 1.0];
    end
    % 119 121
    if c.IncludeTotal
        tableCells(plus(end, 1.0), 1.0:2.0) = cellhorzcat(xlate('Total'), length(bList));
        footerCount = 1.0;
    else
        footerCount = 0.0;
    end
    % 126 129
    % 127 129
    tm = makeNodeTable(d, tableCells, 0.0, true);
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    tm.setColWidths(cWid);
    tm.setNumHeadRows(1.0);
    tm.setNumFootRows(footerCount);
    tm.setTitle(rptgen.parseExpressionText(c.TableTitle));
    % 137 139
    out = tm.createTable;
end
