function [vbody, vsignals] = hdlintdelay(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if eq(varargin{4.0}, 0.0)
        % 9 11
        vbody = hdlsignalassignment(varargin{1.0}, varargin{2.0});
        vsignals = [];
    else
        if eq(varargin{4.0}, 1.0)
            if ge(nargin, 5.0)
                [vbody, vsignals] = hdlunitdelay(varargin{1.0}, varargin{2.0}, varargin{3.0}, varargin{5.0});
            else
                [vbody, vsignals] = hdlunitdelay(varargin{1.0}, varargin{2.0}, varargin{3.0});
            end % if
        else
            if hdlgetparameter('isvhdl')
                [vbody, vsignals] = vhdlintdelay(varargin{:});
            else
                if hdlgetparameter('isverilog')
                    [vbody, vsignals] = verilogintdelay(varargin{:});
                else
                    error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
                end % if
            end % if
        end % if
    end % if
end % function
