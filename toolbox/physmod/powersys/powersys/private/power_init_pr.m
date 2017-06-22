function varargout = power_init_pr(system, action, Parameter1, Parameter2)
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
    if ne(exist(system, 'file'), 4.0)
        error(horzcat('There is no system named ''', system, ''' to open.'));
    end % if
    if not(exist('action', 'var'))
        action = 'CommandLine';
    end % if
    % 17 19
    switch action
    case 'states'
        % 20 23
        % 21 23
        [StateVariables, x0, LoadInitialStates] = AnalyzeAndUpdateSystem(system);
        disp(' ');
        disp(horzcat('Current values of the ', mat2str(length(x0)), ' initial states of your model:'));
        disp(' ');
        for i=1.0:length(x0)
            disp(horzcat(num2str(i, 5.0), ': ', StateVariables(i, :), ' = ', num2str(x0(i))));
        end % for
        disp(' ');
        if strcmp('on', LoadInitialStates)
            disp('Note: the initial state vector is imposed by the "Data inport/export initial state"')
            disp('option of the Simulink "Configuration Parameters" menu');
            disp(' ');
        end % if
    case 'ForceToZero'
        % 36 40
        % 37 40
        % 38 40
        StateVariables = AnalyzeAndUpdateSystem(system);
        NumberOfStates = size(StateVariables, 1.0);
        % 41 43
        UserSetting = get_param(system, 'InitialState');
        i_on = findstr(UserSetting, '%SPSon%');
        i_off = findstr(UserSetting, '%SPSoff%');
        if i_on
            % 46 48
            UserSetting = UserSetting(plus(i_on, 7.0):end);
            InitialUserSetting = 'on';
        end % if
        if i_off
            % 51 53
            UserSetting = UserSetting(plus(i_off, 8.0):end);
            InitialUserSetting = 'off';
        end % if
        if isempty(i_on) && isempty(i_off)
            InitialUserSetting = get_param(system, 'LoadInitialState');
        end % if
        % 58 60
        SPSidTAG = horzcat('%SPS', InitialUserSetting, '%');
        InitialState = horzcat('zeros(1,', mat2str(NumberOfStates), ');', SPSidTAG);
        set_param(system, 'LoadInitialState', 'on');
        set_param(system, 'InitialState', horzcat(InitialState, UserSetting));
    case 'UseBlockStates'
        % 64 68
        % 65 68
        % 66 68
        set_param(system, 'LoadInitialState', 'off');
    case 'ResetToDefault'
        % 69 75
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        UserSetting = get_param(system, 'InitialState');
        i_on = findstr(UserSetting, '%SPSon%');
        i_off = findstr(UserSetting, '%SPSoff%');
        if i_on
            % 78 80
            UserSetting = UserSetting(plus(i_on, 7.0):end);
            InitialUserSetting = 'on';
        end % if
        if i_off
            % 83 85
            UserSetting = UserSetting(plus(i_off, 8.0):end);
            InitialUserSetting = 'off';
        end % if
        if isempty(i_on) && isempty(i_off)
            InitialUserSetting = get_param(system, 'LoadInitialState');
        end % if
        set_param(system, 'LoadInitialState', InitialUserSetting);
        set_param(system, 'InitialState', UserSetting);
    case 'x0'
        % 93 99
        % 94 99
        % 95 99
        % 96 99
        % 97 99
        UserSetting = get_param(system, 'InitialState');
        i_on = findstr(UserSetting, '%SPSon%');
        i_off = findstr(UserSetting, '%SPSoff%');
        if i_on
            % 102 104
            UserSetting = UserSetting(plus(i_on, 7.0):end);
            InitialUserSetting = 'on';
        end % if
        if i_off
            % 107 109
            UserSetting = UserSetting(plus(i_off, 8.0):end);
            InitialUserSetting = 'off';
        end % if
        if isempty(i_on) && isempty(i_off)
            InitialUserSetting = get_param(system, 'LoadInitialState');
        end % if
        % 114 116
        SPSidTAG = horzcat('%SPS', InitialUserSetting, '%');
        InitialState = horzcat(mat2str(Parameter1), SPSidTAG);
        set_param(system, 'LoadInitialState', 'on');
        set_param(system, 'InitialState', horzcat(InitialState, UserSetting));
    case 'getSPSstructure'
        % 120 123
        % 121 123
        powersysdomain_netlist('clear', 2.0);
        % 123 125
        set_param(system, 'SimulationCommand', 'update');
        PowerguiInfo = getPowerguiInfo(system, 'CheckForPowergui');
        try
            sps = get_param(horzcat(PowerguiInfo.BlockName, '/EquivalentModel1'), 'UserData');
        catch
            sps = [];
        end % try
        varargout{1.0} = sps;
    case 'look'
        % 133 137
        % 134 137
        % 135 137
        [StateVariables, x0, LoadInitialStates, StateSpaceStates] = AnalyzeAndUpdateSystem(system);
        if eq(nargout, 0.0)
            disp(' ');
            disp(horzcat('Current values of the ', mat2str(length(StateSpaceStates)), ' electrical initial states of your model.'));
            disp(horzcat('Note that your model has a total of ', mat2str(length(x0)), ' Simulink states'));
            disp(' ');
            for i=ctranspose(StateSpaceStates)
                disp(horzcat(num2str(i, 5.0), ': ', StateVariables(i, :), ' = ', num2str(x0(i))));
            end % for
            disp(' ');
        end % if
        varargout{1.0} = x0(ctranspose(StateSpaceStates));
        varargout{2.0} = StateVariables(ctranspose(StateSpaceStates), :);
    case 'reset'
        % 150 155
        % 151 155
        % 152 155
        % 153 155
        powergui(system);
        PowerguiBlockName = find_system(system, 'MaskType', 'PSB option menu block');
        set_param(PowerguiBlockName{1.0}, 'x0status', 'zero');
        % 158 161
        % 159 161
    case 'steady'
        % 160 166
        % 161 166
        % 162 166
        % 163 166
        % 164 166
        powergui(system);
        PowerguiBlockName = find_system(system, 'MaskType', 'PSB option menu block');
        set_param(PowerguiBlockName{1.0}, 'x0status', 'steady');
        % 169 172
        % 170 172
    case 'blocks'
        % 171 178
        % 172 178
        % 173 178
        % 174 178
        % 175 178
        % 176 178
        powergui(system);
        PowerguiBlockName = find_system(system, 'MaskType', 'PSB option menu block');
        set_param(PowerguiBlockName{1.0}, 'x0status', 'blocks');
        % 181 184
        % 182 184
    case 'set'
        % 184 186
    case 'setx'
        % 185 191
        % 186 191
        % 187 191
        % 188 191
        % 189 191
        powergui(system);
        % 191 193
        PowerguiBlockName = find_system(system, 'MaskType', 'PSB option menu block');
        AnalyzeAndUpdateSystem(system);
        SPS = get_param(horzcat(PowerguiBlockName{1.0}, '/EquivalentModel1'), 'userdata');
        StateVariable = SPS.states(Parameter1);
        StateVariableName = StateVariable{1.0};
        % 197 199
        power_init_pr(system, 'setbb', StateVariableName, Parameter2);
    case {'setb','setbb'}
        % 200 206
        % 201 206
        % 202 206
        % 203 206
        % 204 206
        powergui(system);
        PowerguiBlockName = find_system(system, 'MaskType', 'PSB option menu block');
        % 207 209
        StateVariable = Parameter1;
        % 209 211
        if strcmp(action, 'setb')
            % 211 213
            AnalyzeAndUpdateSystem(system);
        end % if
        SPS = get_param(horzcat(PowerguiBlockName{1.0}, '/EquivalentModel1'), 'userdata');
        ST = 1.0;
        % 216 218
        for i=1.0:length(SPS.BlockInitialState.state)
            if strcmp(StateVariable, SPS.BlockInitialState.state{i})
                MaskType = get_param(SPS.BlockInitialState.block{i}, 'MaskType');
                switch MaskType
                case {'Parallel RLC Branch','Parallel RLC Load','Series RLC Branch','Series RLC Load'}
                    if isequal('Initial voltage', SPS.BlockInitialState.type{i})
                        set_param(SPS.BlockInitialState.block{i}, 'Setx0', 'on', 'InitialVoltage', mat2str(Parameter2));
                    else
                        % 225 227
                        % 226 228
                        set_param(SPS.BlockInitialState.block{i}, 'SetiL0', 'on', 'InitialCurrent', mat2str(Parameter2));
                        % 228 231
                        % 229 231
                    end % if
                    ST = 0.0;
                end % switch
            end % if
        end % for
        if ST
            % 236 240
            % 237 240
            % 238 240
            PowerguiUserData = get_param(PowerguiBlockName{1.0}, 'userdata');
            if isfield(PowerguiUserData, 'SpecifyInitialStates')
                PowerguiUserData.SpecifyInitialStates{plus(end, 1.0), 1.0} = StateVariable;
                PowerguiUserData.SpecifyInitialStates{end, 2.0} = Parameter2;
            else
                PowerguiUserData.SpecifyInitialStates{1.0, 1.0} = StateVariable;
                PowerguiUserData.SpecifyInitialStates{1.0, 2.0} = Parameter2;
            end % if
            set_param(PowerguiBlockName{1.0}, 'userdata', PowerguiUserData);
        end % if
    case 'CommandLine'
        % 250 253
        % 251 253
        [StateVariables, x0] = AnalyzeAndUpdateSystem(system);
        varargout{1.0} = x0;
        varargout{2.0} = StateVariables;
    otherwise
        % 256 258
        error('Error in specification of property name and value pairs.');
    end % switch
function [StateVariables, x0, LoadInitialStates, StateSpaceStates] = AnalyzeAndUpdateSystem(system)
    % 260 266
    % 261 266
    % 262 266
    % 263 266
    % 264 266
    [sys, x0, str] = feval(system, [], [], [], 0.0);
    % 266 268
    TypeOfState = get_param(str, 'BlockType');
    SFunctions = strmatch('S-Function', TypeOfState);
    % 269 272
    % 270 272
    StateSpaceBlocks = strmatch('StateSpace', TypeOfState);
    % 272 276
    % 273 276
    % 274 276
    SFunctionNames = get_param(str(SFunctions), 'FunctionName');
    ikss = horzcat(strmatch('sfun_spssw_contc', SFunctionNames), strmatch('sfun_spssw_discc', SFunctionNames), strmatch('sfun_dqc', SFunctionNames));
    StateSpaceStates = SFunctions(ikss);
    if isempty(StateSpaceStates)
        % 279 281
        Parents = get_param(str(StateSpaceBlocks), 'Parent');
        ParentsNames = get_param(Parents, 'Name');
        ikss = strmatch('EquivalentModel', ParentsNames);
        StateSpaceStates = StateSpaceBlocks(ikss);
    end % if
    % 285 290
    % 286 290
    % 287 290
    % 288 290
    LoadInitialStates = get_param(system, 'LoadInitialState');
    if strcmp('on', LoadInitialStates)
        % 291 293
        x0 = eval(get_param(system, 'InitialState'), '[]');
        x0 = ctranspose(x0);
    end % if
    % 295 300
    % 296 300
    % 297 300
    % 298 300
    PowerguiInfo = getPowerguiInfo(system, 'CheckForPowergui');
    SPS = get_param(horzcat(PowerguiInfo.BlockName, '/EquivalentModel1'), 'UserData');
    % 301 313
    % 302 313
    % 303 313
    % 304 313
    % 305 313
    % 306 313
    % 307 313
    % 308 313
    % 309 313
    % 310 313
    % 311 313
    for i=1.0:min(length(SPS.states), length(StateSpaceStates))
        str{StateSpaceStates(i)} = horzcat(system, '/', SPS.states{i});
    end % for
    % 315 318
    % 316 318
    syslength = plus(length(system), 2.0);
    StateVariables = '';
    NumberOfStates = length(str);
    for i=1.0:NumberOfStates
        NewState = strrep(str{i}, char(10.0), ' ');
        NewState = NewState(syslength:end);
        StateVariables = strvcat(StateVariables, NewState);
    end % for
