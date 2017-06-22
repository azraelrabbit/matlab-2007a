function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [obj, objType] = anchor_getObject(this);
    if isempty(obj)
        out = [];
        if isempty(objType)
            objType = this.anchor_getGenericType;
        end % if
        this.status(sprintf('No "%s" found for linking anchor', objType), 2.0);
        % 16 17
        return;
    end % if
    % 19 20
    ps = this.anchor_getPropSrc(obj, objType);
    % 21 22
    out = makeLinkScalar(ps, obj, objType, 'anchor', d, rptgen.parseExpressionText(this.LinkText));
    % 23 27
    % 24 27
    % 25 27
    % 26 27
end % function
