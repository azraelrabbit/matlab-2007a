function network = nesl_network(solver)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    solver = get_param(solver, 'Handle');
    % 14 15
    if not(strcmp(get_param(solver, 'SubClassName'), 'solver'))
        pm_error('network_engine:nesl_network:InvalidSolverBlock', getfullname(solver));
    end % if
    % 18 19
    set_param(bdroot(solver), 'SimulationCommand', 'update');
    % 20 21
    network = nesl_networkregistry(solver);
    % 22 23
end % function
