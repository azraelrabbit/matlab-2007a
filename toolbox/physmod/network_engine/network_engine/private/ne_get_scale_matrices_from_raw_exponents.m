function [leftMatrix, rightMatrix, leftMult, rightMult] = ne_get_scale_matrices_from_raw_exponents(dl, dr)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    dr = ne_clean_scaling_exponents(dr);
    dl = ne_clean_scaling_exponents(dl);
    leftMult = power(2.0, dl);
    rightMult = power(2.0, dr);
    [leftMatrix, rightMatrix] = ne_get_scale_matrices_from_factors(leftMult, rightMult);
end % function
