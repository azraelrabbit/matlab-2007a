function ret = isempty(slr)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if le(width(slr), 0.0)
        ret = logical(1);
    else
        if le(height(slr), 0.0)
            ret = logical(1);
        else
            ret = logical(0);
        end
    end
end
