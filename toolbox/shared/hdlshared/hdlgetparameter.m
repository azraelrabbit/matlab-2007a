function paramvalue = hdlgetparameter(param)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        % 8 9
        hdl_parameters = PersistentHDLPropSet;
        % 10 11
        if isempty(hdl_parameters)
            paramvalue = [];
        else
            paramvalue = hdl_parameters.INI.getProp(param);
        end % if
    else
        % 17 19
        % 18 19
        hDriver = hdlcurrentdriver;
        if isempty(hDriver)
            paramvalue = [];
        else
            paramvalue = hDriver.getParameter(param);
        end % if
        % 25 26
    end % if
end % function
