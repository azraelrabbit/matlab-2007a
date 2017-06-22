function mask = setMask(h, mask)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if ne(length(mask), minus(length(h.GenPoly), 1.0))
        error('comm:seqgen:pn:InvalidMaskLength', 'Mask vector length must equal the GenPoly order.');
        % 13 15
    end
    % 15 18
    % 16 18
    if not(check_bool_vector(mask))
        error('comm:seqgen:pn:InvalidMaskValues', 'Mask values must be 0 or 1.');
        % 19 21
    end
    % 21 24
    % 22 24
    h.PrivMask = mask;
end
function success = check_bool_vector(values)
    % 26 30
    % 27 30
    % 28 30
    success = check_nonneg_int(values) && le(max(values), 1.0);
end
function success = check_nonneg_int(values)
    % 32 36
    % 33 36
    % 34 36
    success = not(any(rem(values, 1.0))) && ge(min(values), 0.0);
end
