function result = hdlentitynameexists(nname)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        if isempty(hdlgetparameter('entitynamelist'))
            result = 0.0;
        else
            loc = strcmpi(nname, hdlgetparameter('entitynamelist'));
            if any(loc)
                result = 1.0;
            else
                result = 0.0;
            end % if
        end % if
    else
        hCurrentDriver = hdlcurrentdriver;
        result = hCurrentDriver.entityNameExists(nname);
    end % if
end % function
