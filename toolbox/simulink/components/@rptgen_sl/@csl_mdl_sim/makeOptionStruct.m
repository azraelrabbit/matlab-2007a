function oStruct = makeOptionStruct(c, simparam, mdlName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 3.0)
        mdlName = get(rptgen_sl.appdata_sl, 'CurrentModel');
        if lt(nargin, 2.0)
            simparam = c.simparam;
        end % if
    end % if
    % 13 16
    % 14 16
    % 15 16
    if isempty(mdlName)
        oStruct = simget;
    else
        try
            oStruct = simget(mdlName);
        catch
            oStruct = simget;
        end % try
    end % if
    % 25 26
    i = 2.0;
        while le(i, length(simparam))
        try
            simparam{i} = evalin('base', simparam{i});
            i = plus(i, 2.0);
        catch
            c.status(sprintf('Simulation parameter "%s" has an invalid value of "%s"', simparam{minus(i, 1.0)}, simparam{i}), 2.0);
            % 33 34
            simparam = horzcat(simparam(1.0:minus(i, 2.0)), simparam(plus(i, 1.0):end));
        end % try
    end % while
    % 37 38
    try
        oStruct = simset(oStruct, simparam{:});
    catch
        % 41 42
        c.status(lasterr, 2.0);
    end % try
end % function
