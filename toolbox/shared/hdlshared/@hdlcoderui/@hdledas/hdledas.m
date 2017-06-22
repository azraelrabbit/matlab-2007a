function this = hdledas(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = hdlcoderui.hdledas;
    this.SubComponentName = 'EDA Tool Scripts';
    if eq(nargin, 1.0) && isa(varargin{1.0}, 'hdlcoderprops.CLI')
        this.CLIProperties = varargin{1.0};
    end % if
end % function
