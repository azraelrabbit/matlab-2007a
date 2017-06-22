function update_all_implement_prop(hRtwFcnEntry)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    dataTypeProps = rtwmath_data_type_prop_list;
    list = [];
    % 8 9
    for prop=dataTypeProps
        obj = hRtwFcnEntry.get(prop{1.0});
        if not(isempty(obj))
            list = horzcat(list, obj);
        end % if
    end % for
    % 15 16
    hRtwFcnEntry.allImplement = list;
end % function
