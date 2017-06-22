function dataType = makeStringType(appendName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dataType = 'RGParsedString';
    % 7 9
    customString = findtype(dataType);
    if isempty(customString)
        customString = schema.UserType(dataType, 'String', @checkRgMlString);
    end
end
function ok = checkRgMlString(inValue)
    % 14 17
    % 15 17
    ok = logical(1);
end
