function x = merge(x1, x2)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    L1 = length(x1);
    L2 = length(x2);
    if eq(L1, L2)
        if lt(x1(1.0), x2(1.0))
            x = vertcat(transpose(x1(:)), transpose(x2(:)));
        else
            x = vertcat(transpose(x2(:)), transpose(x1(:)));
        end
        x = x(:);
    else
        if lt(L1, L2)
            x = vertcat(horzcat(0.0, transpose(x1(:))), transpose(x2(:)));
            x = x(2.0:end);
        else
            if gt(L1, L2)
                x = vertcat(transpose(x1(:)), horzcat(transpose(x2(:)), 0.0));
                x = x(1.0:minus(end, 1.0));
            end
        end
    end
end
