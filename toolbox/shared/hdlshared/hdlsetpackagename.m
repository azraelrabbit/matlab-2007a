function hdlsetpackagename(name)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hdlsetparameter('vhdl_package_name', hdluniqueentityname(horzcat(name, hdlgetparameter('package_suffix'))));
    % 10 11
    hdladdtoentitylist('', hdlgetparameter('vhdl_package_name'), '', '');
end % function
