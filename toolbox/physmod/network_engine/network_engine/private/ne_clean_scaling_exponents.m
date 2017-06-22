function scale_exponents_clean = ne_clean_scaling_exponents(scale_exponents)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    scale_exponents_clean = times(sign(scale_exponents), floor(abs(scale_exponents)));
end % function
