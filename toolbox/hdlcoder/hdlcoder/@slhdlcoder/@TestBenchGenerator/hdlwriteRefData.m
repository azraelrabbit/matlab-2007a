function hdlwriteRefData(this, hdltbbody, tbfid)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlgetparameter('isvhdl')
        this.vhdlwriteRefData(hdltbbody, tbfid);
    else
        this.verilogwriteRefData(hdltbbody, tbfid);
    end % if
end % function
