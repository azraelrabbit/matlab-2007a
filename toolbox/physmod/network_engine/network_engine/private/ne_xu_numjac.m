function Jval = ne_xu_numjac(dsmethod, sys, t, x, u)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pert = 1e-05;
    x = ctranspose(x(:));
    u = ctranspose(u(:));
    % 9 10
    Fnom = feval(dsmethod, sys, t, x, u);
    xu = horzcat(x, u);
    Jval = sparse(length(Fnom), length(xu));
    for i=1.0:length(xu)
        temp = xu(i);
        xu(i) = plus(xu(i), pert);
        x = xu(1.0:length(x));
        u = xu(plus(length(x), 1.0):end);
        Fpert = feval(dsmethod, sys, t, x, u);
        Jval(:, i) = mrdivide(minus(Fpert, Fnom), pert);
        xu(i) = temp;
    end % for
end % function
