function [leftMatrix, rightMatrix] = ne_get_scale_matrices_from_factors(leftMult, rightMult)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    leftMult = leftMult(:);
    rightMult = rightMult(:);
    m = length(leftMult);
    n = length(rightMult);
    leftMatrix = spdiags(leftMult, 0.0, m, m);
    rightMatrix = spdiags(rightMult, 0.0, n, n);
end % function
