function Ts = AsynchronousMachineInit(block, PowerguiBlockName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(exist('PowerguiBlockName', 'var'))
        PowerguiInfo = getPowerguiInfo(bdroot(block));
    else
        PowerguiInfo = getPowerguiInfo(bdroot(block), [], [], PowerguiBlockName);
    end % if
    % 13 15
    Ts = PowerguiInfo.Ts;
    % 15 18
    % 16 18
    PhasorBlock = not(isempty(findstr(get_param(horzcat(block, '/Source'), 'ReferenceBlock'), 'Phasors')));
    ContinuousBlock = not(isempty(findstr(get_param(horzcat(block, '/Source'), 'ReferenceBlock'), 'Continuous')));
    DiscreteBlock = not(isempty(findstr(get_param(horzcat(block, '/Source'), 'ReferenceBlock'), 'Discrete')));
    SpeedInputBlock = not(isempty(findstr(get_param(horzcat(block, '/ASM_mechanics'), 'ReferenceBlock'), '_speed')));
    TorqueInputBlock = not(SpeedInputBlock);
    ResolvedLink = strcmp(get_param(horzcat(block, '/Source'), 'linkstatus'), 'resolved');
    % 23 26
    % 24 26
    WantDiscreteModel = PowerguiInfo.Discrete;
    WantContinuousModel = PowerguiInfo.Continuous;
    WantPhasorModel = PowerguiInfo.Phasor;
    WantTorqueInput = strcmp(get_param(block, 'MechanicalLoad'), 'Torque Tm');
    WantSpeedInput = strcmp(get_param(block, 'MechanicalLoad'), 'Speed w');
    % 30 33
    % 31 33
    NeedToUpdate = or(or(or(or(and(WantDiscreteModel, not(DiscreteBlock)), and(WantContinuousModel, not(ContinuousBlock))), and(WantPhasorModel, not(PhasorBlock))), and(WantTorqueInput, not(TorqueInputBlock))), and(WantSpeedInput, not(SpeedInputBlock)));
    % 33 37
    % 34 37
    % 35 37
    if NeedToUpdate && ResolvedLink
        % 37 39
        if WantDiscreteModel
            % 39 41
            ReferenceModel1 = 'powerlib_models/Discrete/';
        else
            if WantContinuousModel
                ReferenceModel1 = 'powerlib_models/Continuous/';
            else
                % 45 47
                ReferenceModel1 = 'powerlib_models/Phasors/';
            end % if
        end % if
        if WantSpeedInput
            ReferenceModel2 = horzcat(ReferenceModel1, 'ASM_mechanics_speed');
        else
            ReferenceModel2 = horzcat(ReferenceModel1, 'ASM_mechanics');
        end % if
        load_system('powerlib_models');
        replace_block(block, 'Followlinks', 'on', 'Name', 'Source', horzcat(ReferenceModel1, 'asynchronous_machine'), 'noprompt');
        replace_block(block, 'Followlinks', 'on', 'Name', 'ASM_mechanics', ReferenceModel2, 'noprompt');
    end % if
end % function
