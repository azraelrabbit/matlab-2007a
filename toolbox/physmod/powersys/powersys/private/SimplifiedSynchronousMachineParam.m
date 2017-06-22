function [Pb, Nb, Vb, Vb2, Vb3, ib, ib2, web, H, Kd, p, pi23, R, X, io, dwo, tho] = SimplifiedSynchronousMachineParam(nom, mec, Z, InitialConditions, iounits)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    Pn = nom(1.0);
    Vn = nom(2.0);
    MachineFrequency = nom(3.0);
    Kd = mec(2.0);
    R = Z(1.0);
    X = Z(2.0);
    p = mec(3.0);
    web = mtimes(mtimes(MachineFrequency, 2.0), 3.141592653589793);
    wmn = mrdivide(web, p);
    pi23 = 2.0943951023931953;
    Vb = mtimes(sqrt(.6666666666666666), Vn);
    ib = mrdivide(mtimes(sqrt(.6666666666666666), Pn), Vn);
    % 22 23
    switch length(InitialConditions)
    case 8.0
        % 25 26
        LoadFlowFrequency = MachineFrequency;
    case 9.0
        % 28 30
        % 29 30
        LoadFlowFrequency = InitialConditions(end);
    otherwise
        % 32 33
        LoadFlowFrequency = MachineFrequency;
    end % switch
    % 35 36
    dwo = mrdivide(InitialConditions(1.0), 100.0);
    tho = mrdivide(mtimes(InitialConditions(2.0), 3.141592653589793), 180.0);
    H = mec(1.0);
    % 39 40
    if iounits
        Pb = Pn;
        Nb = wmn;
        Vb2 = Vn;
        Vb3 = Vb;
        ib2 = ib;
    else
        Pb = 1.0;
        Nb = 1.0;
        Vb2 = 1.0;
        Vb3 = 1.0;
        ib2 = 1.0;
    end % if
    % 53 54
    d2r = .017453292519943295;
    iao = InitialConditions(3.0);
    ibo = InitialConditions(4.0);
    ico = InitialConditions(5.0);
    phao = mtimes(InitialConditions(6.0), d2r);
    phbo = mtimes(InitialConditions(7.0), d2r);
    phco = mtimes(InitialConditions(8.0), d2r);
    [scrap, iao] = pol2cart(phao, iao);
    [scrap, ibo] = pol2cart(phbo, ibo);
    [scrap, ico] = pol2cart(phco, ico);
    io = horzcat(iao, ibo, ico);
end % function
