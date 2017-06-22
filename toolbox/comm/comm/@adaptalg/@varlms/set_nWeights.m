function N = set_nWeights(alg, N)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    alg.nWeightsPrivate = N;
    % 7 9
    % 8 9
    if ne(N, size(alg.StepSize, 2.0))
        alg.StepSize = mtimes(alg.InitStep, ones(1.0, N));
        alg.GradientVector = zeros(1.0, N);
    end % if
end % function
