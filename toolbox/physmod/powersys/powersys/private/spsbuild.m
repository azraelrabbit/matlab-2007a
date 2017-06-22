function spsbuild(sps, NetworkNumber, SPECIALCIRCUIT)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    LinkStatus = get_param(sps.PowerguiInfo.BlockName, 'linkstatus');
    if not(strcmp(LinkStatus, 'inactive'))
        set_param(sps.PowerguiInfo.BlockName, 'linkstatus', 'inactive');
    end % if
    % 13 15
    load_system('power_utile');
    % 15 17
    HAVEINPUTS = not(isempty(sps.U.Mux));
    YOUT = not(isempty(sps.Y.Demux));
    if sps.PowerguiInfo.Continuous
        % 19 21
        if sps.SwitchDevices.qty
            % 21 23
            if isempty(sps.U.Mux)
                % 23 25
                Model = 'power_utile/Continuous NoSources';
                MUXU = 0.0;
                SWC = 1.0;
            else
                % 28 30
                Model = 'power_utile/Continuous';
                MUXU = 1.0;
                SWC = 1.0;
            end % if
            SWITCHES = 1.0;
        else
            if sps.SwitchDevices.total
                Model = 'power_utile/Continuous NoSingleSwitch';
                MUXU = 0.0;
                SWC = 0.0;
                SWITCHES = 1.0;
            else
                if eq(sps.SwitchDevices.total, 0.0) && HAVEINPUTS
                    % 42 44
                    Model = 'power_utile/NoSwitch Continuous';
                    MUXU = 0.0;
                    SWC = 0.0;
                    SWITCHES = 0.0;
                    % 47 50
                    % 48 50
                    if eq(sps.NbMachines, 0.0) && isempty(sps.SaturableTransfo) && isempty(sps.Flux.Mux)
                        Model = 'power_utile/NoSwitch Continuous SSB';
                    end % if
                else
                    % 53 56
                    % 54 56
                    Model = 'power_utile/NoSwitch NoSource Continuous';
                    MUXU = 0.0;
                    SWC = 0.0;
                    SWITCHES = 0.0;
                end % if
            end % if
        end % if
    end % if
    if sps.PowerguiInfo.Discrete
        if sps.PowerguiInfo.Interpolate
            ModeDiscret = 'Interpolation';
        else
            ModeDiscret = 'Discrete';
        end % if
        if sps.SwitchDevices.qty
            % 70 72
            if isempty(sps.U.Mux)
                % 72 74
                Model = horzcat('power_utile/', ModeDiscret, ' NoSources');
                MUXU = 0.0;
                SWC = 1.0;
            else
                % 77 79
                Model = horzcat('power_utile/', ModeDiscret);
                MUXU = 1.0;
                SWC = 1.0;
            end % if
            SWITCHES = 1.0;
        else
            if sps.SwitchDevices.total
                Model = horzcat('power_utile/', ModeDiscret, ' NoSingleSwitch');
                MUXU = 0.0;
                SWC = 0.0;
                SWITCHES = 1.0;
            else
                if eq(sps.SwitchDevices.total, 0.0) && HAVEINPUTS
                    % 91 93
                    Model = horzcat('power_utile/NoSwitch ', ModeDiscret);
                    MUXU = 0.0;
                    SWC = 0.0;
                    SWITCHES = 0.0;
                else
                    % 97 99
                    Model = horzcat('power_utile/NoSwitch NoSource ', ModeDiscret);
                    MUXU = 0.0;
                    SWC = 0.0;
                    SWITCHES = 0.0;
                end % if
            end % if
        end % if
    end % if
    if sps.PowerguiInfo.Phasor
        if sps.SwitchDevices.qty
            if isempty(sps.U.Mux)
                % 109 111
                Model = 'power_utile/Phasors NoSources';
                MUXU = 0.0;
                SWC = 1.0;
            else
                % 114 116
                Model = 'power_utile/Phasors';
                MUXU = 1.0;
                SWC = 1.0;
            end % if
            SWITCHES = 1.0;
        else
            % 121 124
            % 122 124
            Model = 'power_utile/NoSwitch Phasors';
            MUXU = 0.0;
            SWC = 0.0;
            SWITCHES = 0.0;
        end % if
    end % if
    % 129 131
    if exist('SPECIALCIRCUIT', 'var')
        if strcmp(SPECIALCIRCUIT, 'SimpleMatrixGainBlock')
            % 132 134
            Model = 'power_utile/SimpleMatrixGainBlock';
        end % if
        if strcmp(SPECIALCIRCUIT, 'DummyFroms')
            % 136 138
            Model = 'power_utile/DummyFroms';
        end % if
        if strcmp(SPECIALCIRCUIT, 'DummyFromsGotos')
            % 140 142
            Model = 'power_utile/DummyFromsGotos';
        end % if
        if strcmp(SPECIALCIRCUIT, 'Dummygotos')
            % 144 146
            Model = 'power_utile/DummyGotos';
            % 146 148
        end % if
    end % if
    if not(isempty(sps.Flux.Tags))
        FLUX = 1.0;
        Model = horzcat(Model, ' Flux');
    else
        FLUX = 0.0;
    end % if
    if not(isempty(sps.Y.Q1Q4))
        THREELEVELBRIDGE = 1.0;
    else
        THREELEVELBRIDGE = 0.0;
    end % if
    % 160 162
    NewModel = horzcat(sps.PowerguiInfo.BlockName, '/EquivalentModel', num2str(NetworkNumber));
    % 162 164
    CurrentEquivalentModel = find_system(sps.PowerguiInfo.BlockName, 'lookundermasks', 'on', 'Regexp', 'on', 'Name', '^EquivalentModel');
    if not(isempty(CurrentEquivalentModel)) && eq(NetworkNumber, 1.0)
        % 165 168
        % 166 168
        for i=1.0:length(CurrentEquivalentModel)
            delete_block(CurrentEquivalentModel{i});
        end % for
    end % if
    add_block(Model, NewModel);
    set_param(NewModel, 'position', horzcat(15.0, plus(70.0, mtimes(50.0, minus(NetworkNumber, 1.0))), 143.0, plus(105.0, mtimes(50.0, minus(NetworkNumber, 1.0)))));
    % 173 176
    % 174 176
    if SWITCHES && eq(sps.PowerguiInfo.Phasor, 0.0)
        CreateGotoStruture(horzcat(NewModel, '/Status'), sps.Status.Tags, sps.Status.Demux);
    end % if
    % 178 180
    if SWITCHES
        CreateFromsSubsystem(horzcat(NewModel, '/Gates'), sps.Gates.Tags, sps.Gates.Mux);
        if sps.PowerguiInfo.Interpolate
            % 182 184
            set_param(horzcat(NewModel, '/Gates'), 'SignalLength', num2str(sum(sps.Gates.Mux)))
        end % if
    end % if
    % 186 188
    if YOUT
        CreateGotoStruture(horzcat(NewModel, '/Yout'), sps.Y.Tags, sps.Y.Demux);
    end % if
    if FLUX
        % 191 193
        CreateFromsSubsystem(horzcat(NewModel, '/Yout/Flux'), sps.Flux.Tags, sps.Flux.Mux);
    end % if
    if THREELEVELBRIDGE
        % 195 197
        set_param(horzcat(NewModel, '/Yout/Multimeter'), 'N', mat2str(sps.Y.TotalNumberOfSignals));
        set_param(horzcat(NewModel, '/Yout/Multimeter'), 'Q1Q4', mat2str(sps.Y.Q1Q4));
        set_param(horzcat(NewModel, '/Yout/Multimeter'), 'D1D4', mat2str(sps.Y.D1D4));
        set_param(horzcat(NewModel, '/Yout/Multimeter'), 'Others', mat2str(sps.Y.Others));
    end % if
    % 201 204
    % 202 204
    if MUXU && SWITCHES
        Mux_u = mat2str(horzcat(sps.SwitchDevices.qty, sum(sps.U.Mux)));
        set_param(horzcat(NewModel, '/Sources/Mux_u'), 'inputs', Mux_u);
    end % if
    % 207 209
    if SWC && SWITCHES
        N = num2str(sps.SwitchDevices.qty);
        if sps.PowerguiInfo.Phasor
            set_param(horzcat(NewModel, '/Sources/SwitchCurrents'), 'Value', horzcat('complex(zeros(', N, ',1),zeros(', N, ',1))'));
        else
            set_param(horzcat(NewModel, '/Sources/SwitchCurrents'), 'Value', horzcat('zeros(', N, ',1)'));
        end % if
    end % if
    if HAVEINPUTS
        CreateFromsSubsystem(horzcat(NewModel, '/Sources'), sps.U.Tags, sps.U.Mux);
    end % if
