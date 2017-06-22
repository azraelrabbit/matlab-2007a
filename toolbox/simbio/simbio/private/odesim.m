function [t, x] = odesim(ode, mobj, simobj, cs)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    ODEData = get(mobj, 'ODESimulationData');
    % 16 18
    solver = cs.SolverOptions;
    absTol = solver.AbsoluteTolerance;
    relTol = solver.RelativeTol;
    % 20 22
    options = odeset('AbsTol', absTol, 'RelTol', relTol, 'OutputFcn', @loggercallback);
    % 22 26
    % 23 26
    % 24 26
    if not(isempty(ODEData.jpattern))
        options = odeset(options, 'JPattern', sparse(ODEData.jpattern));
    end % if
    % 28 30
    if ODEData.DAE
        options = odeset(options, 'Mass', ODEData.Mass, 'MassSingular', 'yes', 'OutputFcn', @loggercallback);
        % 31 35
        % 32 35
        % 33 35
    end % if
    % 35 37
    if not(isempty(solver.MaxStep))
        options = odeset(options, 'MaxStep', solver.MaxStep);
        % 38 40
    end % if
    % 40 43
    % 41 43
    if ne(solver.InitialStep, -1.0)
        options = odeset(options, 'InitialStep', solver.InitialStep);
    end % if
    % 45 48
    % 46 48
    if ne(solver.Refine, -1.0)
        options = odeset(options, 'Refine', solver.Refine);
    end % if
    % 50 53
    % 51 53
    options = odeset(options, 'BDF', solver.BDF);
    % 53 56
    % 54 56
    options = odeset(options, 'MaxOrder', solver.MaxOrder);
    % 56 59
    % 57 59
    options = odeset(options, 'Stats', solver.Stats);
    % 59 62
    % 60 62
    options = odeset(options, 'NormControl', solver.NormControl);
    % 62 64
    if isempty(cs.SolverOptions.TSpan)
        if strcmpi(cs.StopTimeType, 'simulationtime')
            if eq(cs.StopTime, Inf)
                tspan = horzcat(0.0, sqrt(1.7976931348623157e+308));
            else
                tspan = horzcat(0.0, cs.StopTime);
            end % if
        else
            tspan = horzcat(0.0, sqrt(1.7976931348623157e+308));
        end % if
    else
        tspan = cs.SolverOptions.TSpan;
    end % if
    % 76 79
    % 77 79
    try
        % 79 81
        [t, x] = feval(ode, @sbioodefile, tspan, ODEData.X0, options, mobj, struct(ODEData), simobj, cs);
    catch
        rethrow(lasterror);
    end % try
end % function
