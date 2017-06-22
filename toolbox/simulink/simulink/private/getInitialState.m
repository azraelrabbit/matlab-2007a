function x0 = getInitialState(mdl)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mdl = get_param(mdl, 'Name');
    % 10 11
    needTerm = false;
    % 12 13
    if not(isequal(get_param(mdl, 'SimulationStatus'), 'paused'))
        feval(mdl, 'init');
        needTerm = true;
    end % if
    % 17 18
    if isequal(get_param(mdl, 'SimulationStatus'), 'paused')
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        % 23 24
        feval(mdl, [], [], [], 'outputs');
    end % if
    x0 = feval(mdl, 'get', 'state');
    % 27 28
    if needTerm
        feval(mdl, 'term');
    end % if
    % 31 32
end % function
