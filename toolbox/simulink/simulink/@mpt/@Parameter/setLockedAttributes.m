function setLockedAttributes(hObjectHandle, propName, propValue)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    set(hObjectHandle, propName, propValue);
    set(hObjectHandle, horzcat(propName, 'Locked'), 0.0);
    return;
end % function
