function obj = MPlayEvent(hSrc, eventName, data)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    obj = MPlay.MPlayEvent(hSrc, eventName);
    % 13 15
    % 14 15
    if gt(nargin, 2.0)
        obj.Data = data;
    end % if
end % function
