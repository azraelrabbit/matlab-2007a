function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    obj = c.name_getObject;
    oType = rptgen.capitalizeFirst(c.name_getGenericType);
    % 10 12
    if isempty(obj)
        out = '';
        c.status(sprintf('No current "%s" object', oType), 2.0);
        % 14 16
        return;
    end % if
    % 17 19
    ps = c.name_getPropSrc;
    oName = c.name_getName(ps, obj, oType, d);
    % 20 22
    switch c.RenderAs
    case 'n'
        out = oName;
        return;
    case 't-n'
        oType = horzcat(oType, ' - ');
    case 't:n'
        oType = horzcat(oType, ': ');
    otherwise
        oType = horzcat(oType, ' ');
    end % switch
    % 32 34
    out = createDocumentFragment(d, oType, oName);
