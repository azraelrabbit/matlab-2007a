function vhdlpackageaddtypedef(typedef)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if eq(hdlgetparameter('vhdl_package_required'), 0.0)
        vhdlpackageinit;
    end % if
    if eq(any(findstr(hdlgetparameter('vhdl_package_type_defs'), typedef)), 0.0)
        % 11 12
        hdlsetparameter('vhdl_package_type_defs', horzcat(hdlgetparameter('vhdl_package_type_defs'), typedef));
        % 13 14
    end % if
end % function
