function ignoreValue = atIgnoreValue(this, objType, propName, propVal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    ignoreValue = false;
    if strcmpi(propName, 'label')
        ignoreValue = locStrcmp('?', propVal);
    else
        if strcmpi(objType, 'data')
            switch lower(propName)
            case {'datatype','units'}
                ignoreValue = locStrcmp('double', propVal);
            case 'range'
                ignoreValue = locStrcmp('[-inf inf]', propVal);
            case 'initvalue'
                ignoreValue = locStrcmp('0', propVal);
            end
        else
            if strcmpi(objType, 'machine')
                switch lower(propName)
                case 'creator'
                    ignoreValue = locStrcmp('Unknown', propVal);
                case 'version'
                    ignoreValue = locStrcmp('none', propVal);
                end
            end
        end
    end
end
function tf = locStrcmp(str1, str2)
    % 32 34
    tf = and(ischar(str2), strcmp(str1, str2));
end
