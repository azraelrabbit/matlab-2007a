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
    if not(strcmpi(pmSchema.ClassName, 'MECH.PmMechBranchBarPanel'))
        error(-1.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 17 18
    if not(isfield(pmSchema, 'Parameters')) || not(isfield(pmSchema.Parameters, 'PortSpinnerLabel'))
        % 19 20
        error(-2.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 24 25
    hThis.PortSpinnerLabel = pmSchema.Parameters.PortSpinnerLabel;
    % 26 27
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
end % function
