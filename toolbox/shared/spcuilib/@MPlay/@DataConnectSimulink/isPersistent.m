function y = isPersistent(dcsObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    y = strcmpi(dcsObj.connectMode, 'persistent');
end % function
