function h = getanalysisobject(hObj, tag, new, hPrm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 2.0)
        tag = get(hObj, 'Analysis');
    end
    if lt(nargin, 3.0)
        new = false;
    end
    if new
        h = [];
    else
        h = getcomponent(hObj, 'fvtool_tag', tag);
    end
    if isempty(h)
        info = get(hObj, 'AnalysesInfo');
        % 20 22
        if lt(nargin, 4.0)
            hPrm = get(hObj, 'Parameters');
            reuse = true;
        else
            reuse = false;
        end
        % 27 30
        % 28 30
        opts = cellhorzcat(hObj.Filters, hPrm);
        if iscell(info.(tag).fcn)
            h = feval(info.(tag).fcn{:}, opts{:});
        else
            h = feval(info.(tag).fcn, opts{:});
        end
        % 35 37
        oldprm = get(hObj, 'Parameters');
        allprm = union(getparameter(h, '-all'), oldprm);
        % 38 41
        % 39 41
        newprm = setdiff(allprm, oldprm);
        if ~(isempty(newprm))
            usedefault(newprm, 'fvtool');
        end
        if reuse
            set(hObj, 'Parameters', allprm);
        end
        % 47 49
        p = schema.prop(h, 'fvtool_tag', 'string');
        set(h, 'fvtool_tag', tag);
        set(p, 'Visible', 'Off');
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        if ~(new)
            addcomponent(hObj, h);
        end
    end
end
