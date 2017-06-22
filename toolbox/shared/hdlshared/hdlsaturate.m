function final_result = hdlsaturate(varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if hdlgetparameter('isvhdl')
        final_result = vhdlsaturate(varargin{:});
    else
        if hdlgetparameter('isverilog')
            final_result = verilogsaturate(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
