function [hdlbody, hdlsignals] = hdlunitdelay(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if hdlgetparameter('isvhdl')
        [hdlbody, hdlsignals] = vhdlunitdelay(varargin{:});
    else
        if hdlgetparameter('isverilog')
            [hdlbody, hdlsignals] = verilogunitdelay(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
