function hdlbody = hdlchecker(this, rdenb, addr, nxt_addr, instance, outRef, timeout, errCnt, clkrate, testFailure)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlbody = [];
    % 8 9
    if hdlgetparameter('isvhdl')
        hdlbody = horzcat(hdlbody, this.vhdlchecker(rdenb, addr, nxt_addr, instance, outRef, timeout, errCnt, clkrate, testFailure));
    else
        hdlbody = horzcat(hdlbody, this.verilogchecker(rdenb, addr, nxt_addr, instance, outRef, timeout, errCnt, clkrate, testFailure));
    end % if
end % function
