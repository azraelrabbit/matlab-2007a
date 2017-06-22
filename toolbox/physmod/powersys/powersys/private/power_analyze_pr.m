function varargout = power_analyze_pr(system, options)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(nargin, 0.0)
        error('Not enough input arguments.')
    end
    if ne(exist(system), 4.0)
        error(horzcat('There is no system named ''', system, ''' to open.'));
    end
    if isempty(find_system('name', system))
        open_system(system);
    end
    if not(exist('options', 'var'))
        options = 'version 3';
    end
    % 21 24
    % 22 24
    if findstr(options, 'V2')
        disp('The power2sys command is obsolete.');
        return
    end
    % 27 29
    powersysdomain_netlist('clear', 2.0);
    n = powersysdomain_netlist('SPSnetlist', system);
    sps = psbsort(n, system);
    % 31 33
    sps.SilentMode = 1.0;
    commandLine = 0.0;
    % 34 37
    % 35 37
    OldOptions = or(strcmp(options, 'n'), strcmp(options, 'o'));
    sps.CreateNetList = or(OldOptions, strcmp(options, 'net'));
    if OldOptions
        warning('SimPowerSystems:PowerAnalyze:ObsoleteInputArgument', 'Use of ''%s'' option in power_analyze function is obsolete. Use the ''net'' option to generate a netlist.', options);
        % 40 42
    end
    % 42 45
    % 43 45
    if strcmp(options, 'sort')
        % 45 47
        psbp.Circuit = sps.circuit;
        psbp.SampleTime = sps.PowerguiInfo.Ts;
        psbp.RlcBranch = sps.rlc;
        psbp.RlcBranchNames = sps.rlcnames;
        psbp.SourceBranch = sps.source;
        psbp.SourceBranchNames = sps.sourcenames;
        psbp.InputNames = sps.srcstr;
        psbp.OutputNames = sps.outstr;
        psbp.OutputExpressions = sps.yout;
        psbp.OutputMatrix = sps.Outputs;
        psbp.MeasurementBlocks = sps.measurenames;
        psbp.LoadFlowParameters = sps.machines;
        psbp.IdealSwitch = sps.IdealSwitch;
        psbp.Breaker = sps.Breaker;
        psbp.Diode = sps.Diode;
        psbp.Thyristor = sps.Thyristors;
        psbp.GTO = sps.GTO;
        psbp.Mosfet = sps.MOSFET;
        psbp.IGBT = sps.IGBT;
        psbp.SimplifiedSyncMach = sps.nbmodels(13.0);
        psbp.SynchronousMach = sps.nbmodels(14.0);
        psbp.AsynchronousMach = sps.nbmodels(15.0);
        psbp.PMSyncronousMach = sps.nbmodels(16.0);
        psbp.SurgeArrestor = sps.nbmodels(17.0);
        psbp.SaturableTransformer = sps.nbmodels(18.0);
        psbp.DistributedParamLine = sps.DistributedParameterLine;
        psbp.ImpedanceMeasurement = sps.nbmodels(20.0);
        % 73 75
        varargout = cellhorzcat(psbp);
        return
    end
    % 77 80
    % 78 80
    sps = nscinet(sps);
    % 80 83
    % 81 83
    sps.unit = 'OMU';
    sps.freq = 60.0;
    % 84 86
    if sps.CreateNetList
        fid_outfile = fopen(horzcat(sps.circuit, '.net'), 'wt');
    else
        fid_outfile = -1.0;
    end
    % 90 92
    if not(isempty(sps.rlcnames))
        sps.rlcnames = strrep(sps.rlcnames, char(10.0), ' ');
    end
    % 94 96
    NumberOfOutputs = size(sps.yout, 1.0);
    NumberOfSources = size(sps.source, 1.0);
    % 97 100
    % 98 100
    [sps.rlc, liste_neu] = etapar(sps.rlc, sps.switches, sps.source, NumberOfOutputs, 0.0, sps.unit, 1.0, fid_outfile, sps.rlcnames, sps.srcstr);
    % 100 103
    % 101 103
    systemInfo.Outputs = sps.Outputs;
    systemInfo.outstr = sps.yout;
    systemInfo.rlc = sps.rlc;
    systemInfo.source = sps.source;
    systemInfo.vary_name = [];
    systemInfo.vary_val = [];
    systemInfo.nvary = 0.0;
    systemInfo.unit = sps.unit;
    systemInfo.freq_sys = sps.freq;
    systemInfo.liste_neu = liste_neu;
    systemInfo.ytype = sps.ytype;
    systemInfo.rlcnames = sps.rlcnames;
    systemInfo.srcstr = sps.srcstr;
    % 115 117
    [sps.A, sps.B, sps.C, sps.D, statescell] = psb2sys(systemInfo, commandLine, sps.SilentMode, 0.0);
    % 117 119
    NumberOfStatesCell = size(char(statescell), 1.0);
    NumberOfStates = size(sps.A, 1.0);
    % 120 123
    % 121 123
    if lt(NumberOfStates, NumberOfStatesCell)
        for i=plus(NumberOfStates, 1.0):NumberOfStatesCell
            statescell{i} = horzcat(statescell{i}, '*');
        end % for
    end
    % 127 129
    sps.states = char(statescell);
    % 129 132
    % 130 132
    if gt(fid_outfile, 0.0)
        fprintf(fid_outfile, 'Output expressions:\n');
    end
    % 134 136
    for i_sortie=1.0:NumberOfOutputs
        % 136 138
        chaine = sps.yout(i_sortie, :);
        % 138 140
        if eq(sps.ytype(i_sortie), 0.0)
            sortie = horzcat('y_u', int2str(i_sortie));
        else
            if eq(sps.ytype(i_sortie), 1.0)
                sortie = horzcat('y_i', int2str(i_sortie));
            end
        end
        if gt(fid_outfile, 0.0)
            fprintf(fid_outfile, horzcat('\n', sortie, ' = ', chaine{1.0}));
        end
    end % for
    % 150 152
    if not(isempty(sps.switches))
        % 152 154
        sps.rlswitch = horzcat(sps.switches(:, 4.0), sps.switches(:, 5.0));
        sps.rlswitch(:, 2.0) = rdivide(sps.rlswitch(:, 2.0), 1000.0);
    else
        sps.rlswitch = [];
    end
    % 158 160
    if isempty(sps.B)
        sps.B = zeros(NumberOfStates, NumberOfSources);
    end
    if isempty(sps.C)
        sps.C = zeros(NumberOfOutputs, NumberOfStates);
    end
    if isempty(sps.D)
        sps.D = 0.0;
    end
    % 168 171
    % 169 171
    if not(sps.CreateNetList)
        % 171 173
        sps = etass(sps);
    end
    sps.x0status = 'ok';
    % 175 187
    % 176 187
    % 177 187
    % 178 187
    % 179 187
    % 180 187
    % 181 187
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    if not(isempty(sps.rlswitch))
        sps.YSwitchCurrent = zeros(1.0, length(sps.rlswitch));
        for i=1.0:NumberOfOutputs
            indicesDu = find(eq(sps.D(i, :), 1.0));
            if all(eq(sps.C(i, :), 0.0)) && eq(length(indicesDu), 1.0) && le(sum(indicesDu), length(sps.rlswitch))
                sps.YSwitchCurrent(indicesDu) = i;
            end
        end % for
    else
        sps.YSwitchCurrent = [];
    end
    % 197 199
    if sps.CreateNetList
        fclose(fid_outfile);
        return
    end
    % 202 205
    % 203 205
    valp = eig(sps.A);
    [n, i] = sort(imag(valp));
    valp = valp(i);
    texte = sprintf('Oscillatory modes and damping factors:\n');
    for i=1.0:size(sps.A, 1.0)
        % 209 211
        if gt(imag(valp(i)), 0.0)
            fmode = mrdivide(mrdivide(imag(valp(i)), 2.0), 3.141592653589793);
            zeta = mrdivide(uminus(real(valp(i))), abs(valp(i)));
            texte = char(texte, sprintf('f = %8g Hz    zeta = %8g', fmode, zeta));
        end
    end % for
    sps.OscillatoryModes = texte;
    % 217 220
    % 218 220
    if sps.PowerguiInfo.Discrete
        % 220 222
        [sps.Adiscrete, sps.Bdiscrete, sps.Cdiscrete, sps.Ddiscrete] = psb_c2d(sps.A, sps.B, sps.C, sps.D, sps.PowerguiInfo.Ts);
        % 222 224
        if isempty(sps.x0)
            sps.x0discrete = sps.x0;
        else
            u0 = sum(imag(sps.uss), 2.0);
            I = eye(size(sps.A));
            sps.x0discrete = minus(mtimes(minus(I, mrdivide(mtimes(sps.Aswitch, sps.PowerguiInfo.Ts), 2.0)), mrdivide(sps.x0, sps.PowerguiInfo.Ts)), mtimes(mrdivide(sps.Bswitch, 2.0), u0));
        end
    end
    % 231 234
    % 232 234
    if strcmp(options, 'ss')
        % 234 236
        if not(exist('ss/ss', 'file'))
            error('Cannot find path to the SS function of the Control System Toolbox.');
        end
        if gt(nargout, 1.0)
            error('Too many output arguments')
        end
        % 241 243
        if sps.PowerguiInfo.Discrete
            sys = ss(sps.Adiscrete, sps.Bdiscrete, sps.Cdiscrete, sps.Ddiscrete);
            sys.Ts = sps.PowerguiInfo.Ts;
        else
            sys = ss(sps.A, sps.B, sps.C, sps.D);
        end
        for i=1.0:size(sps.srcstr, 1.0)
            sys.InputName{i, 1.0} = strrep(deblank(sps.srcstr(i, :)), char(10.0), ' ');
        end % for
        for i=1.0:size(sps.outstr, 1.0)
            sys.Outputname{i, 1.0} = strrep(deblank(sps.outstr(i, :)), char(10.0), ' ');
        end % for
        sys.StateName = sps.states(1.0:NumberOfStates, :);
        sys.notes = horzcat('This is the state-space representation of the ', sps.circuit, ' circuit.');
        varargout = cellhorzcat(sys);
    else
        % 258 260
        if strcmp(options, 'structure')
            % 260 262
            if gt(nargout, 1.0)
                error('Too many output arguments.')
            end
            % 264 266
            sys.circuit = sps.circuit;
            sys.states = sps.states;
            sys.inputs = sps.srcstr;
            sys.outputs = sps.outstr;
            sys.A = sps.A;
            sys.B = sps.B;
            sys.C = sps.C;
            sys.D = sps.D;
            sys.x0 = sps.x0;
            if sps.PowerguiInfo.Discrete
                sys.Adiscrete = sps.Adiscrete;
                sys.Bdiscrete = sps.Bdiscrete;
                sys.Cdiscrete = sps.Cdiscrete;
                sys.Ddiscrete = sps.Ddiscrete;
                sys.x0discrete = sps.x0discrete;
                sys.SampleTime = sps.PowerguiInfo.Ts;
            end
            sys.Aswitch = sps.Aswitch;
            sys.Bswitch = sps.Bswitch;
            sys.Cswitch = sps.Cswitch;
            sys.Dswitch = sps.Dswitch;
            sys.x0switch = sps.x0switch;
            sys.uss = sps.uss;
            sys.xss = sps.xss;
            sys.yss = sps.yss;
            sys.Hlin = sps.Hlin;
            sys.frequencies = sps.freq;
            sys.LoadFlow = sps.machines;
            sys.OscillatoryModes = sps.OscillatoryModes;
            varargout = cellhorzcat(sys);
        else
            % 296 298
            if strcmp(options, 'detailed')
                % 298 300
                if gt(nargout, 1.0)
                    error('Too many output arguments.')
                end
                % 302 304
                sps.sourcenames = getfullname(sps.sourcenames);
                varargout = cellhorzcat(sps);
            else
                % 306 308
                % 307 309
                varargout(1.0) = cellhorzcat(sps.A);
                varargout(2.0) = cellhorzcat(sps.B);
                varargout(3.0) = cellhorzcat(sps.C);
                varargout(4.0) = cellhorzcat(sps.D);
                varargout(5.0) = cellhorzcat(sps.x0);
                varargout(6.0) = cellhorzcat(sps.states);
                varargout(7.0) = cellhorzcat(sps.srcstr);
                varargout(8.0) = cellhorzcat(sps.outstr);
                varargout(9.0) = cellhorzcat(sps.uss);
                varargout(10.0) = cellhorzcat(sps.xss);
                varargout(11.0) = cellhorzcat(sps.yss);
                varargout(12.0) = cellhorzcat(sps.freq);
                varargout(13.0) = cellhorzcat(sps.Hlin);
            end
        end
    end
end
