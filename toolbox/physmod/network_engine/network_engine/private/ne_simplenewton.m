function y = ne_simplenewton(y0, forcingFunction, jacobianFunction, fnormtol)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    deBug = not(isempty(dbstatus));
    y = y0;
    % 8 10
    dely = 0.0;
    % 10 12
    r = forcingFunction(y);
    if eq(norm(r), 0.0)
        return;
    end % if
    for i=1.0:100.0
        lambda = 1.0;
        for j=1.0:3.0
            if lt(norm(r), fnormtol)
                return;
            end % if
            J = jacobianFunction(y);
            dely = mldivide(uminus(J), r);
            if deBug
                i
                j
                y
                r
                dely
            end % if
            ytest = plus(y, mtimes(lambda, dely));
            oldnorm = norm(r);
            r = forcingFunction(ytest);
            if deBug
                ytest
                r
            end % if
            if lt(norm(r), mtimes(.9, oldnorm))
                break
            end % if
            lambda = mrdivide(lambda, 2.0);
        end % for
        y = ytest;
    end % for
    error('nes:NewtonNotConverged', 'maximum Newton iteration number reached without convergence');
end % function
