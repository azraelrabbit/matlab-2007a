function thisClass = singleton(obj)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    persistent thisClass_obj;
    % 16 18
    if doDebug
        munlock
    else
        mlock
    end
    % 22 24
    if eq(nargin, 1.0)
        thisClass_obj = obj;
        % 25 27
    end
    % 27 29
    thisClass = thisClass_obj;
end
