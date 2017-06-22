function [a2, indexlist2] = splitnodes(a, splitlist, indexlist)
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
    a2 = a;
    indexlist2 = indexlist;
    % 21 22
    if isempty(splitlist)
        return;
    end % if
    % 25 27
    % 26 27
    splitmask = ismember(indexlist, splitlist);
    splitlist = find(splitmask);
    keepmask = not(splitmask);
    % 30 32
    % 31 32
    nSplitNodes = full(plus(sum(sum(a(:, splitlist))), sum(sum(a(splitlist, :)))));
    % 33 34
    if eq(nSplitNodes, 0.0)
        return;
    end % if
    % 37 40
    % 38 40
    % 39 40
    ix = [];
    % 41 43
    % 42 43
    a2(plus(end, nSplitNodes), plus(end, nSplitNodes)) = 0.0;
    % 44 45
    ctr = 1.0;
    for i=1.0:length(splitlist)
        % 47 48
        colFnd = find(a2(:, splitlist(i)));
        for j=1.0:length(colFnd)
            % 50 51
            a2(colFnd(j), splitlist(i)) = 0.0;
            a2(colFnd(j), plus(len, ctr)) = 1.0;
            ix = horzcat(ix, splitlist(i));
            ctr = plus(ctr, 1.0);
        end % for
        % 56 57
        rowFnd = find(a2(splitlist(i), :));
        for j=1.0:length(rowFnd)
            a2(splitlist(i), rowFnd(j)) = 0.0;
            a2(plus(len, ctr), rowFnd(j)) = 1.0;
            ix = horzcat(ix, splitlist(i));
            ctr = plus(ctr, 1.0);
        end % for
        % 64 65
    end % for
    % 66 70
    % 67 70
    % 68 70
    % 69 70
    keeplist = find(keepmask);
    % 71 72
    ixA = horzcat(keeplist, plus(len, 1.0:nSplitNodes));
    ixB = horzcat(keeplist, ix);
    % 74 75
    indexlist2 = indexlist(ixB);
    a2 = a2(ixA, ixA);
end % function
