function bList = sortBlocks(c, bList, sortBy)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isempty(bList)
        bList = {};
        return;
    end % if
    if lt(nargin, 3.0)
        sortBy = c.SortBy;
    end % if
    % 16 18
    switch sortBy
    case 'runtime'
        if iscell(bList)
            mdl = bdroot(bList{1.0});
        else
            mdl = bdroot(bList(1.0));
        end % if
        % 24 26
        simListHndl = locSortBlocks(mdl, true);
        if not(isempty(simListHndl))
            simList = {};
            for i=length(simListHndl):-1.0:1.0
                simList{i} = getfullname(simListHndl(i));
                % 30 32
            end % for
            % 32 34
            [sameBlocks, indexA, indexB] = intersect(simList, bList);
            bList = simList(sort(indexA));
        end % if
    case 'fullpathalpha'
        if iscell(bList)
            sysList = bList;
        else
            sysList = handles2names(bList);
        end % if
        [sysList, sysIndex] = sort(lower(sysList));
        bList = bList(sysIndex);
    case 'systemalpha'
        sysList = rptgen.safeGet(rptgen.safeGet(bList, 'Parent', 'get_param'), 'Name', 'get_param');
        % 46 51
        % 47 51
        % 48 51
        % 49 51
        [sysList, sysIndex] = sort(lower(sysList));
        bList = bList(sysIndex);
    case 'alphabetical'
        nameList = rptgen.safeGet(bList, 'Name', 'get_param');
        [nameList, nameIndex] = sort(lower(nameList));
        bList = bList(nameIndex);
    case 'blocktype'
        typeList = rptgen.safeGet(bList, 'BlockType', 'get_param');
        [sortedTypeList, sortIndex] = sort(typeList);
        bList = bList(sortIndex);
    case 'depth'
        depthList = getPropValue(rptgen_sl.propsrc_sl_blk, bList, 'Depth');
        % 62 65
        % 63 65
        okEntries = find(cellfun('isclass', depthList, 'double'));
        depthList = ctranspose(horzcat(depthList{okEntries}));
        bList = bList(okEntries);
        % 67 69
        [depthList, depthIndex] = sort(depthList);
        bList = bList(depthIndex);
    otherwise
        % 71 73
    end % switch
    % 73 75
    bList = bList(:);
function names = handles2names(handles)
    % 76 79
    % 77 79
    names = {};
    for i=length(handles):-1.0:1.0
        names{i} = getfullname(handles(i));
    end % for
function bList = locSortBlocks(sysName, isCompile)
    % 83 102
    % 84 102
    % 85 102
    % 86 102
    % 87 102
    % 88 102
    % 89 102
    % 90 102
    % 91 102
    % 92 102
    % 93 102
    % 94 102
    % 95 102
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    slErr = sllasterror;
    try
        bList = get_param(sysName, 'SortedList');
    catch
        % 105 108
        % 106 108
        simErr = sllasterror;
        sllasterror([]);
        sllasterror(slErr);
        bList = [];
        rptgen.displayMessage(simErr.Message, 2.0);
    end % try
