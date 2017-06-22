function [MainWindingStator, MainWindingRotor, MutualInductance, AuxiliaryWinding, Mechanical, CapacitorStart, CapacitorRun] = SinglePhaseAsynchronousMachineConvert(block, UNITS)
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
    NominalParameters = getSPSmaskvalues(block, {'NominalParameters'}, 0.0, 1.0);
    % 14 15
    MainWindingStator = getSPSmaskvalues(block, {'MainWindingStator'}, 0.0, 1.0);
    MainWindingRotor = getSPSmaskvalues(block, {'MainWindingRotor'}, 0.0, 1.0);
    MutualInductance = getSPSmaskvalues(block, {'MutualInductance'}, 0.0, 1.0);
    AuxiliaryWinding = getSPSmaskvalues(block, {'AuxiliaryWinding'}, 0.0, 1.0);
    Mechanical = getSPSmaskvalues(block, {'Mechanical'}, 0.0, 1.0);
    CapacitorStart = getSPSmaskvalues(block, {'CapacitorStart'}, 0.0, 1.0);
    CapacitorRun = getSPSmaskvalues(block, {'CapacitorRun'}, 0.0, 1.0);
    % 22 23
    Pn = NominalParameters(1.0);
    Vn = NominalParameters(2.0);
    freq = NominalParameters(3.0);
    p = Mechanical(3.0);
    % 27 28
    web_psb = mtimes(6.283185307179586, freq);
    wmb = mrdivide(web_psb, p);
    Tn = mrdivide(Pn, wmb);
    Vb = mtimes(sqrt(2.0), Vn);
    ib = mrdivide(mtimes(sqrt(2.0), Pn), Vn);
    phib = mrdivide(Vb, web_psb);
    Zb = mrdivide(mpower(Vn, 2.0), Pn);
    Lb = mrdivide(Zb, web_psb);
    Cb = mrdivide(1.0, mtimes(Zb, web_psb));
    % 37 38
    if strcmp(UNITS, 'pu')
        % 39 40
        MainWindingStator = horzcat(mrdivide(MainWindingStator(1.0), Zb), mrdivide(MainWindingStator(2.0), Lb));
        MainWindingRotor = horzcat(mrdivide(MainWindingRotor(1.0), Zb), mrdivide(MainWindingRotor(2.0), Lb));
        MutualInductance = mrdivide(MutualInductance, Lb);
        AuxiliaryWinding = horzcat(mrdivide(AuxiliaryWinding(1.0), Zb), mrdivide(AuxiliaryWinding(2.0), Lb));
        J = Mechanical(1.0);
        F = Mechanical(2.0);
        p = Mechanical(3.0);
        N = Mechanical(4.0);
        H = mrdivide(mtimes(J, mpower(wmb, 2.0)), mtimes(2.0, Pn));
        F = mrdivide(F, mrdivide(Pn, mpower(wmb, 2.0)));
        Mechanical = horzcat(H, F, p, N);
        CapacitorStart = horzcat(mrdivide(CapacitorStart(1.0), Zb), mrdivide(CapacitorStart(2.0), Cb));
        CapacitorRun = horzcat(mrdivide(CapacitorRun(1.0), Zb), mrdivide(CapacitorRun(2.0), Cb));
    end % if
    % 54 55
    if strcmp(UNITS, 'SI')
        % 56 57
        MainWindingStator = horzcat(mtimes(MainWindingStator(1.0), Zb), mtimes(MainWindingStator(2.0), Lb));
        MainWindingRotor = horzcat(mtimes(MainWindingRotor(1.0), Zb), mtimes(MainWindingRotor(2.0), Lb));
        MutualInductance = mtimes(MutualInductance, Lb);
        AuxiliaryWinding = horzcat(mtimes(AuxiliaryWinding(1.0), Zb), mtimes(AuxiliaryWinding(2.0), Lb));
        H = Mechanical(1.0);
        F = Mechanical(2.0);
        p = Mechanical(3.0);
        N = Mechanical(4.0);
        J = mrdivide(mtimes(mtimes(H, 2.0), Pn), mpower(wmb, 2.0));
        F = mtimes(F, mrdivide(Pn, mpower(wmb, 2.0)));
        Mechanical = horzcat(J, F, p, N);
        CapacitorStart = horzcat(mtimes(CapacitorStart(1.0), Zb), mtimes(CapacitorStart(2.0), Cb));
        CapacitorRun = horzcat(mtimes(CapacitorRun(1.0), Zb), mtimes(CapacitorRun(2.0), Cb));
    end % if
end % function
