function [a2, indexlist2] = spannodes(a, spanlist, indexlist)
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
    % 14 15
    len = size(a, 1.0);
    % 16 17
    if lt(nargin, 3.0)
        indexlist = 1.0:len;
    end % if
    % 20 21
    a2 = a;
    indexlist2 = indexlist;
    % 23 24
    if isempty(spanlist)
        return;
    end % if
    % 27 29
    % 28 29
    spanmask = ismember(indexlist, spanlist);
    spanlist = find(spanmask);
    keeplist = find(not(spanmask));
    % 32 33
    for i=1.0:length(spanlist)
        % 34 35
        toList = find(a2(:, spanlist(i)));
        for j=1.0:length(toList)
            a2(toList(j), :) = plus(a2(toList(j), :), a2(spanlist(i), :));
        end % for
    end % for
    % 40 41
    a2 = times(a2(keeplist, keeplist), minus(1.0, eye(length(keeplist))));
    a2 = sign(a2);
    indexlist2 = indexlist2(keeplist);
end % function
