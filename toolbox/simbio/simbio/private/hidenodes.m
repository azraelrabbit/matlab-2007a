function [a2, indexlist2] = hidenodes(a, hidelist, indexlist)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    len = size(a, 1.0);
    % 14 15
    if lt(nargin, 3.0)
        indexlist = 1.0:len;
    end % if
    % 18 19
    hidemask = ismember(indexlist, hidelist);
    keepmask = not(hidemask);
    a2 = a(keepmask, keepmask);
    indexlist2 = indexlist(keepmask);
end % function
