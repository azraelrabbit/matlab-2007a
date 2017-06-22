function [vtype, vsize, vbp, vsigned, sltype] = hdltypefromquantizer(quantizerobj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        [vtype, vsize, vbp, vsigned, sltype] = vhdltypefromquantizer(quantizerobj);
    else
        if hdlgetparameter('isverilog')
            [vtype, vsize, vbp, vsigned, sltype] = verilogtypefromquantizer(quantizerobj);
        else
            error(generatemsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
