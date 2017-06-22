function isScalar = isascalartype(portDims)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isequal(portDims, [1.0 1.0]) || isequal(portDims, [2.0 1.0 1.0]) || isequal(portDims, 0.0) || isequal(portDims, 1.0) || isequal(portDims, [0.0 0.0]) || isequal(portDims, [0.0 1.0]) || isequal(portDims, [1.0 0.0])
        % 8 15
        % 9 15
        % 10 15
        % 11 15
        % 12 15
        % 13 15
        % 14 15
        isScalar = true;
    else
        isScalar = false;
    end % if
end % function
