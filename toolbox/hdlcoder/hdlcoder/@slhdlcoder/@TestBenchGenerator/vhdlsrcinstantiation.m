function [hdlbody, hdlsignals] = vhdlsrcinstantiation(this, component)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hdlbody = [];
    hdlsignals = [];
    bdt = hdlgetparameter('base_data_type');
    if gt(component.datalength, 1.0)
        Size = ceil(log2(component.datalength));
    else
        Size = 1.0;
    end % if
    [vtype, sltype] = hdlgettypesfromsizes(Size, 0.0, 0.0);
    % 19 20
    [name, clkIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_clk'), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
    hdlsignals = clkIdx;
    [name, resetIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_reset'), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
    hdlsignals = horzcat(hdlsignals, resetIdx);
    [name, rdenbIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_rdenb'), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
    hdlsignals = horzcat(hdlsignals, rdenbIdx);
    [name, addrIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_addr'), 'block', -1.0, 0.0, 0.0, vtype, sltype);
    hdlsignals = horzcat(hdlsignals, addrIdx);
    [name, nxtaddrIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_nxtaddr'), 'block', -1.0, 0.0, 0.0, vtype, sltype);
    hdlsignals = horzcat(hdlsignals, nxtaddrIdx);
    [name, doneIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_done'), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
    hdlsignals = horzcat(hdlsignals, doneIdx);
    % 32 33
    hdlbody = horzcat('  ', component.procedureName, ' (\n', '    clk       => ', hdlsignalname(clkIdx), ',\n', '    reset     => ', hdlsignalname(resetIdx), ',\n', '    rdenb     => ', hdlsignalname(rdenbIdx), ',\n', '    addr      => ', hdlsignalname(addrIdx), ',\n', '    nxt_addr  => ', hdlsignalname(nxtaddrIdx), ',\n', '    done      => ', hdlsignalname(doneIdx), ');\n\n');
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
end % function
