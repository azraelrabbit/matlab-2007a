function N = set_nSampPerSym(eq, N)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if gt(N, eq.AdaptAlg.nWeights(1.0))
        error('comm:set_samppersym:maxvalue', 'nSampPerSym must be less than or equal to nWeights(1)');
    end % if
    if ne(rem(minus(eq.RefTap, 1.0), N), 0.0)
        error('comm:lineareqsetnsamppersym:nsampmultiple', 'RefTap-1 must be an integer multiple of nSampPerSym.');
        % 11 12
    end % if
end % function
