function retStatus = GenerateTagLists(hThis)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    allTags = lGetDialogTags(hThis.hDialog);
    % 9 11
    nStates = numel(hThis.StateList);
    for idx=1.0:nStates
        hThis.StateList{idx}.tagList = lGetStateTags(hThis.StateList{idx}.paramList, allTags);
        % 13 15
    end % for
    % 15 17
    retStatus = true;
    % 17 19
function tagList = lGetDialogTags(hDialog)
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    hIMWidgets = DAStudio.imDialog.getIMWidgets(hDialog);
    % 25 27
    hToolObj = find(hIMWidgets);
    if isempty(hToolObj)
        error('Failed to get DAStudio.Tool object handle.');
    end % if
    % 30 33
    % 31 33
    tagList = get(hToolObj(2.0:end), 'Tag');
function retTags = lGetStateTags(paramList, allTags)
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    nParams = numel(paramList);
    retTags = {};
    for idx=1.0:nParams
        paramStrs = cellhorzcat(paramList{idx}, sprintf('%s_unit', paramList{idx}), sprintf('%s_label', paramList{idx}));
        % 44 48
        % 45 48
        % 46 48
        for tagIdx=1.0:numel(paramStrs)
            retVal = lTagSearch(allTags, paramStrs{tagIdx});
            retTags = cellhorzcat(retTags{:}, retVal{:});
        end % for
    end % for
function tags = lTagSearch(allTags, partialTagStr)
    % 53 56
    % 54 56
    searchResults = strfind(allTags, horzcat('.', partialTagStr, '.'));
    tags = {};
    for idx=1.0:numel(searchResults)
        if not(isempty(searchResults{idx}))
            tags = cellhorzcat(tags{:}, allTags{idx});
        end % if
    end % for
