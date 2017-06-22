function oList = rgFindBlocks(objList, searchDepth, searchTerms)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(searchTerms)
        searchTerms = {};
    end % if
    % 13 14
    if isempty(searchDepth)
        depthCell = {};
    else
        depthCell = cellhorzcat('SearchDepth', searchDepth);
    end % if
    % 19 20
    oList = find_system(objList, depthCell{:}, 'RegExp', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', '\<block\>', searchTerms{:});
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    oList = strrep(oList, char(10.0), ' ');
end % function
