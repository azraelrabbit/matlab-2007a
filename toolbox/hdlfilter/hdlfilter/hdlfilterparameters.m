function result = hdlfilterparameters(whichparams)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hdl_parameters = PersistentHDLPropSet;
    % 11 13
    if isempty(hdlgetparameter('target_language'))
        warning(generatemsgid('usingdefaults'), 'HDL CodeGen Properties is empty, using default values');
        % 14 16
        hdldefaultfilterparameters;
    end
    % 17 19
    result = {};
    % 19 21
    if eq(nargin, 0.0)
        whichparams = 'nondefault';
        % 22 24
        result{plus(end, 1.0)} = 'TargetLanguage';
        if strcmp(hdlgetparameter('target_language'), 'vhdl')
            result{plus(end, 1.0)} = 'VHDL';
        else
            if strcmp(hdlgetparameter('target_language'), 'verilog')
                result{plus(end, 1.0)} = 'Verilog';
            else
                error(generatemsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', targetlang);
            end
        end
    else
        whichparams = lower(whichparams);
    end
    result = horzcat(result, creatematdata(hdl_parameters.CLI, whichparams));
end
