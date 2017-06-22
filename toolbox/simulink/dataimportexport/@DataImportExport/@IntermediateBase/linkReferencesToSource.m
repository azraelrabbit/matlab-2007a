function linkReferencesToSource(hObject)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ArrayNodeList = hObject.ArrayNodeList;
    % 10 12
    % 11 12
    if isempty(ArrayNodeList)
        return;
    end % if
    % 15 17
    % 16 17
    SourceID = cellstr(get(ArrayNodeList, 'SourceID'));
    ReferenceLogical = strcmp(cellstr(get(ArrayNodeList, 'ArrayType')), 'Reference');
    % 19 22
    % 20 22
    % 21 22
    ReferenceIndex = find(ReferenceLogical);
    % 23 25
    % 24 25
    if not(isempty(ReferenceIndex))
        % 26 33
        % 27 33
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
        SourceIndex = find(and(not(ReferenceLogical), not(cellfun(@isempty, SourceID))));
        % 34 36
        % 35 36
        SourceIDSubList = SourceID(SourceIndex);
        % 37 43
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        % 42 43
        for i=1.0:length(ReferenceIndex)
            % 44 45
            SubIndex = find(strcmp(SourceID{ReferenceIndex(i)}, SourceIDSubList));
            % 46 54
            % 47 54
            % 48 54
            % 49 54
            % 50 54
            % 51 54
            % 52 54
            % 53 54
            hObject.ArrayNodeList(ReferenceIndex(i)).SourceChild = hObject.ArrayNodeList(SourceIndex(SubIndex));
            % 55 56
        end % for
    end % if
    % 58 59
end % function
