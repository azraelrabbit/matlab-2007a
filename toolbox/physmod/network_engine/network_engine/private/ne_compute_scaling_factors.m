function [leftMatrix, rightMatrix, leftMult, rightMult] = ne_compute_scaling_factors(J)
    % 1 4
    % 2 4
    % 3 4
    [dr, dl] = ne_compute_scaling(J);
    [leftMatrix, rightMatrix, leftMult, rightMult] = ne_get_scale_matrices_from_raw_exponents(dl, dr);
end % function
