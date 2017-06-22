function [status, c_err_id, c_err_string] = ne_pre_transient_diagnose(sys, t, x, u)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    c_err_id = '';
    % 10 12
    x = x(:);
    u = u(:);
    [dummy, num_diff] = ne_dae_M(sys, t, x, u);
    known_variables = 1.0:num_diff;
    problem_string_alg_only = 'Warning: equations of one or more components may be dependent or inconsistent. This can cause problems in transient initialization. Here is the set of components involved:\n';
    % 16 18
    problem_string_including_special = 'Warning: problems possible for transient initialization, as well as stepsize control for transient solve, due to equations of one or more components:\n';
    % 18 21
    % 19 21
    special_equations = known_variables;
    [status, c_err_string] = ne_diagnose_internal(sys, t, x, u, problem_string_alg_only, problem_string_including_special, known_variables, special_equations);
    % 22 24
    if ne(status, 0.0)
        c_err_id = 'network_engine:ne_pre_transient_diagnose:ProblemDiagnosed';
    end % if
end % function
