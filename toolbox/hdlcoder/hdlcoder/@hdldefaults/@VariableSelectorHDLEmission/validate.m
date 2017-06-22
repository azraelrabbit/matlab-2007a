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
    v.Message = 'Good';
    v.MessageID = 'VariableSelectorHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 15
    hasidxport = strcmpi(get_param(bfp, 'IdxMode'), 'Variable');
    hasfillvalues = strcmpi(get_param(bfp, 'FillMode'), 'on');
    % 17 18
    if hasidxport
        % 19 20
        sel = hC.InputPorts(end).getSignal;
        % 21 23
        % 22 23
        selsltype = hdlsignalsltype(sel);
        [selsize, selbp, selsigned] = hdlwordsize(selsltype);
        % 25 26
        if eq(selsize, 1.0) && not(hasfillvalues)
            % 27 28
            v.Status = 1.0;
            v.Message = 'Variable Selector block with a boolean select signal requires Fill values to be used.';
        end % if
    end % if
end % function
