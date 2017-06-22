function str = hdllegalnamersvd(strin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        str = vhdllegalnamersvd(strin);
    else
        if hdlgetparameter('isverilog')
            str = veriloglegalnamersvd(strin);
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
