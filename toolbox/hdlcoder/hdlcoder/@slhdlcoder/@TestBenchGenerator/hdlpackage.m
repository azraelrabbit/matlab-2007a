function hdltbbody = hdlpackage(this, hdltbbody, tbpkgfid, tbdatafid)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlgetparameter('isvhdl')
        this.vhdlpackage(hdltbbody, tbpkgfid, tbdatafid);
    else
        hdltbbody = this.verilogpackage(hdltbbody, tbpkgfid, tbdatafid);
    end % if
end % function
