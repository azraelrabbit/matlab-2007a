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
    if not(strcmpi(this.OperatingMode, 'matlab'))
        % 12 14
        % 13 14
        captureState(this);
        % 15 18
        % 16 18
        % 17 18
        set(this, 'LastAppliedFilter', []);
    end % if
    % 20 21
    send(this, 'DialogApplied', handle.EventData(this, 'DialogApplied'));
end % function
