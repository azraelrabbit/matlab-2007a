function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('RTWConfiguration');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'ListHead');
    % 14 17
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'down', 'handle');
    hThisProp.getFunction = @getDown;
end % function
function downProp = getDown(listHead, downProp)
    % 21 22
    downProp = feval(@down, listHead);
    if isempty(downProp)
        downProp = RTWConfiguration.Terminator;
    end % if
end % function
