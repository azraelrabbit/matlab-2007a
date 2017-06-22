function timescale = hdlverilogtimescale
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlgetparameter('use_verilog_timescale')
        timescale = '`timescale 1 ns / 1 ns\n\n';
    else
        timescale = '';
    end % if
end % function
