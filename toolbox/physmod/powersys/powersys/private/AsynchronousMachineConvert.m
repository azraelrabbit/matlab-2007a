function [nom, stapu, rotpu, mutpu, mecpu, InitialConditionspu, satpu] = AsynchronousMachineConvert(nom, sta, rot, mut, mec, InitialConditions, simsat, sat)
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
    Pn = nom(1.0);
    Vn = nom(2.0);
    fn = nom(3.0);
    wen = mtimes(mtimes(fn, 2.0), 3.141592653589793);
    ib = mrdivide(mtimes(sqrt(.6666666666666666), Pn), Vn);
    Zb = mrdivide(mpower(Vn, 2.0), Pn);
    Lb = mrdivide(Zb, wen);
    % 18 20
    p = mec(3.0);
    mecpu = horzcat(mrdivide(mtimes(mpower(mrdivide(wen, p), 2.0), mec(1.0)), mtimes(2.0, Pn)), mrdivide(mtimes(mec(2.0), mpower(mrdivide(wen, p), 2.0)), Pn), p);
    % 21 24
    % 22 24
    stapu = rdivide(sta, horzcat(Zb, Lb));
    rotpu = rdivide(rot, horzcat(Zb, Lb));
    mutpu = mrdivide(mut, Lb);
    % 26 29
    % 27 29
    if simsat
        Currents = mtimes(sat(1.0, :), sqrt(2.0));
        satpu = vertcat(rdivide(Currents, ib), rdivide(sat(2.0, :), Vn));
    else
        % 32 34
        satpu = sat;
    end % if
    % 35 38
    % 36 38
    switch length(InitialConditions)
    case 8.0
        InitialConditionspu = rdivide(InitialConditions, horzcat(1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0));
    case 9.0
        InitialConditionspu = rdivide(InitialConditions, horzcat(1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0, 1.0));
    case 14.0
        InitialConditionspu = rdivide(InitialConditions, horzcat(1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0));
    case 15.0
        InitialConditionspu = rdivide(InitialConditions, horzcat(1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0, ib, ib, ib, 1.0, 1.0, 1.0, 1.0));
    otherwise
        % 47 49
        InitialConditionspu = InitialConditions;
    end % switch
    iounits = 'on';
end % function
