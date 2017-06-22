function boolvec = ne_get_is_external_or_ref(sys, t, x, u)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    % 12 13
    B = ne_tosparse(sys.B_P(t, x, u));
    DUF1 = ne_tosparse(sys.DUF1_P(t, x, u));
    DUF2 = ne_tosparse(sys.DUF2_P(t, x, u));
    input_dep_struct = plus(B, vertcat(DUF1, DUF2));
    boolvec = ctranspose(full(any(input_dep_struct, 2.0)));
    equation_names = cellhorzcat(sys.equationData.path);
    for i=1.0:length(equation_names)
        if strfind(equation_names{i}, 'Reference')
            boolvec(i) = 1.0;
        end % if
    end % for
end % function
