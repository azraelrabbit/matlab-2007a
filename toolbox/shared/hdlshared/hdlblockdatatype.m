function vtype = hdlblockdatatype(dt)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        vtype = vhdlblockdatatype(dt);
    else
        if hdlgetparameter('isverilog')
            vtype = verilogblockdatatype(dt);
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
