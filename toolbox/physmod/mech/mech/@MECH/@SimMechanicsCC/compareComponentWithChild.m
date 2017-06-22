function diffs = compareComponentWithChild(smc, child)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(strcmp(class(smc), class(child)))
        errMsg = horzcat('When comparing components, the component type must be the ', 'same for both components.  The component type ', 'for the first argument is "', class(smc), '", and the ', 'component type for the second argument is "', class(child), '".');
        % 13 16
        % 14 16
        % 15 16
        error(errMsg);
    end % if
    % 18 19
    diffs = {};
end % function
