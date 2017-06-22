function [hdlbody, hdlsignals] = hdladdsub(in1, in2, subtractin, out, rounding, saturation, mode)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hdlbody = '';
    hdlsignals = '';
    % 14 15
    if lt(nargin, 6.0)
        mode = 'select';
    end % if
    % 18 19
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    % 21 22
    [ignored, addtemp] = hdlnewsignal('addsub_add', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
    [ignored, subtemp] = hdlnewsignal('addsub_sub', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
    % 24 25
    hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(addtemp));
    hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(subtemp));
    % 27 28
    [tmpbody, tmpsignals] = hdladd(in1, in2, addtemp, rounding, saturation);
    hdlbody = horzcat(hdlbody, tmpbody);
    hdlsignals = horzcat(hdlsignals, tmpsignals);
    % 31 32
    [tmpbody, tmpsignals] = hdlsub(in1, in2, subtemp, rounding, saturation);
    hdlbody = horzcat(hdlbody, tmpbody);
    hdlsignals = horzcat(hdlsignals, tmpsignals);
    % 35 36
    tmpbody = hdlmux(horzcat(subtemp, addtemp), out, subtractin, '=', [1.0 0.0], 'when-else');
    hdlbody = horzcat(hdlbody, tmpbody);
end % function
