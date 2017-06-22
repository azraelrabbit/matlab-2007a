function AttributeValue = getXMLNodeAttribute(hReader, hXML, AttributeName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    AttributeValue = [];
    % 9 11
    % 10 11
    if hXML.hasAttributes
        % 12 13
        Attributes = hXML.getAttributes;
        NumAttributes = Attributes.getLength;
        % 15 17
        % 16 17
        for idx=1.0:NumAttributes
            % 18 19
            CurrentAttribute = Attributes.item(minus(idx, 1.0));
            % 20 22
            % 21 22
            CurrentAttributeName = char(CurrentAttribute.getName);
            % 23 25
            % 24 25
            if strcmp(CurrentAttributeName, AttributeName)
                % 26 27
                AttributeValue = char(CurrentAttribute.getValue);
                break
            end % if
        end % for
    end % if
    % 32 33
end % function
