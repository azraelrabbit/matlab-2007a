function v = validate(this, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    status = 0.0;
    msg = '';
    msgid = '';
    % 12 14
    % 13 14
    ninputs = hC.numberofInputPorts;
    % 15 16
    sel = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 18 19
    ins = [];
    for n=2.0:ninputs
        ins = horzcat(ins, hC.InputPorts(n).getSignal);
    end % for
    % 23 24
    isdouble = hdlsignalisdouble(horzcat(ins, sel, out));
    if any(eq(isdouble, true)) && any(eq(isdouble, false))
        status = 1.0;
        msg = 'Illegal multiport switch operation to/from double and fixed-point--operation not possible.';
        msgid = 'MultiPortSwitchHDLEmission:validate:mixeddoublenondoubleports';
    end % if
    % 30 31
    v.Status = status;
    v.Message = msg;
    v.MessageID = msgid;
end % function
