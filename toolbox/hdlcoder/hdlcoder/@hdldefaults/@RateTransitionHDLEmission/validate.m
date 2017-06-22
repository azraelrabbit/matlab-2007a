function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    v.Status = 0.0;
    v.Message = '';
    v.MessageID = 'RateTransitionHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 16
    % 15 16
    dintegrity_on = strcmpi(get_param(bfp, 'Integrity'), 'on');
    ddtransfer_on = strcmpi(get_param(bfp, 'deterministic'), 'on');
    % 18 19
    if not(dintegrity_on) || not(ddtransfer_on)
        % 20 21
        v.Status = 1.0;
        v.Message = 'Rate Transition block is supported only if both Data Integrity and Deterministic Data Transfer are ensured.';
        % 23 24
    end % if
end % function
