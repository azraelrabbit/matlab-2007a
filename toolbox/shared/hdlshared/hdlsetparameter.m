function hdlsetparameter(param, newvalue)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        % 8 9
        hdl_parameters = PersistentHDLPropSet;
        hdl_parameters.INI.setProp(param, newvalue);
    else
        % 12 14
        % 13 14
        hDriver = hdlcurrentdriver;
        hDriver.setParameter(param, newvalue);
        % 16 17
    end % if
end % function
