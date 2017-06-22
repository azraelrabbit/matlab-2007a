function N = setreftap(eq, N)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if gt(N, eq.nWeights)
        error('comm:lineareqsetreftap:maxvalue', 'RefTap must be less than or equal to nWeights.');
        % 7 8
    end % if
    if ne(rem(minus(N, 1.0), eq.nSampPerSym), 0.0)
        error('comm:lineareqsetreftap:nsampmultiple', 'RefTap-1 must be an integer multiple of nSampPerSym.');
        % 11 12
    end % if
end % function
