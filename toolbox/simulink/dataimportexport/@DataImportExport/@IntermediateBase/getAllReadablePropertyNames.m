function AllReadablePropertyNames = getAllReadablePropertyNames(hObject, UDDObject)
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
    AllReadablePropertyNames = [];
    % 15 18
    % 16 18
    hClassUDDObject = classhandle(UDDObject);
    % 18 21
    % 19 21
    PropertyNames = get(hClassUDDObject.Properties, 'Name');
    % 21 24
    % 22 24
    if not(isempty(PropertyNames))
        % 24 26
        AccessFlags = get(hClassUDDObject.Properties, 'AccessFlags');
        if iscell(AccessFlags)
            AccessFlags = horzcat(AccessFlags{:});
        end % if
        VisibilityFlag = get(hClassUDDObject.Properties, 'Visible');
        % 30 33
        % 31 33
        PublicGetFlag = ctranspose(cellhorzcat(AccessFlags.PublicGet));
        % 33 36
        % 34 36
        ReadableFlag = and(strcmp(VisibilityFlag, 'on'), strcmp(PublicGetFlag, 'on'));
        % 36 40
        % 37 40
        % 38 40
        PropertyNames = cellstr(PropertyNames);
        % 40 43
        % 41 43
        AllReadablePropertyNames = PropertyNames(ReadableFlag);
    end % if
    % 44 47
    % 45 47
end % function
