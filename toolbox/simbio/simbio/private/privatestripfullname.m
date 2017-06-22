function [strippednames, modelnames] = privatestripfullname(fullnames)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if ischar(fullnames)
        fullnames = cellstr(fullnames);
    end % if
    fullnames = strtrim(fullnames);
    strippednames = cell(size(fullnames));
    modelnames = cell(size(fullnames));
    for c=1.0:length(fullnames)
        fn = fullnames{c};
        if strcmp(fn(end), ']')
            ind = strfind(fn, '[');
            strippednames{c} = fn(plus(ind(end), 1.0):minus(end, 1.0));
            modelnames{c} = fn(1.0:minus(ind(end), 2.0));
        else
            ind = strfind(fn, '.');
            strippednames{c} = fn(plus(ind(end), 1.0):end);
            modelnames{c} = fn(1.0:minus(ind(end), 1.0));
        end % if
    end % for
end % function
