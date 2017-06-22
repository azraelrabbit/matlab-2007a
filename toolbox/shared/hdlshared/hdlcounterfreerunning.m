function hdlcode = hdlcounterfreerunning(bfp)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hdlcode = hdlcodeinit;
    % 10 11
    name = hdllegalname(get_param(bfp, 'Name'));
    % 12 13
    phan = get_param(bfp, 'PortHandles');
    body = '';
    signals = '';
    % 16 17
    out = hdlentityoutput(phan.Outport(1.0));
    sltype = hdlsignalsltype(out);
    [size, bp, sign] = hdlgetsizesfromtype(sltype);
    vtype = hdlblockdatatype(sltype);
    % 21 22
    uplimit = power(2.0, size);
    % 23 24
    [idxname, cnt] = hdlnewsignal('cnt', 'block', -1.0, 0.0, 0.0, vtype, sltype);
    signals = horzcat(signals, makehdlsignaldecl(cnt));
    % 26 27
    [tmpbody, tmpsignals] = hdlcounter(cnt, uplimit, 'counter_free_running', 1.0, 0.0, -1.0);
    % 28 29
    body = horzcat(body, tmpbody);
    signals = horzcat(signals, tmpsignals);
    % 31 32
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
end % function
