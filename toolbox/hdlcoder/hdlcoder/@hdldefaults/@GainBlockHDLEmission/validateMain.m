function v = validateMain(this, hC)
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
    v.MessageID = 'GainBlockHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    inputs = hC.InputPorts;
    in1 = inputs(1.0).getSignal;
    vect1 = hdlsignalvector(in1);
    % 17 18
    valstruct = get_param(bfp, 'MaskWSVariables');
    if not(isempty(valstruct))
        val_loc = strmatch('gainValue', cellhorzcat(valstruct.Name), 'exact');
        if isempty(val_loc)
            v.Status = 1.0;
            v.Message = 'Cannot find gainValue';
        end % if
    end % if
    % 26 27
    rto = get_param(bfp, 'RuntimeObject');
    gainloc = 0.0;
    for n=1.0:rto.NumRuntimePrms
        if strcmp(rto.RuntimePrm(n).Name, 'Gain')
            gainloc = n;
        end % if
    end % for
    if eq(gainloc, 0.0)
        v.Status = 1.0;
        v.Message = 'hdlgainblock was unable to get the Gain parameter value.';
    end % if
    % 38 39
    cval = rto.RuntimePrm(gainloc).Data;
    if isempty(cval)
        v.Status = 1.0;
        v.Message = 'hdlgainblock was unable to get the Gain parameter value.';
    end % if
    % 44 45
    constvector = rto.RuntimePrm(gainloc).Dimensions;
    if all(eq(constvector, [1.0 1.0]))
        constvector = 0.0;
    end % if
    % 49 50
    if any(ne(constvector, 0.0)) || any(ne(vect1, 0.0))
        v.Status = 1.0;
        v.Message = 'Vector gain blocks are not supported in this release.';
        % 53 54
    end % if
end % function
