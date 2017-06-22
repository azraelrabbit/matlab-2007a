function variableName = getVariableName(this, variableName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        variableName = 'Hfilt';
    end % if
    % 11 12
    w = evalin('base', 'whos');
    % 13 14
    allNames = cellhorzcat(w.name);
    % 15 17
    % 16 17
    if any(strcmpi(variableName, allNames))
        % 18 20
        % 19 20
        allNames = allNames(strncmpi(variableName, allNames, length(variableName)));
        % 21 22
        numPost = getPostFix(variableName, allNames);
        variableName = sprintf('%s%d', variableName, numPost);
    end % if
end % function
function numPost = getPostFix(variableName, allNames)
    % 27 29
    % 28 29
    if eq(length(allNames), 1.0)
        numPost = 2.0;
        return;
    end % if
    % 33 34
    allNames = strrep(allNames, variableName, '');
    allNums = [];
    for indx=1.0:length(allNames)
        allNums = horzcat(allNums, str2num(allNames{indx}));
    end % for
    % 39 40
    indx = find(ne(diff(allNums), 1.0), 1.0);
    if isempty(indx)
        if isempty(allNums)
            numPost = 2.0;
        else
            numPost = plus(max(allNums), 1.0);
        end % if
    else
        numPost = plus(allNums(indx), 1.0);
    end % if
end % function
