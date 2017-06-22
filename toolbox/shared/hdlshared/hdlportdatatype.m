function vtype = hdlportdatatype(dt)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        vtype = vhdlportdatatype(dt);
    else
        if hdlgetparameter('isverilog')
            vtype = verilogportdatatype(dt);
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
