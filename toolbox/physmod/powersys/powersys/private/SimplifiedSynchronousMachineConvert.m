function [nom, mecpu, Zpu, initpu] = SimplifiedSynchronousMachineConvert(nom, mec, Z, InitialConditions)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    Pn = nom(1.0);
    Vn = nom(2.0);
    fn = nom(3.0);
    wen = mtimes(mtimes(fn, 2.0), 3.141592653589793);
    ib = mrdivide(mtimes(sqrt(.6666666666666666), Pn), Vn);
    Zb = mrdivide(mpower(Vn, 2.0), Pn);
    % 17 18
    p = mec(3.0);
    mecpu = horzcat(mrdivide(mtimes(mpower(mrdivide(wen, p), 2.0), mec(1.0)), mtimes(2.0, Pn)), mec(2.0), p);
    % 20 21
    Zpu = horzcat(mrdivide(Z(1.0), Zb), mtimes(mrdivide(Z(2.0), Zb), wen));
    % 22 23
    switch length(InitialConditions)
    case 8.0
        initpu = horzcat(InitialConditions(1.0), InitialConditions(2.0), mrdivide(InitialConditions(3.0:5.0), ib), InitialConditions(6.0:8.0));
    case 9.0
        initpu = horzcat(InitialConditions(1.0), InitialConditions(2.0), mrdivide(InitialConditions(3.0:5.0), ib), InitialConditions(6.0:9.0));
    end % switch
    iounits = 'on';
end % function
