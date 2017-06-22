function [hdlbody, hdlsignals] = verilogsrcinstantiation(this, component)
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
    hdlregsignal(addrIdx);
    hdlsignals = horzcat(hdlsignals, addrIdx);
    [name, nxtaddrIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_nxtaddr'), 'block', -1.0, 0.0, 0.0, vtype, sltype);
    hdlregsignal(nxtaddrIdx);
    hdlsignals = horzcat(hdlsignals, nxtaddrIdx);
    [name, doneIdx] = hdlnewsignal(horzcat(component.loggingPortName, '_done'), 'block', -1.0, 0.0, 0.0, bdt, 'boolean');
    hdlregsignal(doneIdx);
    hdlsignals = horzcat(hdlsignals, doneIdx);
    % 35 36
    if eq(this.ForceResetValue, 0.0)
        reset_edge = 'negedge';
    else
        reset_edge = 'posedge';
    end % if
    % 41 42
    sp = ' ';
    num_sp = length(horzcat(component.procedureName, '('));
    spacing = eval(horzcat('sprintf(''%', num2str(num_sp), 's'',sp)'));
    hdlbody = horzcat('  always @(posedge ', hdlsignalname(clkIdx), ' or ', reset_edge, ' ', hdlsignalname(resetIdx), ')\n', '  begin\n', '    ', component.procedureName, '(', hdlsignalname(clkIdx), ',', hdlsignalname(resetIdx), ',\n', '    ', spacing, hdlsignalname(rdenbIdx), ',', hdlsignalname(addrIdx), ',\n', '    ', spacing, hdlsignalname(nxtaddrIdx), ',', hdlsignalname(doneIdx), ');\n', '  end\n\n');
    % 46 50
    % 47 50
    % 48 50
    % 49 50
end % function
