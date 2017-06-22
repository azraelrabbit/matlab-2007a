function hdlcode = clkEnablesWedgedEmit(this, hC)
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
    hdlcode = hdlcodeinit;
    % 13 16
    % 14 16
    % 15 16
    p = pir;
    allClockSpecs = p.getAllClockSpecs;
    % 18 19
    s = [];
    hN = hC.Owner;
    for cs=allClockSpecs
        [c, ce, r] = hN.getClockBundle([], cs.up, cs.down, cs.offset);
        if hdlgetparameter('isverilog')
            assign = horzcat('  assign ', hdlsignalname(ce), ' = 1''b1;\n');
        else
            assign = horzcat('  ', hdlsignalname(ce), ' <= ''1'';\n');
        end % if
        s = horzcat(s, assign);
    end % for
    hdlcode.arch_body_blocks = s;
end % function
