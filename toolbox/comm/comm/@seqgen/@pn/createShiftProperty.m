function h = createShiftProperty(h, shift)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = schema.prop(h, 'Shift', 'double_vector');
    p.SetFunction = @setShift;
    p.GetFunction = @getShift;
    h.Shift = shift;
end % function
function shift = setShift(h, shift)
    % 13 16
    % 14 16
    % 15 16
    if ne(length(shift), 1.0)
        error('comm:seqgen:pn:InvalidShiftLength', 'Shift must be a scalar value.');
        % 18 19
    end % if
    % 20 22
    % 21 22
    if any(rem(shift, 1.0))
        error('comm:seqgen:pn:InvalidShiftValue', 'Shift must be integer valued.');
        % 24 25
    end % if
    % 26 28
    % 27 28
    h.PrivMask = shift2mask(h.GenPoly, shift);
end % function
function shift = getShift(h, shift)
    % 31 33
    % 32 33
    shift = getshift(h);
end % function
