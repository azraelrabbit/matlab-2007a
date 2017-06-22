function context = beginClockBundleContext(this, hN, hC, hS, up, dn, off)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    context.original_clk = hdlgetcurrentclock;
    context.original_clken = hdlgetcurrentclockenable;
    context.original_reset = hdlgetcurrentreset;
    % 12 13
    [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, up, dn, off);
    % 14 16
    % 15 16
    hdlsetcurrentclock(clk);
    hdladdclockenablesignal(clken);
    hdlsetcurrentclockenable(clken);
    % 19 20
    hdlsetcurrentreset(reset);
end % function
