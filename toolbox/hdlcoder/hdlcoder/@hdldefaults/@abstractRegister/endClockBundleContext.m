function endClockBundleContext(this, context)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hdlsetcurrentclock(context.original_clk);
    hdlsetcurrentclockenable(context.original_clken);
    hdlsetcurrentreset(context.original_reset);
end % function
