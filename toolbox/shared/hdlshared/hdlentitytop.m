function name = hdlentitytop
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if hdlisfiltercoder
        enl = hdlgetparameter('entitynamelist');
        % 18 19
        if not(isempty(enl))
            name = enl{end};
        else
            name = '';
        end % if
    else
        hCurrentDriver = hdlcurrentdriver;
        name = hCurrentDriver.getEntityTop;
    end % if
end % function
