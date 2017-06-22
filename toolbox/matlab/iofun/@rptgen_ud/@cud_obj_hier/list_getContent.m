function currTree = list_getContent(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    c.RuntimePropSrc = hierGetPropSrc(c);
    % 9 11
    currObj = hierGetStartPoint(c);
    if (isempty(currObj)) | (~(ishandle(currObj)))
        c.status(sprintf('No current "%s" for hierarchy', c.RuntimePropSrc.getObjectType), 4.0);
        % 13 15
        currTree = [];
    else
        c.RuntimeDocument = d;
        currTree = {};
        for i=1.0:length(currObj)
            currTree = vertcat(currTree, hierGetContent(c, currObj(i)));
        end % for
        c.RuntimeDocument = [];
    end
    % 23 25
    c.RuntimePropSrc = [];
end
