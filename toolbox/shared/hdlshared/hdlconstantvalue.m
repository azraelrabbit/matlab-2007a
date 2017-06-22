function result = hdlconstantvalue(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if hdlgetparameter('isvhdl')
        result = vhdlconstantvalue(varargin{:});
    else
        if hdlgetparameter('isverilog')
            result = verilogconstantvalue(varargin{:});
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
end % function
