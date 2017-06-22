function postWrite(hWriter, hIntermediate, hCustomizer, Options)
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
    WriteOKFlag = hWriter.verifyFileName();
    % 12 14
    % 13 14
    if WriteOKFlag
        % 15 16
        FileName = hWriter.FileName;
        % 17 19
        % 18 19
        s_writeRelationsNode(hWriter, hIntermediate.RelationIDMap);
        % 20 22
        % 21 22
        xmlwrite(hWriter.FileName, hWriter.DocNode);
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        % 27 28
    end % if
    % 29 30
end % function
function s_writeRelationsNode(hWriter, RelationIDMap)
    % 32 45
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    hXML = hWriter.DocNode;
    % 46 48
    % 47 48
    hRelationsNode = hWriter.RelationsNode;
    % 49 51
    % 50 51
    for idx=1.0:size(RelationIDMap, 1.0)
        % 52 53
        RelationMapRelatives = RelationIDMap{idx, 2.0};
        % 54 56
        % 55 56
        if not(isempty(RelationMapRelatives))
            % 57 58
            hRelationsElement = hXML.createElement('relation');
            % 59 61
            % 60 61
            hRelationsNode.appendChild(hRelationsElement);
            % 62 64
            % 63 64
            hRelationsElement.setAttribute('matlab.id', RelationIDMap{idx, 1.0});
            % 65 67
            % 66 67
            TextValue = sprintf('%s ', RelationMapRelatives{:});
            % 68 70
            % 69 70
            hValueNode = hXML.createTextNode(TextValue);
            hRelationsElement.appendChild(hValueNode);
        end % if
    end % for
    % 74 75
end % function
