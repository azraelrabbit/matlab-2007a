function [Md_nom, n_d] = ne_dae_Md_matrix(sys, t, x, u)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [Mnom, n_d] = ne_dae_M(sys, t, x, u);
    Md_nom = spdiags(Mnom, 0.0, n_d, n_d);
end % function
