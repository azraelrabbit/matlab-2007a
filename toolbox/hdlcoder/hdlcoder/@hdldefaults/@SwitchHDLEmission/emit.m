function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 9
    bfp = hC.SimulinkHandle;
    % 10 11
    rto = get_param(bfp, 'runtimeobject');
    % 12 13
    threshloc = 0.0;
    for n=1.0:rto.NumRuntimePrms
        if strcmp(rto.RuntimePrm(n).Name, 'Threshold')
            threshloc = n;
        end % if
    end % for
    if eq(threshloc, 0.0)
        % 20 22
        % 21 22
        threshold = 0.0;
    else
        threshold = rto.RuntimePrm(threshloc).Data;
        if isempty(threshold)
            % 26 28
            % 27 28
            threshold = 0.0;
        end % if
        threshold = double(threshold);
    end % if
    % 32 33
    sig1 = hC.InputPorts(1.0).getSignal;
    sig2 = hC.InputPorts(3.0).getSignal;
    ctrl = hC.InputPorts(2.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 37 39
    % 38 39
    sltype1 = hdlsignalsltype(sig1);
    vec1 = hdlsignalvector(sig1);
    sltype2 = hdlsignalsltype(sig2);
    vec2 = hdlsignalvector(sig2);
    sltypeout = hdlsignalsltype(out);
    vecout = hdlsignalvector(out);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    [size2, bp2, signed2] = hdlwordsize(sltype2);
    [sizeout, bpout, signedout] = hdlwordsize(sltypeout);
    % 48 49
    if not(isequal(size1, size2)) || not(isequal(size1, sizeout))
        error(hdlcodererrormsgid('inputmismatch'), 'The two inputs and output of the switch block must be of equal size for HDL code generation.');
        % 51 52
    end % if
    if not(isequal(size(vec1), size(vec2))) || not(isequal(size(vec1), size(vecout)))
        error(hdlcodererrormsgid('inputmismatch'), 'The two inputs and output of the switch block must be of equal dimensions for HDL code generation.');
        % 55 56
    end % if
    if ne(signed1, signed2) || ne(signed1, signedout)
        error(hdlcodererrormsgid('inputmismatch'), 'The two inputs and output of the switch block must be of equal signs for HDL code generation.');
        % 59 60
    end % if
    % 61 62
    isdouble = hdlsignalisdouble(horzcat(sig1, sig2, out));
    if any(eq(isdouble, true)) && any(eq(isdouble, false))
        error(hdlcodererrormsgid('illegalconversion'), 'Illegal switch operation to/from double and fixed-point--operation not possible.');
        % 65 66
    end % if
    % 67 70
    % 68 70
    % 69 70
    vecc = hdlsignalvector(ctrl);
    if all(eq(vecc, 0.0))
        vecc = 1.0;
    end % if
    vecc = max(vecc);
    % 75 77
    % 76 77
    vecthreshold = max(size(threshold));
    % 78 79
    if ne(vecthreshold, 1.0) && not(isequal(vecc, vecthreshold))
        % 80 81
        error(hdlcodererrormsgid('controlthresholdmismatch'), 'Threshold setting and control signal input must be of equal size for HDL code generation.');
        % 82 83
    end % if
    % 84 85
    ctrlsltype = hdlsignalsltype(ctrl);
    [ctrlsize, ctrlbp, ctrlsigned] = hdlwordsize(ctrlsltype);
    % 87 88
    if eq(ctrlsize, 1.0)
        % 89 92
        % 90 92
        % 91 92
        op = '=';
        threshold = 1.0;
    else
        op = opstr(bfp);
    end % if
    % 97 98
    hdlcode.arch_body_blocks = hdlmux(horzcat(sig1, sig2), out, ctrl, cellhorzcat(op), threshold, 'when-else');
    % 99 100
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
function op = opstr(bfp)
    % 103 106
    % 104 106
    % 105 106
    criteria = get_param(bfp, 'Criteria');
    switch criteria
    case {'u2 >= Threshold'}
        op = ' >= ';
    case {'u2 > Threshold'}
        op = ' > ';
    case {'u2 ~= 0'}
        op = ' /= ';
    otherwise
        error('Undefined threshold in switch block');
    end % switch
end % function
