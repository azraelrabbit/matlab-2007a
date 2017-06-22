function names = hdlentitynames
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if hdlisfiltercoder
        names = hdlgetparameter('entitynamelist');
    else
        hCurrentDriver = hdlcurrentdriver;
        names = hCurrentDriver.EntityNameList;
    end
    % 23 26
    % 24 26
    if not(isempty(names))
        % 26 30
        % 27 30
        % 28 30
        if hdlgetparameter('vhdl_package_required') && not(isempty(names{1.0})) && not(strcmp(names{1.0}, hdlgetparameter('vhdl_package_name')))
            % 30 33
            % 31 33
            names = cellhorzcat(hdlgetparameter('vhdl_package_name'), names{:});
        else
            if not(hdlgetparameter('vhdl_package_required')) && strcmp(names{1.0}, hdlgetparameter('vhdl_package_name'))
                names = cellhorzcat(names{2.0:end});
            end
        end
    else
        names = {};
    end
end
