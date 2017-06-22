function h = Target(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h = RTWConfiguration.Target;
    % 10 12
    % 11 12
    h.inactiveList = RTWConfiguration.ListHead;
    h.connect(h.inactiveList, 'down');
    % 14 15
    switch nargin
    case 0.0
    case 2.0
        % 18 19
        switch varargin{1.0}
        case 'new'
            h.activeList = RTWConfiguration.ListHead;
            h.connect(h.activeList, 'down');
            h.block = varargin{2.0};
        otherwise
            error('1st argument must be ''new'' ');
        end % switch
    otherwise
        error('Target constructor requires 2 arguments. See help for constructor');
    end % switch
    % 30 32
    % 31 32
    h.registered_blocks = {};
end % function
