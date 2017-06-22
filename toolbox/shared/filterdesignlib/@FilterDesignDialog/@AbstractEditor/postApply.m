function [b, str] = postApply(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    b = true;
    str = '';
    % 10 11
    send(this, 'DialogApplied', handle.EventData(this, 'DialogApplied'));
end % function
