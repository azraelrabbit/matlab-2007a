function hdldefaultfilterparameters(targetlang)
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
    hdldefaultparameters(targetlang);
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    hdlsetparameter('vhdl_package_name', horzcat(hdlgetparameter('filter_name'), hdlgetparameter('package_suffix')));
    % 22 23
    hdlsetparameter('tb_name', horzcat(hdlgetparameter('filter_name'), hdlgetparameter('tb_postfix')));
    % 24 25
    hdlsetparameter('cast_before_sum', 0.0);
    hdlsetparameter('tbrefsignals', false);
end % function
