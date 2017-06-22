function [hNode, Depth, Prefix] = getFromWriteList(hWriter)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    WriteListItem = hWriter.WriteList(1.0, :);
    % 9 11
    % 10 11
    hWriter.WriteList(1.0, :) = [];
    % 12 14
    % 13 14
    hNode = WriteListItem{1.0};
    Depth = WriteListItem{2.0};
    Prefix = WriteListItem{3.0};
    % 17 18
end % function
