function this = CLI(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = hdlcoderprops.CLI;
    % 9 10
    if gt(nargin, 1.0)
        set(this, varargin{:});
    end % if
end % function
