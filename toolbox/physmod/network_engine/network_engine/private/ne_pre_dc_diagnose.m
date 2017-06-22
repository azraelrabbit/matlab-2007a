function [status, c_err_id, c_err_string] = ne_pre_dc_diagnose(sys, t, x, u)
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
    % 12 14
    x = x(:);
    u = u(:);
    known_variables = zeros(1.0, 0.0);
    [dummy, num_diff] = ne_dae_M(sys, t, x, u);
    special_equations = 1.0:num_diff;
    problem_string_alg_only = 'Warning: equations of one or more components may be dependent or inconsistent. This can cause problems in computing a consistent initial state to start the simulation. Here is the set of components involved:\n';
    % 19 21
    problem_string_including_special = 'Warning: problems possible for steady-state solve, due to equations of one or more components. Consider starting the simulation without a steady-state solve by unchecking the steady-state checkbox on the solver block. Here is the set of components involved:\n';
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    [status, c_err_string] = ne_diagnose_internal(sys, t, x, u, problem_string_alg_only, problem_string_including_special, known_variables, special_equations);
    % 26 28
    if ne(status, 0.0)
        c_err_id = 'network_engine:ne_pre_ic_diagnose:ProblemDiagnosed';
    end % if
end % function
