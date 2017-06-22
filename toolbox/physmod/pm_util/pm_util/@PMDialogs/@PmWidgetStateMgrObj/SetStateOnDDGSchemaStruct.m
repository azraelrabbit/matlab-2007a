function ddgSchema = SetStateOnDDGSchemaStruct(hThis, ddgSchema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    lPrepStateInfo(hThis);
    % 15 17
    ddgSchema = lNodeTraversal(hThis, ddgSchema);
    % 17 20
    % 18 20
    lCleanStateInfo(hThis);
    % 20 22
end
function hSchemaNode = lNodeTraversal(hThis, hSchemaNode)
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    [hSchemaNode, foundMatch] = lNodeVisitor(hThis, hSchemaNode);
    if eq(foundMatch, true)
        return
    end
    % 33 36
    % 34 36
    if ~(isfield(hSchemaNode, 'Items'))
        return
    end
    % 38 41
    % 39 41
    for idx=1.0:numel(hSchemaNode.Items)
        hSchemaNode.Items{idx} = lNodeTraversal(hThis, hSchemaNode.Items{idx});
    end % for
    % 43 45
end
function [hNode, foundMatch] = lNodeVisitor(hThis, hNode)
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    foundMatch = false;
    if ~(isfield(hNode, 'Tag'))
        return
    end
    % 55 57
    tagStr = hNode.Tag;
    if lFoundTagMatch(tagStr, hThis.workData.activeTags)
        foundMatch = true;
        actionValue = true;
    else
        if lFoundTagMatch(tagStr, hThis.workData.inactiveTags)
            foundMatch = true;
            actionValue = false;
        end
    end
    if eq(foundMatch, true)
        hNode.(hThis.workData.actionFld) = actionValue;
    end
end
function isFound = lFoundTagMatch(tagStr, tagLst)
    % 71 74
    % 72 74
    isFound = false;
    for idx=1.0:numel(tagLst)
        searchResults = strfind(tagStr, horzcat('.', tagLst{idx}, '.'));
        if ~(isempty(searchResults))
            isFound = true;
            return
        end
    end % for
end
function lPrepStateInfo(hThis)
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    switch hThis.ActionType
    case 'Visible'
        actionFldStr = 'Visible';
    case 'Enable'
        actionFldStr = 'Enabled';
    otherwise
        actionFldStr = 'Visible';
    end
    % 95 97
    hThis.workData.actionFld = actionFldStr;
    inactiveTags = {};
    % 98 100
    for idx=1.0:numel(hThis.StateList)
        % 100 102
        rawParamStrs = {};
        for paramIdx=1.0:numel(hThis.StateList{idx}.paramList)
            rawParamStrs = cellhorzcat(rawParamStrs{:}, hThis.StateList{idx}.paramList{paramIdx}, sprintf('%s_unit', hThis.StateList{idx}.paramList{paramIdx}), sprintf('%s_label', hThis.StateList{idx}.paramList{paramIdx}));
            % 104 110
            % 105 110
            % 106 110
            % 107 110
            % 108 110
        end % for
        % 110 112
        if eq(idx, hThis.CurrentState)
            hThis.workData.activeTags = rawParamStrs;
        else
            inactiveTags = union(inactiveTags, rawParamStrs);
        end
        % 116 118
    end % for
    % 118 121
    % 119 121
    hThis.workData.inactiveTags = setdiff(inactiveTags, hThis.workData.activeTags);
    % 121 123
end
function lCleanStateInfo(hThis)
    % 124 126
    hThis.workData = rmfield(hThis.workData, fieldnames(hThis.workData));
end
