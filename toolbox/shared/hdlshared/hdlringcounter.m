function [hdlbody, hdlsignals] = hdlringcounter(varargin)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if hdlgetparameter('isvhdl')
        [hdlbody, hdlsignals] = vhdlringcounter(varargin{:});
    else
        if hdlgetparameter('isverilog')
            [hdlbody, hdlsignals] = verilogringcounter(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