end % function
function CreateGotoStruture(Subsystem, Tags, Setting)
    % 221 226
    % 222 226
    % 223 226
    % 224 226
    MAXIMUM_OUTPUTS = 200.0;
    if isempty(Setting)
        return;
    end % if
    if eq(length(Setting), 1.0)
        Setting = 1.0;
    end % if
    NUMBER_OF_TAGS = length(Tags);
    if gt(NUMBER_OF_TAGS, MAXIMUM_OUTPUTS)
        NUMBER_OF_SUBCOMPONENTS = ceil(mrdivide(NUMBER_OF_TAGS, MAXIMUM_OUTPUTS));
        % 235 237
        for i=1.0:NUMBER_OF_SUBCOMPONENTS
            % 237 239
            num = num2str(i);
            subdivision = horzcat(Subsystem, '/sub', num);
            add_block('power_utile/subdivision', subdivision)
            set_param(subdivision, 'position', horzcat(325.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 395.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))))
            % 242 244
            debut = plus(1.0, mtimes(minus(i, 1.0), MAXIMUM_OUTPUTS));
            fin = mtimes(i, MAXIMUM_OUTPUTS);
            fin = min(fin, NUMBER_OF_TAGS);
            CreateGotoStruture(subdivision, Tags(debut:fin), Setting(debut:fin));
            % 247 249
            DEMUXSETTING(i) = sum(Setting(debut:fin));
        end % for
        % 250 253
        % 251 253
        set_param(horzcat(Subsystem, '/Demux'), 'outputs', mat2str(DEMUXSETTING));
        % 253 255
        for i=1.0:NUMBER_OF_SUBCOMPONENTS
            num = num2str(i);
            add_line(Subsystem, horzcat('Demux/', num), horzcat('sub', num, '/1'));
        end % for
        return;
    else
        set_param(horzcat(Subsystem, '/Demux'), 'outputs', mat2str(Setting));
    end % if
    for i=1.0:NUMBER_OF_TAGS
        num = num2str(i);
        if strcmp(Tags{i}, 'ThreeLevelBridgeCurrents')
            % 265 267
            add_block('power_utile/ThreeLevel', horzcat(Subsystem, '/Multimeter'))
            set_param(horzcat(Subsystem, '/Multimeter'), 'position', horzcat(325.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 395.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))))
            add_line(Subsystem, horzcat('Demux/', num), 'Multimeter/1');
        else
            if not(isempty(Tags{i}))
                add_block('built-in/Goto', horzcat(Subsystem, '/Goto', num))
                set_param(horzcat(Subsystem, '/Goto', num), 'position', horzcat(325.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 395.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))), 'GotoTag', Tags{i}, 'TagVisibility', 'global')
                add_line(Subsystem, horzcat('Demux/', num), horzcat('Goto', num, '/1'));
            else
                % 275 277
                add_block('built-in/Terminator', horzcat(Subsystem, '/Goto', num))
                set_param(horzcat(Subsystem, '/Goto', num), 'position', horzcat(325.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 395.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))))
                add_line(Subsystem, horzcat('Demux/', num), horzcat('Goto', num, '/1'));
            end % if
        end % if
    end % for
