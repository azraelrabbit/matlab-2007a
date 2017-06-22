function [ST, InitialFlux1, InitialFlux2, InitialFlux3, Ts, WantBlockChoice] = TransformerBlocksInit(TypeOfWindings, block, NominalPower, Winding1Connection, Winding1, Winding2Connection, Winding2, Winding3Connection, SetSaturation, Saturation, WantHysteresis, SetInitialFlux, InitialFluxes, UNITS, DataFile)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    switch TypeOfWindings
    case 'Single Phase'
        % 18 21
        % 19 21
        NumberOfInternalModels = 1.0;
        % 21 23
        SaturableTransformerCback(block, 'winding 3');
        % 23 25
        ThreeWindings = Winding3Connection;
        [ST.p1, ST.p2, ST.p3, ST.p4, ST.p5, ST.p6, ST.p7, ST.p8, ST.mot, ST.t1] = SaturableTransformerIcon(ThreeWindings);
    case 'Multi-Windings'
        % 27 30
        % 28 30
        NumberOfInternalModels = 1.0;
        % 30 32
        NWindingsTransformerCback(block, 0.0, 'Callback');
        % 32 34
        [ST.lx, ST.ly, ST.rx, ST.ry, ST.hlx, ST.hly, ST.hrx, ST.hry] = NWindingsTransformerIcon;
    case 'Two Windings'
        % 35 38
        % 36 38
        NumberOfInternalModels = 3.0;
        % 38 40
        ThreePhaseTransformersCback(TypeOfWindings, block, 'AccessToNeutrals', 1.0);
        ThreePhaseTransformersCback(TypeOfWindings, block, 'AccessToNeutrals', 2.0);
        % 41 43
        [ST.w1x, ST.w1y, ST.g1x, ST.g1y, ST.w2x, ST.w2y, ST.g2x, ST.g2y, ST.satx, ST.saty] = ThreePhaseTransformer2Icon(Winding1Connection, Winding2Connection, SetSaturation);
    case 'Three Windings'
        % 44 47
        % 45 47
        NumberOfInternalModels = 3.0;
        % 47 49
        ThreePhaseTransformersCback(TypeOfWindings, block, 'AccessToNeutrals', 1.0);
        ThreePhaseTransformersCback(TypeOfWindings, block, 'AccessToNeutrals', 3.0);
        % 50 52
        [ST.w1x, ST.w1y, ST.g1x, ST.g1y, ST.w2x, ST.w2y, ST.g2x, ST.g2y, ST.w3x, ST.w3y, ST.g3x, ST.g3y, ST.satx, ST.saty, ST.p] = ThreePhaseTransformer3Icon(Winding1Connection, Winding2Connection, Winding3Connection, SetSaturation);
    case 'Zigzag'
        % 53 56
        % 54 56
        NumberOfInternalModels = 3.0;
        % 56 58
        ZigzagTransformerCback(block, 'Callback');
        % 58 60
        [ST.pzx1, ST.pzy1, ST.pzx2, ST.pzy2, ST.pzx3, ST.pzy3, ST.px1, ST.py1, ST.px2, ST.py2, ST.pgx1, ST.pgy1, ST.pgx2, ST.pgy2, ST.pgx3, ST.pgy3, ST.pgx4, ST.pgy4, ST.satx, ST.saty] = powericon('ZigzagTransformerIcon', Winding2, Winding2Connection, SetSaturation);
        % 60 62
    end % switch
    % 62 65
    % 63 65
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    Ts = PowerguiInfo.Ts;
    % 66 68
    if SetSaturation
        % 68 70
        switch TypeOfWindings
        case 'Single Phase'
            % 71 74
            % 72 74
            BaseVoltage = Winding1(1.0);
            [InitialFlux1, InitialFlux2, InitialFlux3, SaturationCurrent, SaturationFlux, BaseCurrent, BaseFlux] = CalculateInitialFluxes('Single Phase', NominalPower, Saturation, UNITS, [0.0 0.0 0.0], BaseVoltage);
            % 75 77
            InitialFlux1 = InitialFluxes;
            % 77 79
            CoreLoss = SetInitialFlux;
            if eq(length(CoreLoss), 2.0)
                if eq(UNITS, 2.0)
                    % 81 83
                    InitialFlux1 = mtimes(CoreLoss(2.0), BaseFlux);
                else
                    InitialFlux1 = CoreLoss(2.0);
                end % if
            end % if
        case 'Multi-Windings'
            % 88 92
            % 89 92
            % 90 92
            NominalVoltages = Winding1;
            NumberOfTaps = Winding1Connection;
            TappedWindings = Winding2Connection;
            if eq(TappedWindings, 2.0)
                BaseVoltage = mrdivide(NominalVoltages(1.0), plus(NumberOfTaps, 1.0));
            else
                BaseVoltage = NominalVoltages(1.0);
            end % if
            [InitialFlux1, InitialFlux2, InitialFlux3, SaturationCurrent, SaturationFlux, BaseCurrent, BaseFlux] = CalculateInitialFluxes('Single Phase', NominalPower, Saturation, UNITS, [0.0 0.0 0.0], BaseVoltage);
            InitialFlux1 = InitialFluxes;
        case {'Two Windings','Three Windings'}
            % 102 105
            % 103 105
            if le(Winding1Connection, 3.0)
                BaseVoltage = mrdivide(Winding1(1.0), sqrt(3.0));
            else
                BaseVoltage = Winding1(1.0);
            end % if
            [InitialFlux1, InitialFlux2, InitialFlux3, SaturationCurrent, SaturationFlux, BaseCurrent, BaseFlux] = CalculateInitialFluxes('Three Phase', NominalPower, Saturation, UNITS, InitialFluxes, BaseVoltage);
        case 'Zigzag'
            % 111 114
            % 112 114
            alpha_deg = abs(Winding2(2.0));
            BaseVoltage = mrdivide(mtimes(mrdivide(Winding1, sqrt(3.0)), sin(minus(2.0943951023931953, mrdivide(mtimes(alpha_deg, 3.141592653589793), 180.0)))), sin(1.0471975511965976));
            [InitialFlux1, InitialFlux2, InitialFlux3, SaturationCurrent, SaturationFlux, BaseCurrent, BaseFlux] = CalculateInitialFluxes('Three Phase', NominalPower, Saturation, UNITS, InitialFluxes, BaseVoltage);
            % 116 118
        end % switch
        % 118 120
        if WantHysteresis
            % 120 123
            % 121 123
            [InitialFlux1_pu, ST.Tolerances, HT, ST.UpperFlux, ST.LowerFlux, ST.Current] = inithysteresis(DataFile, BaseFlux, BaseCurrent, InitialFlux1);
            HT = InitialTrajectory(HT, InitialFlux1_pu, 1.0);
            if eq(HT.UnitsPopup, 2.0)
                % 125 129
                % 126 129
                % 127 129
                BaseCurrent = 1.0;
                BaseFlux = 1.0;
            end % if
            % 131 133
            ST.HT = HT;
            ST.BaseCurrent = BaseCurrent;
            ST.BaseFlux = BaseFlux;
            % 135 138
            % 136 138
            ST.SaturationCurrent = [];
            ST.SaturationFlux = [];
        else
            % 140 143
            % 141 143
            ST.SaturationCurrent = SaturationCurrent;
            ST.SaturationFlux = SaturationFlux;
            % 144 147
            % 145 147
            ST.Tolerances = [];
            ST.UpperFlux = [];
            ST.LowerFlux = [];
            ST.Current = [];
            ST.HT = [];
            ST.BaseCurrent = [];
            ST.BaseFlux = [];
            % 153 155
        end % if
    else
        % 156 159
        % 157 159
        InitialFlux1 = 0.0;
        InitialFlux2 = 0.0;
        InitialFlux3 = 0.0;
        % 161 163
    end % if
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    WantDiscreteModel = PowerguiInfo.Discrete;
    if WantDiscreteModel
        WantBlockChoice = 'Discrete';
    else
        WantBlockChoice = 'Continuous';
    end % if
    % 173 175
    if WantHysteresis
        WantBlockChoice = horzcat(WantBlockChoice, ' Hysteresis');
    end % if
    % 177 179
    if WantDiscreteModel
        WantToBreakLoop = strcmp(get_param(block, 'BreakLoop'), 'on');
        if WantToBreakLoop
            WantBlockChoice = horzcat(WantBlockChoice, ' Break Loop');
        end % if
    end % if
    % 184 186
    if not(SetSaturation)
        WantBlockChoice = 'Linear';
    end % if
    % 188 192
    % 189 192
    % 190 192
    if not(isequal(bdroot(block), 'powerlib'))
        % 192 194
        for i=1.0:NumberOfInternalModels
            % 194 196
            i_str = num2str(i);
            % 196 198
            if SetSaturation
                % 198 200
                if strcmp(get_param(horzcat(block, '/From', i_str), 'BlockType'), 'Ground')
                    replace_block(block, 'Followlinks', 'on', 'Name', horzcat('From', i_str), 'From', 'noprompt');
                    tag = tempname;
                    set_param(horzcat(block, '/From', i_str), 'GotoTag', tag(minus(end, 7.0):end));
                else
                    if strcmp(get_param(horzcat(block, '/From', i_str), 'GotoTag'), 'LibraryTag')
                        tag = tempname;
                        set_param(horzcat(block, '/From', i_str), 'GotoTag', tag(minus(end, 7.0):end));
                    end % if
                end % if
                % 209 211
                if strcmp(get_param(horzcat(block, '/Goto1', i_str), 'BlockType'), 'Terminator')
                    replace_block(block, 'Followlinks', 'on', 'Name', horzcat('Goto1', i_str), 'Goto', 'noprompt');
                    tag = tempname;
                    set_param(horzcat(block, '/Goto1', i_str), 'GotoTag', tag(minus(end, 7.0):end), 'TagVisibility', 'global');
                else
                    if strcmp(get_param(horzcat(block, '/Goto1', i_str), 'GotoTag'), 'LibraryTag')
                        tag = tempname;
                        set_param(horzcat(block, '/Goto1', i_str), 'GotoTag', tag(minus(end, 7.0):end));
                    end % if
                end % if
                % 220 222
                switch get_param(block, 'Measurements')
                case {'Flux and excitation current ( Imag + IRm )','Flux and magnetization current ( Imag )','Fluxes and excitation currents ( Imag + IRm )','Fluxes and excitation currents (Imag + IRm)','Fluxes and magnetization currents ( Imag )','Fluxes and magnetization currents (Imag)','All measurements (V I Flux)','All measurements (V I Fluxes)'}
                    % 223 231
                    % 224 231
                    % 225 231
                    % 226 231
                    % 227 231
                    % 228 231
                    % 229 231
                    MesureFlux = 1.0;
                otherwise
                    MesureFlux = 0.0;
                end % switch
                Multimeter = not(isempty(find_system(bdroot(block), 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'MaskType', 'MultimeterPSB')));
                % 235 237
                if Multimeter && MesureFlux
                    if strcmp(get_param(horzcat(block, '/Goto2', i_str), 'BlockType'), 'Terminator')
                        replace_block(block, 'Followlinks', 'on', 'Name', horzcat('Goto2', i_str), 'Goto', 'noprompt');
                        tag = tempname;
                        set_param(horzcat(block, '/Goto2', i_str), 'GotoTag', tag(minus(end, 7.0):end), 'TagVisibility', 'global');
                    else
                        if strcmp(get_param(horzcat(block, '/Goto2', i_str), 'GotoTag'), 'LibraryTag')
                            tag = tempname;
                            set_param(horzcat(block, '/Goto2', i_str), 'GotoTag', tag(minus(end, 7.0):end));
                        end % if
                    end % if
                else
                    if not(strcmp(get_param(horzcat(block, '/Goto2', i_str), 'BlockType'), 'Terminator'))
                        replace_block(block, 'Followlinks', 'on', 'Name', 'Goto2', 'Terminator', 'noprompt');
                    end % if
                end % if
            else
                % 253 258
                % 254 258
                % 255 258
                % 256 258
                if not(strcmp(get_param(horzcat(block, '/From', i_str), 'BlockType'), 'Ground'))
                    replace_block(block, 'Followlinks', 'on', 'Name', horzcat('From', i_str), 'Ground', 'noprompt');
                end % if
                % 260 262
                if not(strcmp(get_param(horzcat(block, '/Goto1', i_str), 'BlockType'), 'Terminator'))
                    replace_block(block, 'Followlinks', 'on', 'Name', horzcat('Goto1', i_str), 'Terminator', 'noprompt');
                end % if
                % 264 266
                if not(strcmp(get_param(horzcat(block, '/Goto2', i_str), 'BlockType'), 'Terminator'))
                    replace_block(block, 'Followlinks', 'on', 'Name', horzcat('Goto2', i_str), 'Terminator', 'noprompt');
                end % if
                % 268 270
            end % if
        end % for
    end % if
    % 272 274
    power_initmask;
