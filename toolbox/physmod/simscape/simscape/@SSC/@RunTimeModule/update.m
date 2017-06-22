function canDo = update(event, blockDiagram)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    canDo = true;
    switch lower(event)
    case 'pre-activate'
    case 'activate'
        rtm = SSC.RunTimeModule;
        rtm.canPerformOperation(blockDiagram, 'CCC_ACTIVATE');
    case 'deactivate'
        rtm = SSC.RunTimeModule;
        rtm.canPerformOperation(blockDiagram, 'CCC_DEACTIVATE');
    otherwise
        % 33 34
    end % switch
end % function
