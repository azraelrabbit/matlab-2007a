function hdlbody = hdlreadDataProc(this, rdenb, txdataCnt, instance, clkrate)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hdlbody = [];
    % 9 10
    if hdlgetparameter('isvhdl')
        hdlbody = horzcat(hdlbody, this.vhdlreadDataProc(rdenb, txdataCnt, instance, clkrate));
    else
        hdlbody = horzcat(hdlbody, this.verilogreadDataProc(rdenb, txdataCnt, instance, clkrate));
    end % if
end % function
