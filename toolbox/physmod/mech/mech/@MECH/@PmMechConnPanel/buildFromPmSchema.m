function retStatus = buildFromPmSchema(hThis, pmSchema)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(strcmpi(pmSchema.ClassName, 'MECH.PmMechConnPanel'))
        error(-1.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 17 18
    if not(isfield(pmSchema, 'Parameters')) || not(isfield(pmSchema.Parameters, 'NumPortsParam')) || not(isfield(pmSchema.Parameters, 'PortSpinnerLabel')) || not(isfield(pmSchema.Parameters, 'BaseLabel')) || not(isfield(pmSchema.Parameters, 'FollowerLabel'))
        % 19 23
        % 20 23
        % 21 23
        % 22 23
        error(-2.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 27 28
    hThis.NumPortsParam = pmSchema.Parameters.NumPortsParam;
    hThis.PortSpinnerLabel = pmSchema.Parameters.PortSpinnerLabel;
    hThis.BaseLabel = pmSchema.Parameters.BaseLabel;
    hThis.FollowerLabel = pmSchema.Parameters.FollowerLabel;
    % 32 33
    retStatus = true;
end % function
