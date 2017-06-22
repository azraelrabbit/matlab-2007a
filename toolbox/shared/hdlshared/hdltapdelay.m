function [vbody, vsignals] = hdltapdelay(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlgetparameter('isvhdl')
        [vbody, vsignals] = vhdltapdelay(varargin{:});
    else
        if hdlgetparameter('isverilog')
            [vbody, vsignals] = verilogtapdelay(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
