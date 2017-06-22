function [qindx, dindx] = getindexoffilts(hFVT)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    G = get(hFVT, 'Filters');
    % 9 10
    if isempty(G)
        qindx = [];
        dindx = [];
    else
        [qindx, dindx] = getfiltindx(G);
    end % if
end % function
