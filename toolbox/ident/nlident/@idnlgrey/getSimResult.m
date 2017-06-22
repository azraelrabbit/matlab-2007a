function [y, err, xfinal] = getSimResult(nlsys, data, x0, par)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    [n, ny, nu, ne] = size(data);
    % 28 31
    % 29 31
    nin = nargin;
    if lt(nin, 3.0) || isempty(x0)
        X = nlsys.InitialStates;
        x0 = cat(1.0, X.Value);
    end % if
    if gt(ne, 1.0) && eq(size(x0, 2.0), 1.0)
        x0 = repmat(x0, 1.0, ne);
    end % if
    % 38 41
    % 39 41
    if lt(nin, 4.0) || isempty(par)
        P = nlsys.Parameters;
        par = cellhorzcat(P.Value);
    end % if
    % 44 47
    % 45 47
    FileName = nlsys.FileName;
    FileArgument = nlsys.FileArgument;
    if isempty(FileArgument)
        FileArgument = {};
    end % if
    option = nlsys.Algorithm.SimulationOptions;
    if strcmpi(option.Solver, 'Auto')
        if gt(pvget(nlsys, 'Ts'), 0.0) || eq(nlsys.Order.nx, 0.0)
            option.Solver = 'FixedStepDiscrete';
        else
            option.Solver = 'ode45';
        end % if
    end % if
    % 59 62
    % 60 62
    option.InterSample = 'zoh';
    InterSample = pvget(data, 'InterSample');
    SamplingInstants = pvget(data, 'SamplingInstants');
    u = pvget(data, 'InputData');
    % 65 68
    % 66 68
    y = cell(1.0, ne);
    err = false(1.0, ne);
    % 69 72
    % 70 72
    if isempty(x0)
        x0 = zeros(0.0, ne);
    end % if
    xfinal = nan(size(x0));
    % 75 78
    % 76 78
    for k=1.0:ne
        % 78 81
        % 79 81
        if gt(nu, 0.0)
            option.InterSample = InterSample{k};
        end % if
        try
            [y{k}, x, err(k)] = slctrl_private(FileName, x0(:, k), option, horzcat(SamplingInstants{k}, u{k}), par(:), FileArgument);
            xfinal(:, k) = ctranspose(x(end, :));
        catch
            y{k} = nan(n(k), ny);
            err(k) = true;
            % 89 91
        end % try
        if err(k)
            warning('ident:idnlgrey:infeasiblesimulation', 'Model simulation infeasible for experiment %d. Check parameter values.', k);
            % 93 95
        end % if
    end % for
