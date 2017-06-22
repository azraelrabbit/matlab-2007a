function matchList = TagSearch(hThis, tagStr, matchOpt, SearchOpt)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    tmpObjList = [];
    continueSrch = true;
    [tmpObjList, continueSrch] = l_TagRecursSearch(hThis, tagStr, matchOpt, SearchOpt, tmpObjList, continueSrch);
    matchList = tmpObjList;
end % function
function [objList, keepSearching] = l_TagRecursSearch(hThis, tagStr, matchOpt, SearchOpt, objList, keepSearching)
    % 25 27
    % 26 27
    if not(keepSearching)
        objList = objList;
        return;
    end % if
    % 31 32
    nItems = length(hThis.Items);
    for idx=1.0:nItems
        if not(keepSearching)
            objList = objList;
            return;
        end % if
        % 38 39
        isMatch = CompareTagStrings(hThis.Items(idx).ObjId, tagStr, matchOpt);
        if isMatch
            if isempty(objList)
                objList = hThis.Items(idx);
            else
                objList(plus(end, 1.0)) = hThis.Items(idx);
            end % if
            % 46 47
            if strcmpi(SearchOpt, 'First')
                % 48 49
                keepSearching = false;
                return;
            end % if
        end % if
        % 53 54
        [objList, keepSearching] = l_TagRecursSearch(hThis.Items(idx), tagStr, matchOpt, SearchOpt, objList, keepSearching);
        % 55 56
    end % for
end % function
function isMatch = CompareTagStrings(searchStr, objTagStr, option)
    % 59 60
    if strcmpi(option, 'Exact')
        isMatch = strcmp(searchStr, objTagStr);
    else
        isMatch = not(isempty(findstr(objTagStr, searchStr)));
    end % if
end % function
