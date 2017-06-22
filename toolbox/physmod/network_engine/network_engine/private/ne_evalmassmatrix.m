function M = ne_evalmassmatrix(sys, t, y, u, probaux)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    Mdiag = ne_dae_M(sys, t, y, u);
    M = spdiags(Mdiag, 0.0, probaux.n, probaux.n);
end % function
