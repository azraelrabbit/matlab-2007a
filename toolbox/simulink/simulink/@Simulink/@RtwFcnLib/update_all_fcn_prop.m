function update_all_fcn_prop(hRtwFcnLib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fcnProps = rtwmath_base_fcn_name_list;
    list = [];
    % 9 10
    for fcn=fcnProps
        obj = hRtwFcnLib.get(fcn{1.0});
        if not(isempty(obj))
            list = horzcat(list, obj);
        end % if
    end % for
    % 16 17
    hRtwFcnLib.allFcns = list;
end % function
