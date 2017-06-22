function output = mpt_get_user_object_type(objectType)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    custom_user_object_type_reg;
    userDTInfo = cusattic('AtticData', 'userDTInfo');
    output = '';
    if eq(isempty(userDTInfo), 0.0)
        param = '';
        signal = '';
        for i=1.0:length(userDTInfo)
            switch lower(userDTInfo{i}.type)
            case 'both'
                param{plus(end, 1.0)} = userDTInfo{i}.name;
                signal{plus(end, 1.0)} = userDTInfo{i}.name;
            case 'parameter'
                param{plus(end, 1.0)} = userDTInfo{i}.name;
            case 'signal'
                signal{plus(end, 1.0)} = userDTInfo{i}.name;
            otherwise
                msg = sprintf('''%s'' is invalid user-defined object type.', userDTInfo{i}.name);
                warning(msg);
            end
        end % for
        if strcmp(objectType, 'Parameter')
            output = param;
        else
            if strcmp(objectType, 'Signal')
                output = signal;
            end
        end
    end
end
