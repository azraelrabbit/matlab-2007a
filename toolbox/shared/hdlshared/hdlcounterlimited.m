function hdlcode = hdlcounterlimited(bfp)
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
    uplimit = plus(evalin('base', get_param(bfp, 'uplimit')), 1.0);
    % 13 14
    phan = get_param(bfp, 'PortHandles');
    body = '';
    signals = '';
    % 17 18
    out = hdlentityoutput(phan.Outport(1.0));
    sltype = hdlsignalsltype(out);
    vtype = hdlblockdatatype(sltype);
    % 21 22
    [idxname, cnt] = hdlnewsignal('cnt', 'block', -1.0, 0.0, 0.0, vtype, sltype);
    signals = horzcat(signals, makehdlsignaldecl(cnt));
    % 24 25
    [tmpbody, tmpsignals] = hdlcounter(cnt, uplimit, 'counter_limited', 1.0, 0.0, -1.0);
    % 26 27
    body = horzcat(body, tmpbody);
    signals = horzcat(signals, tmpsignals);
    % 29 30
    hdlcode.arch_body_blocks = body;
    hdlcode.arch_signals = signals;
end % function