end % function
function CreateFromsSubsystem(Subsystem, Tags, Setting)
    % 284 287
    % 285 287
    MAXIMUM_INPUTS = 200.0;
    if isempty(Setting)
        return;
    end % if
    if eq(length(Setting), 1.0)
        Setting = 1.0;
    end % if
    NUMBER_OF_TAGS = length(Tags);
    if gt(NUMBER_OF_TAGS, MAXIMUM_INPUTS)
        NUMBER_OF_SUBCOMPONENTS = ceil(mrdivide(NUMBER_OF_TAGS, MAXIMUM_INPUTS));
        % 296 298
        for i=1.0:NUMBER_OF_SUBCOMPONENTS
            num = num2str(i);
            subdivision = horzcat(Subsystem, '/src', num);
            add_block('power_utile/sources', subdivision)
            set_param(subdivision, 'position', horzcat(15.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 85.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))))
            % 302 304
            debut = plus(1.0, mtimes(minus(i, 1.0), MAXIMUM_INPUTS));
            fin = mtimes(i, MAXIMUM_INPUTS);
            fin = min(fin, NUMBER_OF_TAGS);
            CreateFromsSubsystem(subdivision, Tags(debut:fin), Setting(debut:fin));
            % 307 309
            MUXSETTING(i) = sum(Setting(debut:fin));
        end % for
        % 310 313
        % 311 313
        set_param(horzcat(Subsystem, '/Mux'), 'inputs', mat2str(MUXSETTING));
        % 313 315
        for i=1.0:NUMBER_OF_SUBCOMPONENTS
            num = num2str(i);
            add_line(Subsystem, horzcat('src', num, '/1'), horzcat('Mux/', num));
        end % for
        return;
    else
        set_param(horzcat(Subsystem, '/Mux'), 'inputs', mat2str(Setting));
    end % if
    for i=1.0:NUMBER_OF_TAGS
        num = num2str(i);
        if not(isempty(Tags{i}))
            % 325 327
            add_block('built-in/From', horzcat(Subsystem, '/From', num))
            set_param(horzcat(Subsystem, '/From', num), 'position', horzcat(15.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 85.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))), 'GotoTag', Tags{i})
        else
            add_block('built-in/Ground', horzcat(Subsystem, '/From', num))
            set_param(horzcat(Subsystem, '/From', num), 'position', horzcat(15.0, plus(21.0, mtimes(45.0, minus(i, 1.0))), 85.0, plus(49.0, mtimes(45.0, minus(i, 1.0)))))
        end % if
        add_line(Subsystem, horzcat('From', num, '/1'), horzcat('Mux/', num));
    end % for
end % function
