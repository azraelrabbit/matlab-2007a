function str = i_bean2struct(bean, fields)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    str = [];
    for i=1.0:length(fields)
        getV = i_bean_get(bean, fields{i});
        str = setfield(str, fields{i}, getV);
    end % for
end % function
