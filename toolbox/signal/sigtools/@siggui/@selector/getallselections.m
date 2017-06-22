function selections = getallselections(hSct)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    identifiers = get(hSct, 'Identifiers');
    selections = {};
    % 12 14
    % 13 14
    for i=1.0:length(identifiers)
        if iscell(identifiers{i})
            selections{i} = identifiers{i}{1.0};
        else
            selections{i} = identifiers{i};
        end % if
    end % for
end % function
