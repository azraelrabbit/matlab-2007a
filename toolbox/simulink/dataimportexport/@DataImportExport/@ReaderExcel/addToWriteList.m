function addToWriteList(hWriter, hNode, Depth, Prefix, ListPosition)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    NewWriteList = [];
    % 13 15
    % 14 15
    for idx=1.0:length(hNode)
        % 16 17
        NewWriteList = vertcat(NewWriteList, cellhorzcat(hNode(idx), Depth, Prefix));
    end % for
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if strcmp(lower(ListPosition), 'prepend')
        % 27 28
        hWriter.WriteList = vertcat(NewWriteList, horzcat(hWriter.WriteList));
    else
        % 30 31
        hWriter.WriteList = vertcat(horzcat(hWriter.WriteList), NewWriteList);
    end % if
    % 33 34
end % function
