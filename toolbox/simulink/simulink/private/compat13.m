function simOptions = compat13(solver, X0, V1_Options)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if lt(length(V1_Options), 6.0)
        V1_Options(plus(length(V1_Options), 1.0):6.0) = 0.0;
    end % if
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    V1_ID.RelTol = 1.0;
    % 33 36
    % 34 36
    % 35 36
    V1_ID.MaxStep = 3.0;
    V1_ID.NotUsed = 4.0;
    V1_ID.Trace = 5.0;
    V1_ID.Plot = 6.0;
    % 40 44
    % 41 44
    % 42 44
    % 43 44
    simOptions = simset('Solver', solver, 'InitialState', X0);
    % 45 46
    if ne(V1_Options(V1_ID.RelTol), 0.0)
        simOptions = simset(simOptions, 'RelTol', V1_Options(V1_ID.RelTol));
    end % if
    % 49 50
    if ne(V1_Options(V1_ID.MaxStep), 0.0)
        simOptions = simset(simOptions, 'MaxStep', V1_Options(V1_ID.MaxStep), 'FixedStep', V1_Options(V1_ID.MaxStep));
        % 52 53
    end % if
    % 54 55
    if ne(V1_Options(V1_ID.Trace), 0.0)
        simOptions = simset(simOptions, 'Trace', 'siminfo');
    end % if
end % function
