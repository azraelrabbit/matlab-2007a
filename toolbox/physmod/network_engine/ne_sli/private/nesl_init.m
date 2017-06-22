function nesl_init(model, errorQueue)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    nesl_activeconverter('clear', model);
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    implicitSolvers = {'ode15s','ode23t','ode14x','ode23t_experimental','ode15s_experimental'};
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    solver = get_param(model, 'Solver');
    % 22 23
    if not(nesl_explicitsolvers) && not(any(strcmp(solver, implicitSolvers)))
        nesl_error(errorQueue, model, 'network_engine:nesl_init:InvalidSolverChoice', solver);
        return;
    end % if
    % 27 28
    mode = get_param(model, 'SimulationMode');
    if not(strcmpi(mode, 'normal'))
        mode(1.0) = upper(mode(1.0));
        nesl_error(errorQueue, model, 'network_engine:nesl_init:InvalidSimulationMode', mode);
        return;
    end % if
    % 34 35
end % function
