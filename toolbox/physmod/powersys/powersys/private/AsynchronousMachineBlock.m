function [sps, YuNonlinear] = AsynchronousMachineBlock(nl, sps, YuNonlinear)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    idx = nl.filter_type('Asynchronous Machine');
    sps.NbMachines = plus(sps.NbMachines, length(idx));
    NbOut = length(sps.outstr);
    % 11 13
    for i=1.0:length(idx)
        block = nl.elements(idx(i));
        SPSVerifyLinkStatus(block);
        BlockName = getfullname(block);
        % 16 18
        if strcmp('on', sps.PowerguiInfo.HookPort)
            AsynchronousMachineInit(BlockName, sps.PowerguiInfo.BlockName);
        end % if
        BlockNom = strrep(BlockName(sps.syslength:end), char(10.0), ' ');
        [NominalParameters, Mechanical, InitialConditions, LoadFlowParameters] = getSPSmaskvalues(block, {'NominalParameters','Mechanical','InitialConditions','LoadFlowParameters'});
        RotorType = get_param(block, 'RotorType');
        % 23 25
        Units = get_param(block, 'Units');
        SlipMask = InitialConditions(1.0);
        npp = Mechanical(3.0);
        % 27 30
        % 28 30
        Pn = NominalParameters(1.0);
        Vn = NominalParameters(2.0);
        ibase = mrdivide(mtimes(sqrt(.6666666666666666), Pn), Vn);
        Ia0 = mtimes(InitialConditions(3.0), ibase);
        Ib0 = mtimes(InitialConditions(4.0), ibase);
        if eq(length(InitialConditions), 14.0)
            % 35 37
            Ia0r = mtimes(InitialConditions(9.0), ibase);
            phia0r = InitialConditions(12.0);
            Ib0r = mtimes(InitialConditions(10.0), ibase);
            phib0r = InitialConditions(13.0);
        else
            Ia0r = 0.0;
            phia0r = 0.0;
            Ib0r = 0.0;
            phib0r = 0.0;
        end % if
        % 46 48
        phia0 = InitialConditions(6.0);
        phib0 = InitialConditions(7.0);
        MachineFrequency = NominalParameters(3.0);
        % 50 52
        xc = size(sps.modelnames{15.0}, 2.0);
        sps.modelnames{15.0}(plus(xc, 1.0)) = block;
        % 53 60
        % 54 60
        % 55 60
        % 56 60
        % 57 60
        % 58 60
        nodes = nl.block_nodes(block);
        % 60 62
        if strcmp(RotorType, 'Wound')
            % 62 64
            NotAllowedForPhasorSimulation(sps.PowerguiInfo.Phasor, BlockName, 'Asynchronous Machine Wound Rotor');
            % 64 67
            % 65 67
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 4.0;
            sps.U.Mux(plus(end, 1.0)) = 4.0;
            % 68 70
            sps.source = vertcat(horzcat(sps.source), horzcat(nodes(4.0), nodes(6.0), 1.0, Ia0r, phia0r, MachineFrequency, 15.1), horzcat(nodes(5.0), nodes(6.0), 1.0, Ib0r, phib0r, MachineFrequency, 15.1), horzcat(nodes(1.0), nodes(3.0), 1.0, Ia0, phia0, MachineFrequency, 15.2), horzcat(nodes(2.0), nodes(3.0), 1.0, Ib0, phib0, MachineFrequency, 15.2));
            % 70 75
            % 71 75
            % 72 75
            % 73 75
            sps.srcstr{plus(end, 1.0)} = horzcat('I_A_rotor: ', BlockNom);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_B_rotor: ', BlockNom);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_A_stator: ', BlockNom);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_B_stator: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_AB_rotor: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_BC_rotor: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_AB_stator: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_BC_stator: ', BlockNom);
            sps.sourcenames(plus(end, 1.0):plus(end, 4.0), 1.0) = vertcat(block, block, block, block);
            % 83 85
            YuNonlinear(plus(end, 1.0):plus(end, 4.0), 1.0:2.0) = vertcat(horzcat(nodes(4.0), nodes(5.0)), horzcat(nodes(5.0), nodes(6.0)), horzcat(nodes(1.0), nodes(2.0)), horzcat(nodes(2.0), nodes(3.0)));
            NbOut = plus(NbOut, 4.0);
            % 86 88
            ysrc = minus(size(sps.source, 1.0), 3.0);
            sps.InputsNonZero(plus(end, 1.0):plus(end, 4.0)) = horzcat(ysrc, plus(ysrc, 1.0), plus(ysrc, 2.0), plus(ysrc, 3.0));
        else
            % 90 94
            % 91 94
            % 92 94
            sps.NonlinearDevices.Demux(plus(end, 1.0)) = 2.0;
            sps.U.Mux(plus(end, 1.0)) = 2.0;
            % 95 97
            sps.source = vertcat(horzcat(sps.source), horzcat(nodes(1.0), nodes(3.0), 1.0, Ia0, phia0, MachineFrequency, 15.2), horzcat(nodes(2.0), nodes(3.0), 1.0, Ib0, phib0, MachineFrequency, 15.2));
            % 97 100
            % 98 100
            sps.srcstr{plus(end, 1.0)} = horzcat('I_A_stator: ', BlockNom);
            sps.srcstr{plus(end, 1.0)} = horzcat('I_B_stator: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_AB: ', BlockNom);
            sps.outstr{plus(end, 1.0)} = horzcat('U_BC: ', BlockNom);
            sps.sourcenames(plus(end, 1.0):plus(end, 2.0), 1.0) = vertcat(block, block);
            % 104 106
            YuNonlinear(plus(end, 1.0):plus(end, 2.0), 1.0:2.0) = vertcat(horzcat(nodes(1.0), nodes(2.0)), horzcat(nodes(2.0), nodes(3.0)));
            NbOut = plus(NbOut, 2.0);
            % 107 109
            ysrc = minus(size(sps.source, 1.0), 1.0);
            sps.InputsNonZero(plus(end, 1.0):plus(end, 2.0)) = horzcat(ysrc, plus(ysrc, 1.0));
        end % if
        % 111 114
        % 112 114
        ymac = plus(size(sps.machines, 2.0), 1.0);
        ysrc = minus(size(sps.source, 1.0), 1.0);
        % 115 118
        % 116 118
        ports = get_param(block, 'PortConnectivity');
        % 118 120
        [sourceblk1, sourceport1] = BlockSearch(ports(1.0), block, 1.0);
        sps.machines(ymac).SourceBlock1 = {[],[]};
        sps.machines(ymac).SourceBlock2 = {[],[]};
        if lt(sourceblk1, 0.0)
            sps.machines(ymac).SourceBlock1 = cellhorzcat(abs(sourceblk1), sourceport1);
        else
            if strcmp('line', get_param(sourceblk1, 'type'))
                sps.machines(ymac).SourceBlock1{1.0} = [];
                sps.machines(ymac).SourceBlock1{2.0} = [];
            else
                if strcmp(get_param(sourceblk1, 'BlockType'), 'Constant')
                    sps.machines(ymac).SourceBlock1 = cellhorzcat(abs(sourceblk1), 'Value');
                end % if
                if strcmp(get_param(sourceblk1, 'BlockType'), 'Step')
                    sps.machines(ymac).SourceBlock1 = cellhorzcat(abs(sourceblk1), 'Before');
                end % if
            end % if
            % 136 138
        end % if
        MachineFullName = getfullname(block);
        sps.machines(ymac).name = MachineFullName(sps.syslength:end);
        sps.machines(ymac).nominal = cellhorzcat(eval(Units), NominalParameters(1.0), NominalParameters(2.0), npp, MachineFrequency);
        sps.machines(ymac).type = 33.0;
        sps.machines(ymac).terminals = 3.0;
        sps.machines(ymac).bustype = 3.0;
        sps.machines(ymac).input = ysrc;
        sps.machines(ymac).output = minus(NbOut, 1.0);
        sps.machines(ymac).P = [];
        sps.machines(ymac).Q = [];
        sps.machines(ymac).Vt = [];
        sps.machines(ymac).Phase = 0.0;
        sps.machines(ymac).Ef = [];
        sps.machines(ymac).Pmec = LoadFlowParameters;
        sps.machines(ymac).slip = SlipMask;
        sps.machines(ymac).torque = mrdivide(mtimes(120.0, MachineFrequency), mtimes(2.0, npp));
        sps.NonlinearDevices.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/From'), 'GotoTag');
        sps.U.Tags{plus(end, 1.0)} = get_param(horzcat(BlockName, '/Goto'), 'GotoTag');
    end % for
    sps.nbmodels(15.0) = size(sps.modelnames{15.0}, 2.0);
