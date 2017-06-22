function [out, new_metadata] = setData(h, newval)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    new_metadata = h.reset(newval);
    % 10 11
    if isfinite(new_metadata.increment)
        out = [];
    else
        out = newval;
    end % if
end % function
