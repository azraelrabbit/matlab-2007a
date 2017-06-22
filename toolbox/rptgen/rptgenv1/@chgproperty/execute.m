function out = execute(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    objType = c.att.ObjectType;
    propName = getfield(c.att, horzcat(objType, 'Property'));
    % 8 10
    currObj = subsref(c.zhgmethods, substruct('.', objType));
    if not(isempty(currObj))
        % 11 13
        propTag = feval(horzcat('prop', lower(objType)), c, 'GetPropValue', currObj, propName);
        % 13 21
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        switch c.att.Render
        case 1.0
            out = propTag;
        case 2.0
            out = horzcat(sgmltag(horzcat(propName, ':')), propTag);
        case 3.0
            out = horzcat(set(sgmltag, 'data', propName, 'tag', 'emphasis'), propTag);
            % 27 31
            % 28 31
            % 29 31
        end % switch
    else
        out = '';
        status(c, sprintf('Warning - no %s found.', c.att.ObjectType), 2.0);
    end % if
end % function