function [InitialFlux1, InitialFlux2, InitialFlux3, SaturationCurrent, SaturationFlux, BaseCurrent, BaseFlux] = CalculateInitialFluxes(NumberOfPhases, NominalPower, Saturation, UNITS, InitialFluxes, BaseVoltage)
    % 275 278
    % 276 278
    BaseFreq = mtimes(6.283185307179586, NominalPower(2.0));
    switch NumberOfPhases
    case 'Three Phase'
        BasePower = mrdivide(NominalPower(1.0), 3.0);
    otherwise
        BasePower = NominalPower(1.0);
    end % switch
    BaseCurrent = mtimes(mrdivide(BasePower, BaseVoltage), sqrt(2.0));
    BaseFlux = mtimes(mrdivide(BaseVoltage, BaseFreq), sqrt(2.0));
    % 286 289
    % 287 289
    Fist_valid_value = find(ge(Saturation(:, 1.0), 0.0), 1.0);
    Saturation = Saturation(Fist_valid_value:end, :);
    % 290 293
    % 291 293
    if not(isequal([0.0 0.0], Saturation(1.0, :)))
        Saturation = vertcat([0.0 0.0], Saturation);
    end % if
    % 295 298
    % 296 298
    Saturation = abs(Saturation);
    % 298 301
    % 299 301
    SAT = vertcat(uminus(Saturation(size(Saturation, 1.0):-1.0:2.0, :)), Saturation(2.0:size(Saturation, 1.0), :));
    if eq(UNITS, 2.0)
        SaturationCurrent = ctranspose(mtimes(SAT(:, 1.0), BaseCurrent));
        SaturationFlux = ctranspose(mtimes(SAT(:, 2.0), BaseFlux));
        InitialFlux1 = mtimes(InitialFluxes(1.0), BaseFlux);
        InitialFlux2 = mtimes(InitialFluxes(2.0), BaseFlux);
        InitialFlux3 = mtimes(InitialFluxes(3.0), BaseFlux);
    else
        SaturationCurrent = ctranspose(SAT(:, 1.0));
        SaturationFlux = ctranspose(SAT(:, 2.0));
        InitialFlux1 = InitialFluxes(1.0);
        InitialFlux2 = InitialFluxes(2.0);
        InitialFlux3 = InitialFluxes(3.0);
    end % if
