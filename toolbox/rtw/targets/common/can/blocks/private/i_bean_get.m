function val = i_bean_get(bean, prop)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    try
        % 12 13
        method = horzcat('get', upper(prop(1.0)), prop(2.0:end));
        val = eval(horzcat('bean.', method));
    catch
        % 16 17
        method = horzcat('is', upper(prop(1.0)), prop(2.0:end));
        val = eval(horzcat('bean.', method));
    end % try
    % 20 22
    % 21 22
    switch class(val)
    case 'java.lang.String'
        % 24 25
        val = char(val);
    case 'logical'
        % 27 30
        % 28 30
        % 29 30
        val = double(val);
    end % switch
    % 32 33
    return;
end % function
