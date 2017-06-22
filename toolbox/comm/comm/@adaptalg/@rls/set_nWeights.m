function N = set_nWeights(alg, N)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    alg.nWeightsPrivate = N;
    % 7 9
    % 8 9
    if ne(N, size(alg.InvCorrMatrix, 1.0))
        alg.InvCorrMatrix = mtimes(alg.InvCorrInit, eye(N));
    end % if
end % function
