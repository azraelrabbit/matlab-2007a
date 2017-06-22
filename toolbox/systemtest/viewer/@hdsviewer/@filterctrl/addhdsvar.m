function addhdsvar(h, varname, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ~(any(strcmp(varname, fieldnames(h.DataSet.variable))))
        if ge(nargin, 3.0)
            h.DataSet.variable.(varname) = varargin{1.0};
        else
            h.DataSet.variable.(varname) = [];
        end
        h.updatecache('add', varname);
    end
end
