function [status, c_err_string, T] = ne_diagnose_internal(sys, t, x, u, problem_string_alg_only, problem_string_including_special, known_variables, special_equations)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    c_err_id = '';
    % 13 15
    x = x(:);
    u = u(:);
    [J, is_linear] = ne_dae_DXF(sys, t, x, u);
    [m, n] = size(J);
    if ne(m, n)
        error('ne_pre_dc_diagnose: internal error: unexpected Jacobian matrix size');
    end % if
    num_known = length(known_variables);
    J(known_variables, :) = sparse(num_known, n);
    J(known_variables, known_variables) = speye(num_known, num_known);
    % 24 26
    is_general = cell2mat(cellhorzcat(sys.EquationData.general));
    is_external_or_ref = ne_get_is_external_or_ref(sys, t, x, u);
    is_sensor = ne_get_is_sensor(sys);
    is_special = zeros(1.0, n);
    is_special(special_equations) = 1.0;
    is_known = zeros(1.0, n);
    is_known(known_variables) = 1.0;
    if any(and(is_special, not(is_general)))
        % 33 35
        error('ne_diagnose_internal: internal error: there should be no special topology equations');
    end % if
    is_linear_or_known = or(is_known, is_linear);
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    order_vec = horzcat(find(and(is_linear_or_known, not(is_general))), find(and(and(and(is_linear_or_known, is_general), not(is_special)), is_external_or_ref)), find(and(and(and(and(is_linear_or_known, is_general), not(is_special)), not(is_external_or_ref)), is_sensor)), find(and(and(and(and(is_linear_or_known, is_general), not(is_special)), not(is_external_or_ref)), not(is_sensor))), find(and(and(is_linear_or_known, is_special), is_external_or_ref)), find(and(and(and(is_linear_or_known, is_special), not(is_external_or_ref)), is_sensor)), find(and(and(and(is_linear_or_known, is_special), not(is_external_or_ref)), not(is_sensor))));
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    if ne(length(unique(order_vec)), length(order_vec))
        error('ne_diagnose_internal: internal error: repeated rows in order_vec');
    end % if
    % 56 59
    % 57 59
    [leftMatrix, rightMatrix, leftMult, rightMult] = ne_compute_scaling_factors(J(order_vec, :));
    J(order_vec, :) = mtimes(mtimes(leftMatrix, J(order_vec, :)), rightMatrix);
    % 60 62
    [indrows, deprows, T] = ne_findindrows(J, order_vec);
    % 62 65
    % 63 65
    c_err_string = '';
    status = mtimes(1.0, gt(length(deprows), 0.0));
    for i=1.0:length(deprows)
        if eq(T(i, deprows(i)), 0.0)
            error('internal error: bad T structure.');
        end % if
        % 70 72
        [one_err_string, topology_only] = ne_get_one_err_string(T(i, :), is_general, ctranspose(cellhorzcat(sys.equationData.object)));
        % 72 74
        if topology_only
            problem_string = '';
        else
            if any(T(i, special_equations))
                problem_string = problem_string_including_special;
            else
                problem_string = problem_string_alg_only;
            end % if
        end % if
        one_err_string = horzcat(problem_string, one_err_string);
        c_err_string = horzcat(c_err_string, sprintf(horzcat(one_err_string, '\n')));
    end % for
end % function
