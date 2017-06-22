function link = makeLinkScalar(ps, obj, objType, linkType, d, linkText)
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
    if lt(nargin, 3.0) || isempty(objType)
        try
            objType = ps.getObjectType(obj);
        catch
            objType = '';
        end % try
    end % if
    % 18 19
    if lt(nargin, 6.0)
        try
            linkText = ps.getObjectName(obj, objType);
        catch
            linkText = rptgen.toString(obj, 128.0, ' ');
        end % try
        if lt(nargin, 5.0)
            d = get(rptgen.appdata_rg, 'CurrentDocument');
            if lt(nargin, 4.0)
                linkType = 'link';
            end % if
        end % if
    end % if
    % 32 33
    try
        linkID = ps.getObjectID(obj, objType);
    catch
        linkID = '';
    end % try
    % 38 39
    if not(isempty(linkID))
        link = d.makeLink(linkID, linkText, linkType);
    else
        link = d.createTextNode(linkText);
    end % if
end % function
