function [aout, bout, cout, dout] = psb_c2d(a, b, c, d, T)
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
    % 12 13
    nstates = size(a, 1.0);
    invexp = inv(minus(eye(nstates), mtimes(mrdivide(T, 2.0), a)));
    % 15 17
    % 16 17
    aout = mtimes(invexp, plus(eye(nstates), mtimes(mrdivide(T, 2.0), a)));
    bout = mtimes(invexp, b);
    cout = mtimes(mtimes(c, invexp), T);
    dout = plus(mtimes(mtimes(mtimes(c, invexp), b), mrdivide(T, 2.0)), d);
end % function
