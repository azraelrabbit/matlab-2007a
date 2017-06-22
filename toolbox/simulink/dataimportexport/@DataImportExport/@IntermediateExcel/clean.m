function clean(hIntermediate)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    ArrayNodeList = hIntermediate.ArrayNodeList;
    % 11 13
    % 12 13
    hIntermediate.ArrayNodeList = [];
    hIntermediate.ArrayNodeListLastIndex = 0.0;
    % 15 17
    % 16 17
    for i=1.0:length(ArrayNodeList)
        disconnect(ArrayNodeList(i));
    end % for
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    hIntermediate.SourceObjectsProcessedFlag = false(size(hIntermediate.SourceObjectsProcessedFlag));
    % 26 28
    % 27 28
end % function
