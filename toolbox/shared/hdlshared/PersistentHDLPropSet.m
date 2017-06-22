function varargout = PersistentHDLPropSet(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent hdl_parameters;
    % 8 10
    if eq(nargin, 1.0)
        hdl_parameters = varargin{1.0};
        varargout = {};
    else
        varargout = cellhorzcat(hdl_parameters);
    end
end
