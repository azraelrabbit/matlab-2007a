function h = Resource(varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    h = RTWConfiguration.Resource;
    % 21 23
    % 22 23
    h.allocations = RTWConfiguration.Terminator;
    switch nargin
    case 0.0
    case 1.0
        % 27 29
        % 28 29
        h.resource = varargin{1.0};
    otherwise
        % 31 32
        warning('Invalid number of input arguments');
    end % switch
end % function
