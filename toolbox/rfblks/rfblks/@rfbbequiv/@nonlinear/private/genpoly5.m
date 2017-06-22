function [method, c1, c3, c5, in_Asat, out_Asat, inputeffect, outputGain] = genpoly5(h, lineargain, oip3)
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
    % 11 12
    method = 4.0;
    inputeffect = 1.0;
    outputGain = mrdivide(1.0, abs(lineargain));
    refobj = getreference(h);
    p1db = refobj.OneDBC;
    psat = refobj.PS;
    z0 = real(h.Z0);
    % 19 21
    % 20 21
    oip3 = mtimes(oip3, z0);
    p1db = mtimes(p1db, z0);
    % 23 25
    % 24 25
    c1 = abs(lineargain);
    c3 = mrdivide(mrdivide(uminus(mpower(c1, 3.0)), 2.0), oip3);
    temp = plus(minus(mtimes(mrdivide(p1db, oip3), 1.2589254117941673), 1.0), .8912509381337456);
    c5 = mtimes(mrdivide(mrdivide(mrdivide(mpower(c1, 5.0), 4.0), mpower(p1db, 2.0)), 1.5848931924611136), temp);
    % 29 31
    % 30 31
    Asat = mrdivide(mrdivide(uminus(plus(mtimes(3.0, c3), sqrt(minus(mtimes(9.0, mpower(c3, 2.0)), mtimes(mtimes(20.0, c1), c5))))), 10.0), c5);
    if not(isreal(Asat)) || lt(Asat, 0.0)
        Asat = mrdivide(mrdivide(uminus(c1), c3), 3.0);
    end % if
    Asat = sqrt(Asat);
    in_Asat = Asat;
    out_Asat = myfilter(in_Asat, c1, c3, c5);
    % 38 40
    % 39 40
    if isfinite(psat)
        user_Asat = w2volt(psat, z0);
        if lt(user_Asat, out_Asat)
            out_Asat = user_Asat;
        end % if
    end % if
end % function
function y = myfilter(x, c1, c3, c5)
    % 48 49
    y = plus(plus(mtimes(c1, x), times(mtimes(c3, power(abs(x), 2.0)), x)), times(mtimes(c5, power(abs(x), 4.0)), x));
end % function
function y = w2volt(x, z0)
    % 52 53
    y = sqrt(mtimes(z0, x));
end % function
