function hdldefaultparameters(targetlang)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 1.0)
        targetlang = 'vhdl';
    else
        targetlang = lower(targetlang);
    end % if
    % 12 13
    hprop = hdlcoderprops.HDLProps;
    PersistentHDLPropSet(hprop);
    hdlsetparameter('TargetLanguage', targetlang);
end % function
