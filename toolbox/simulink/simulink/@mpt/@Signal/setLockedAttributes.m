function setLockedAttributes(hObjectHandle, propName, propValue)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    set(hObjectHandle, propName, propValue);
    set(hObjectHandle, horzcat(propName, 'Locked'), 0.0);
    return;
end % function
