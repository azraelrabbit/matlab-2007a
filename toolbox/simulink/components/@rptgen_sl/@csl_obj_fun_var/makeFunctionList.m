function fList = makeFunctionList(c, wList, vList)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(wList)
        fList = cell(0.0, 4.0);
        return;
    end % if
    % 11 13
    if lt(nargin, 2.0) || isempty(vList)
        % 13 16
        % 14 16
        filterStrings = {'on','off','auto','inf','held'};
    else
        % 17 19
        filterStrings = cellhorzcat('on', 'off', 'auto', 'inf', 'held', vList{:, 1.0});
    end % if
    % 20 22
    if not(c.ShowFixptFunctions)
        filterStrings = horzcat(filterStrings, {'sfix','ufix','sint','uint','sfrac','ufrac','float'});
        % 23 25
    end % if
    % 25 27
    [checkWords, aIndex, bIndex] = setxor(wList(:, 1.0), filterStrings);
    % 27 29
    fnIndex = [];
    % 29 31
    for i=1.0:length(aIndex)
        whichResult = which(wList{aIndex(i), 1.0});
        if strncmp(whichResult, 'built-in', 8.0)
            listInclude = true;
        else
            if isempty(whichResult) || strcmp(whichResult, 'variable')
                listInclude = false;
            else
                if strcmpi(whichResult(minus(end, 1.0):end), '.m') || strcmpi(whichResult(minus(end, 1.0):end), '.p')
                    listInclude = true;
                else
                    listInclude = false;
                end % if
                % 43 45
            end % if
        end % if
        if listInclude
            fnIndex = horzcat(fnIndex, aIndex(i));
        end % if
    end % for
    fList = wList(fnIndex, :);
end % function
