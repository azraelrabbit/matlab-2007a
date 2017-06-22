function retVal = slfeature(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(nargin, 0.0)
        error('Not enough input arguments.');
    end % if
    % 12 14
    load_simulink
    % 14 16
    if eq(nargin, 1.0)
        % 16 18
        retVal = slInternal('slfeature', 'get', varargin{1.0});
    else
        if eq(nargin, 2.0)
            retVal = slInternal('slfeature', 'set', varargin{1.0}, varargin{2.0});
        else
            % 22 24
            error('Invalid call to slfeature');
        end % if
        % 25 27
    end % if
end % function
