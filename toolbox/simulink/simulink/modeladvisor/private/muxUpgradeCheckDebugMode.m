function varargout = muxUpgradeCheckDebugMode(action, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent DEBUG_MODE;
    % 10 12
    varargout = {};
    % 12 14
    switch action
    case 'get'
        % 15 17
        if isempty(DEBUG_MODE)
            varargout{1.0} = false;
        else
            varargout{1.0} = DEBUG_MODE;
        end
    case 'set'
        % 22 24
        DEBUG_MODE = logical(varargin{1.0});
    otherwise
        % 25 27
        error('Unknown action.');
    end
end
