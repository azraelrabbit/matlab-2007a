function final_result = hdltypeconvert(varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if hdlgetparameter('isvhdl')
        final_result = vhdltypeconvert(varargin{:});
    else
        if hdlgetparameter('isverilog')
            final_result = verilogtypeconvert(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
