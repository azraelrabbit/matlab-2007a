function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 11
    err_matrixsupport = 'Matrices are not supported on selector block for HDL code generation.';
    % 11 14
    % 12 14
    if strcmp(get_param(bfp, 'InputType'), 'Matrix')
        error(hdlcodererrormsgid('matrixunsupported'), err_matrixsupport);
        % 15 17
    end % if
    % 17 19
    isonebase = strcmp(get_param(bfp, 'IndexMode'), 'One-based');
    arch_body = local_handle_slselector(hC, bfp, isonebase);
    hdlcode.arch_body_blocks = horzcat(arch_body, '\n');
    % 21 23
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
function hdlbody = local_handle_slselector(hC, bfp, isonebase)
    % 25 29
    % 26 29
    % 27 29
    hasidxport = gt(hC.numberofInputPorts, 1.0);
    elementarray = evalin('base', get_param(bfp, 'Elements'));
    % 30 32
    in = hC.InputPorts(1.0).getSignal;
    invec = hdlsignalvector(in);
    out = hC.OutputPorts(1.0).getSignal;
    outvec = hdlsignalvector(out);
    % 35 37
    if all(not(invec)) && all(not(outvec))
        hdlbody = hdlsignalassignment(in, out);
    else
        if all(not(invec))
            hdlbody = '';
            for i=1.0:max(outvec)
                hdlbody = horzcat(hdlbody, hdlsignalassignment(in, out, [], minus(i, 1.0)));
            end % for
        else
            if hasidxport
                sel = hC.InputPorts(2.0).getSignal;
                if isonebase
                    outrange = 1.0:minus(max(invec), 1.0);
                else
                    outrange = 0.0:minus(max(invec), 2.0);
                end % if
                hdlbody = hdlmux(in, out, sel, {'='}, [], 'when-else', [], outrange);
            else
                if isonebase
                    hdlbody = hdlsignalassignment(in, out, minus(elementarray, 1.0), []);
                else
                    hdlbody = hdlsignalassignment(in, out, elementarray, []);
                end % if
            end % if
        end % if
    end % if
end % function
