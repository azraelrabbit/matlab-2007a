function [hdlbody, hdlsignal, signalidx] = hdlslowclkgenerator(this, clkrate, counter)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hdlbody = [];
    hdlsignal = [];
    % 10 11
    hdlbody = horzcat(hdlbody, this.insertComment({'Slow Clock (clkenb)'}), '\n');
    % 12 14
    % 13 14
    [tmpbody, signalidx] = hdlcounter(counter, clkrate, 'slow_clock_enable', 1.0, 0.0, 0.0, -1.0);
    % 15 16
    hdlbody = horzcat(hdlbody, tmpbody);
    for m=1.0:length(signalidx)
        hdlsignal = horzcat(hdlsignal, makehdlsignaldecl(signalidx(m)));
    end % for
end % function
