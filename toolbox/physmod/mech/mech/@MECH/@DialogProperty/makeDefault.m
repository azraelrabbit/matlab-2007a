function default = makeDefault(dp, val)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if dp.Eval
        if eq(length(val), 1.0)
            default = num2str(val);
        else
            default = mat2str(val);
        end % if
    else
        default = val;
    end % if
end % function
