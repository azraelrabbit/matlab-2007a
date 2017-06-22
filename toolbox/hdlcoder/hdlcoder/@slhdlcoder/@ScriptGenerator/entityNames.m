function names = entityNames(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hCurrentDriver = hdlcurrentdriver;
    names = hCurrentDriver.EntityNameList;
    % 8 10
    if not(isempty(names))
        if hdlgetparameter('vhdl_package_required') && hdlgetparameter('isvhdl') && not(isempty(names{1.0})) && not(strcmp(names{1.0}, hdlgetparameter('vhdl_package_name')))
            % 11 15
            % 12 15
            % 13 15
            names = cellhorzcat(hdlgetparameter('vhdl_package_name'), names{:});
        else
            if not(hdlgetparameter('vhdl_package_required')) && hdlgetparameter('isvhdl') && strcmp(names{1.0}, hdlgetparameter('vhdl_package_name'))
                % 17 19
                names = cellhorzcat(names{2.0:end});
            end
        end
    else
        names = {};
    end
end
