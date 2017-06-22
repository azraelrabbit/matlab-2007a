function hdlbody = hdlsetorextractbits(in, out, bitindex, bitvalstr)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ne(length(in), 1.0) || ne(length(out), 1.0)
        error('Array inputs to hdladd are not handled yet!');
    end % if
    % 10 12
    if hdlgetparameter('isvhdl')
        hdlbody = vhdlsetorextractbits(in, out, bitindex, bitvalstr);
    else
        if hdlgetparameter('isverilog')
            hdlbody = verilogsetorextractbits(in, out, bitindex, bitvalstr);
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
