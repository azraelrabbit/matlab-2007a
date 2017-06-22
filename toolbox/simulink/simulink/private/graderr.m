function graderr(finite_diff_deriv, analytic_deriv, evalstr2)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    err = max(max(abs(minus(analytic_deriv, finite_diff_deriv))));
    disp(sprintf('Maximum discrepancy between derivatives  = %g', err));
    if gt(err, plus(mtimes(1e-06, norm(analytic_deriv)), 1e-05))
        disp('Warning: Derivatives do not match within tolerance')
        disp('Derivative from finite difference calculation:')
        finite_diff_deriv
        disp(horzcat('User-supplied derivative, ', evalstr2, ' : '))
        analytic_deriv
        disp('Difference:')
        minus(analytic_deriv, finite_diff_deriv)
        disp('Strike any key to continue or Ctrl-C to abort')
        pause
    end % if
end % function
