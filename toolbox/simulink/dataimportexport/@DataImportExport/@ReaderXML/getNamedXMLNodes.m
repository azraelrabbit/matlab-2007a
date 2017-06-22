function XMLNodes = getNamedXMLNodes(hReader, hXML, NodeNames)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    XMLNodes = [];
    % 9 11
    % 10 11
    if hXML.hasChildNodes
        % 12 13
        ChildrenNodes = hXML.getChildNodes;
        NumChildNodes = ChildrenNodes.getLength;
        % 15 17
        % 16 17
        for idx=1.0:NumChildNodes
            % 18 19
            CurrentChild = ChildrenNodes.item(minus(idx, 1.0));
            % 20 22
            % 21 22
            CurrentChildNodeName = char(CurrentChild.getNodeName);
            % 23 25
            % 24 25
            if any(strcmp(CurrentChildNodeName, NodeNames))
                % 26 27
                XMLNodes = vertcat(XMLNodes, cellhorzcat(CurrentChild));
            end % if
        end % for
    end % if
    % 31 32
end % function
