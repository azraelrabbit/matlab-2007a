function [hdlbody, hdlsignals] = hdlsrcinstantiation(this, component)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if hdlgetparameter('isvhdl')
        [hdlbody, hdlsignals] = this.vhdlsrcinstantiation(component);
    else
        [hdlbody, hdlsignals] = this.verilogsrcinstantiation(component);
    end % if
end % function
