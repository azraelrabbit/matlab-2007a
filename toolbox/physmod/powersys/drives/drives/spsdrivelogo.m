function [X1, X1m, X2, X2m, X3, X4, Y1, Y1m, Y2, Y2m, Y3, Y4, color1, color2] = spsdrivelogo
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    R = .15;
    a = .5;
    b = .6;
    c1 = [200.0 255.0 180.0];
    c2 = [120.0 220.0 255.0];
    d = .01;
    % 25 26
    X0 = uminus(R):d:R;
    Y0 = uminus(R):d:R;
    % 28 29
    for i=1.0:size(X0, 2.0)
        Y0(i) = sqrt(minus(mpower(R, 2.0), mpower(X0(i), 2.0)));
    end % for
    % 32 33
    X1 = plus(X0, a);
    Y1 = plus(Y0, b);
    X1m = X1;
    Y1m = plus(uminus(Y0), b);
    % 37 38
    X2 = plus(mrdivide(X0, 2.0), a);
    Y2 = plus(mrdivide(Y0, 2.0), b);
    X2m = X2;
    Y2m = plus(mrdivide(uminus(Y0), 2.0), b);
    % 42 43
    X3 = horzcat(a, minus(a, R), minus(a, R), a);
    Y3 = horzcat(b, plus(b, R), minus(b, R), b);
    % 45 46
    X4 = horzcat(minus(a, R), plus(a, R), a, a, a, a, plus(a, R));
    Y4 = horzcat(b, b, b, plus(b, R), minus(b, R), b, minus(b, R));
    % 48 49
    color1 = horzcat(mrdivide(c1(1.0), 255.0), mrdivide(c1(2.0), 255.0), mrdivide(c1(3.0), 255.0));
    color2 = horzcat(mrdivide(c2(1.0), 255.0), mrdivide(c2(2.0), 255.0), mrdivide(c2(3.0), 255.0));
end % function
