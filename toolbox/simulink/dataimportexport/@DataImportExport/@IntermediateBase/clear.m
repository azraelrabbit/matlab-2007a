function clear(hIntermediate)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    SourceObjects = hIntermediate.SourceObjects;
    % 12 14
    % 13 14
    hIntermediate.SourceObjects = [];
    hIntermediate.SourceObjectsID = [];
    hIntermediate.SourceObjectsRelationID = [];
    hIntermediate.SourceObjectsLastIndex = 0.0;
    hIntermediate.SourceObjectsProcessedFlag = [];
    hIntermediate.RelationIDMap = [];
    hIntermediate.RelationIDLastIndex = 0.0;
    % 21 23
    % 22 23
    for idx=1.0:length(SourceObjects)
        disconnect(SourceObjects(idx));
    end % for
    % 26 27
end % function
