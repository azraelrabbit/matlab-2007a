function [status, c_err_id, c_err_string] = ne_pre_ic_diagnose(sys, t, x, u)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    c_err_id = '';
    x = x(:);
    u = u(:);
    [algEqns, known_variables] = ne_get_ic_indices(sys, t, x, u);
    problem_string_alg_only = 'Warning: equations of one or more components may be dependent or inconsistent. This could cause problems in computing a consistent initial state to start the simulation. Here is the set of components involved:\n';
    % 16 18
    problem_string_including_special = problem_string_alg_only;
    special_equations = known_variables;
    [status, c_err_string] = ne_diagnose_internal(sys, t, x, u, problem_string_alg_only, problem_string_including_special, known_variables, special_equations);
    % 20 22
    if ne(status, 0.0)
        c_err_id = 'network_engine:ne_pre_ic_diagnose:ProblemDiagnosed';
    end % if
end % function
