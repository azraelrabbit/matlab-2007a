function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    status = 0.0;
    msg = '';
    % 9 11
    bfp = hC.SimulinkHandle;
    % 11 13
    if strcmp(this.block, 'built-in/MinMax')
        modestring = get_param(bfp, 'Function');
        fcn_string = 'Value';
    else
        if strcmp(this.Blocks, 'dspstat3/Minimum')
            modestring = 'min';
            fcn_string = get_param(bfp, 'fcn');
        else
            if strcmp(this.Blocks, 'dspstat3/Maximum')
                modestring = 'max';
                fcn_string = get_param(bfp, 'fcn');
            else
                modestring = 'unknown';
                fcn_string = 'unknown';
            end % if
        end % if
    end % if
    if any(strcmpi(modestring, {'min','max'}))
        if strcmpi(fcn_string, 'Running')
            status = 1.0;
            msg = 'This block function mode for hdlminmaxblock is not supported';
        end % if
    else
        status = 1.0;
        msg = 'This block mode for hdlminmaxblock is not supported';
    end % if
    if gt(length(hC.OutputPorts), 1.0) && strcmpi(hdlsignalsltype(hC.OutputPort(2.0).getSignal), 'double')
        status = 1.0;
        msg = 'The cascade implementation of Min/Max does not support double-precision Index output ports.  Please select another implementation architecture.';
    end % if
    if gt(length(hC.InputPorts), 1.0)
        status = 1.0;
        msg = 'MinMax block with cascade implementation requires a single vector as input.';
    end % if
    v.Status = status;
    v.Message = msg;
    v.MessageID = 'MinMaxCascadeHDLEmission:validate';
end % function
