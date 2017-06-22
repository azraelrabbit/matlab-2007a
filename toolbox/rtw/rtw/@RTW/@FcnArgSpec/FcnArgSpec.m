function h = FcnArgSpec(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h = RTW.FcnArgSpec;
    if eq(nargin, 8.0)
        h.SLObjectName = varargin{1.0};
        h.SLObjectType = varargin{2.0};
        h.Category = varargin{3.0};
        h.ArgName = varargin{4.0};
        if strcmp(h.Category, 'None')
            h.Position = 99999999.0;
        else
            h.Position = varargin{5.0};
        end % if
        % 20 21
        h.Qualifier = varargin{6.0};
        h.PortNum = varargin{7.0};
        h.RowID = varargin{8.0};
    end % if
end % function
