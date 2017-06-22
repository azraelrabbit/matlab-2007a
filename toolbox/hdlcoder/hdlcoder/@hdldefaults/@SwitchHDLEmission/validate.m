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
    v.MessageID = 'SwitchHDLEmission:validate';
    % 12 13
    bfp = hC.SimulinkHandle;
    % 14 15
    rto = get_param(bfp, 'runtimeobject');
    % 16 17
    threshloc = 0.0;
    for n=1.0:rto.NumRuntimePrms
        if strcmp(rto.RuntimePrm(n).Name, 'Threshold')
            threshloc = n;
        end % if
    end % for
    if eq(threshloc, 0.0)
        % 24 26
        % 25 26
        threshold = 0.0;
    else
        threshold = rto.RuntimePrm(threshloc).Data;
        if isempty(threshold)
            % 30 32
            % 31 32
            threshold = 0.0;
        end % if
        threshold = double(threshold);
    end % if
    % 36 39
    % 37 39
    % 38 39
    phan = get_param(bfp, 'PortHandles');
    sig1 = hC.InputPorts(1.0).getSignal;
    sig2 = hC.InputPorts(3.0).getSignal;
    ctrl = hC.InputPorts(2.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 44 46
    % 45 46
    sltype1 = hdlsignalsltype(sig1);
    vec1 = hdlsignalvector(sig1);
    sltype2 = hdlsignalsltype(sig2);
    vec2 = hdlsignalvector(sig2);
    sltypeout = hdlsignalsltype(out);
    vecout = hdlsignalvector(out);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    [size2, bp2, signed2] = hdlwordsize(sltype2);
    [sizeout, bpout, signedout] = hdlwordsize(sltypeout);
    % 55 56
    if not(isequal(size1, size2)) || not(isequal(size1, sizeout))
        v.Status = 1.0;
        v.Message = 'The two inputs and output of the switch block must be of equal size for HDL code generation.';
    end % if
    % 60 61
    if not(isequal(size(vec1), size(vec2))) || not(isequal(size(vec1), size(vecout)))
        v.Status = 1.0;
        v.Message = 'The two inputs and output of the switch block must be of equal dimensions for HDL code generation.';
    end % if
    % 65 66
    if ne(signed1, signed2) || ne(signed1, signedout)
        v.Status = 1.0;
        v.Message = 'The two inputs and output of the switch block must be of equal signs for HDL code generation.';
    end % if
    % 70 71
    isdouble = hdlsignalisdouble(horzcat(sig1, sig2, out));
    if any(eq(isdouble, true)) && any(eq(isdouble, false))
        v.Status = 1.0;
        v.Message = 'Illegal switch operation to/from double and fixed-point--operation not possible.';
    end % if
    % 76 79
    % 77 79
    % 78 79
    vecc = hdlsignalvector(ctrl);
    if all(eq(vecc, 0.0))
        vecc = 1.0;
    end % if
    vecc = max(vecc);
    % 84 86
    % 85 86
    vecthreshold = max(size(threshold));
    % 87 88
    if ne(vecthreshold, 1.0) && not(isequal(vecc, vecthreshold))
        % 89 90
        v.Status = 1.0;
        v.Message = 'Threshold setting and control signal input must be of equal size for HDL code generation.';
    end % if
end % function
