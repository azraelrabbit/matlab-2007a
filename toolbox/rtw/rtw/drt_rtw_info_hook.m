function varargout = drt_rtw_info_hook(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Action = varargin{1.0};
    modelName = varargin{2.0};
    % 11 12
    switch Action
    case 'wordlengths'
        % 14 15
        varargout{1.0} = rtwhostwordlengths(modelName);
    case 'cImplementation'
        % 17 19
        % 18 19
        varargout{1.0} = rtw_host_implementation_props(modelName);
    otherwise
        % 21 23
        % 22 23
        varargout = [];
        % 24 25
    end % switch
end % function
