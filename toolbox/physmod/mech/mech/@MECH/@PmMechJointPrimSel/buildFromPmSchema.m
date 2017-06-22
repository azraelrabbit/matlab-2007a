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
    if not(strcmpi(pmSchema.ClassName, 'MECH.PmMechJointPrimSel'))
        error(-1.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 17 18
    if not(isfield(pmSchema, 'Parameters')) || not(isfield(pmSchema.Parameters, 'Label')) || not(isfield(pmSchema.Parameters, 'LabelAttrb')) || not(isfield(pmSchema.Parameters, 'WatchPort')) || not(isfield(pmSchema.Parameters, 'BlkParamName'))
        % 19 23
        % 20 23
        % 21 23
        % 22 23
        error(-2.0, xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 27 28
    hThis.Label = pmSchema.Parameters.Label;
    hThis.LabelAttrb = pmSchema.Parameters.LabelAttrb;
    hThis.BlkParamName = pmSchema.Parameters.BlkParamName;
    hThis.WatchPort = pmSchema.Parameters.WatchPort;
    % 32 33
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
end % function
