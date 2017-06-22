function h = CustomRTWInfoSignal(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = mpt.CustomRTWInfoSignal;
    % 9 11
    % 10 11
    h.CustomStorageClassListener;
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if gt(nargin, 0.0) && isa(varargin{1.0}, 'mpt.Signal')
        % 18 19
        h.hParentObject = varargin{1.0};
    else
        % 21 23
        % 22 23
    end % if
    % 24 25
end % function
