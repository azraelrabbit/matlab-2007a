function hList = getfigs(c)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    switch upper(c.att.LoopType)
    case 'ALL'
        allFigs = allchild(0.0);
        % 13 15
        if isfield(c.ref, 'RptgenTagList')
            badTags = c.ref.RptgenTagList;
        else
            i = getinfo(c);
            badTags = i.ref.RptgenTagList;
        end % if
        badList = FindFiguresWithTags(badTags, allFigs);
        % 21 23
        if c.att.isDataFigureOnly
            restrictionString = {'HandleVisibility','on','Visible','on'};
        else
            restrictionString = {'Visible','on'};
        end % if
        % 27 29
        foundList = findall(allFigs, 'flat', restrictionString{:});
        % 29 31
        hList = setdiff(foundList, badList);
    case 'CURRENT'
        % 32 34
        hList = get(0.0, 'CurrentFigure');
    case 'TAG'
        hList = sort(FindFiguresWithTags(c.att.TagList, allchild(0.0)));
    end % switch
function tFigs = FindFiguresWithTags(tagList, allFigs)
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    tFigs = [];
    % 44 46
    for i=1.0:length(tagList)
        tFigs = vertcat(tFigs, findall(allFigs, 'flat', 'tag', tagList{i}));
        % 47 49
    end % for
