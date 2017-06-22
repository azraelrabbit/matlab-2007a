function mech_update(sys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(nargin, 0.0)
        sys = gcs;
    end % if
    % 10 11
    sys = get_param(sys, 'Handle');
    % 12 13
    slsfnagctlr('Clear', get_param(sys, 'Name'), 'Simulink');
    lastErr = lasterr;
    lasterr('');
    try
        set_param(sys, 'SimulationCommand', 'Update');
    catch
        simerrors = sllastdiagnostic;
        if not(isempty(simerrors))
            for i=1.0:length(simerrors)
                slsfnagctlr('PushSimMsg', simerrors(i));
            end % for
            slsfnagctlr;
        end % if
    end % try
end % function
