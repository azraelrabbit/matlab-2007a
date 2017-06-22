function isOK = checkBlock(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    isOK = 0.0;
    try
        isOK = find_system(block);
        isOK = length(isOK);
        % 11 12
    end % try
    if isempty(isOK)
        isOK = 0.0;
    end % if
end % function
