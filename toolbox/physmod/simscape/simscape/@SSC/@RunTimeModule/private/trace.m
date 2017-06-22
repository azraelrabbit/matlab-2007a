function trace(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if doTrace
        % 7 8
        fn = ssc_private('ssc_trace');
        fn('SSC:RTM ', varargin{:});
        % 10 11
    end % if
end % function
