function h = Timeseries(varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    h = Simulink.Timeseries;
    if eq(nargin, 1.0) && isa(varargin{1.0}, 'timeseries')
        h.tsValue = varargin{1.0};
    else
        if eq(nargin, 1.0) && isa(varargin{1.0}, 'Simulink.Timeseries')
            h.tsValue = varargin{1.0}.tsValue;
        else
            h.tsValue = SimTimeseries(varargin{:});
        end % if
    end % if
end % function
