function [sps, YuNonlinear] = ThreePhaseDynamicLoadBlock(nl, sps, YuNonlinear)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    idx = nl.filter_type('Three-Phase Dynamic Load');
    sps.NbMachines = plus(sps.NbMachines, length(idx));
    NbOut = length(sps.outstr);
    % 12 13
    for i=1.0:length(idx)
        % 14 15
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        j = sqrt(-1.0);
        [NominalVoltage, ActiveReactivePowers, PositiveSequence] = getSPSmaskvalues(block, {'NominalVoltage','ActiveReactivePowers','PositiveSequence'});
        blocinit(block, cellhorzcat(NominalVoltage, ActiveReactivePowers, PositiveSequence));
        % 22 23
        Vnom = NominalVoltage(1.0);
        fnom = NominalVoltage(2.0);
        P0 = ActiveReactivePowers(1.0);
        Q0 = ActiveReactivePowers(2.0);
        Mag_V0 = PositiveSequence(1.0);
        Pha_V0 = PositiveSequence(2.0);
        V0_d = mtimes(Mag_V0, cos(mrdivide(mtimes(Pha_V0, 3.141592653589793), 180.0)));
        V0_q = mtimes(Mag_V0, sin(mrdivide(mtimes(Pha_V0, 3.141592653589793), 180.0)));
        Vbase = mtimes(mrdivide(Vnom, sqrt(3.0)), sqrt(2.0));
        I1_init = mtimes(mrdivide(mrdivide(minus(P0, mtimes(j, Q0)), mtimes(minus(V0_d, mtimes(j, V0_q)), Vnom)), sqrt(3.0)), sqrt(2.0));
        Ia0 = abs(I1_init);
        phiIa0 = mrdivide(mtimes(angle(I1_init), 180.0), 3.141592653589793);
        Ib0 = Ia0;
        phiIb0 = minus(phiIa0, 120.0);
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        % 41 42
        nodes = nl.block_nodes(block);
        % 43 44
        sps.source = vertcat(horzcat(sps.source), horzcat(nodes(1.0), nodes(3.0), 1.0, Ia0, phiIa0, fnom, 21.0), horzcat(nodes(2.0), nodes(3.0), 1.0, Ib0, phiIb0, fnom, 21.0));
        % 45 49
        % 46 49
        % 47 49
        % 48 49
        sps.srcstr{plus(end, 1.0)} = horzcat('I_A: ', BlockNom);
        sps.srcstr{plus(end, 1.0)} = horzcat('I_B: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_AB: ', BlockNom);
        sps.outstr{plus(end, 1.0)} = horzcat('U_BC: ', BlockNom);
        sps.sourcenames(plus(end, 1.0):plus(end, 2.0), 1.0) = vertcat(block, block);
        YuNonlinear(plus(end, 1.0):plus(end, 2.0), 1.0:2.0) = vertcat(horzcat(nodes(1.0), nodes(2.0)), horzcat(nodes(2.0), nodes(3.0)));
        % 55 56
        NbOut = plus(NbOut, 2.0);
        % 57 58
        xc = size(sps.modelnames{21.0}, 2.0);
        sps.modelnames{21.0}(plus(xc, 1.0)) = block;
        % 60 62
        % 61 62
        ysrc = minus(size(sps.source, 1.0), 1.0);
        sps.InputsNonZero(plus(end, 1.0):plus(end, 2.0)) = horzcat(ysrc, plus(ysrc, 1.0));
        % 64 66
        % 65 66
        LoadFlowParameters = eval(get_param(getfullname(block), 'LoadFlowParameters'));
        ymac = plus(size(sps.machines, 2.0), 1.0);
        % 68 69
        if eq(LoadFlowParameters(3.0), 0.0)
            LoadFlowParameters(3.0) = Vnom;
        end % if
        % 72 73
        MachineFullName = getfullname(block);
        sps.machines(ymac).name = MachineFullName(sps.syslength:end);
        sps.machines(ymac).nominal = cellhorzcat(0.0, NaN, Vnom, NaN, fnom);
        sps.machines(ymac).type = 35.0;
        sps.machines(ymac).terminals = 3.0;
        sps.machines(ymac).bustype = LoadFlowParameters(1.0);
        sps.machines(ymac).input = ysrc;
        sps.machines(ymac).output = minus(NbOut, 1.0);
        sps.machines(ymac).P = LoadFlowParameters(2.0);
        sps.machines(ymac).Q = LoadFlowParameters(5.0);
        sps.machines(ymac).Vt = LoadFlowParameters(3.0);
        sps.machines(ymac).Phase = LoadFlowParameters(4.0);
        sps.machines(ymac).Ef = NaN;
        sps.machines(ymac).Pmec = NaN;
        sps.machines(ymac).slip = NaN;
        sps.machines(ymac).torque = NaN;
        sps.machines(ymac).SourceBlock1 = {[],[],[],[]};
        sps.machines(ymac).SourceBlock2 = {[],[],[],[]};
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.NonlinearDevices.Demux(plus(end, 1.0)) = 2.0;
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
        sps.U.Mux(plus(end, 1.0)) = 2.0;
    end % for
    % 96 97
    sps.nbmodels(21.0) = size(sps.modelnames{21.0}, 2.0);
end % function
