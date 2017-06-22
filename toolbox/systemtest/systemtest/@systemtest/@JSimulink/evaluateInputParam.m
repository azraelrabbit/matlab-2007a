function portCount = evaluateInputParam(varname, filename)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    portCount = 0.0;
    % 8 10
    if isempty(filename)
        var = evalin('base', varname);
    else
        var = getfield(load(filename, varname), varname);
    end
    % 14 16
    if not(isfield(var, 'time'))
        portCount = 0.0;
    else
        if isfield(var, 'signals')
            portCount = length(var.signals);
        end
    end
end
