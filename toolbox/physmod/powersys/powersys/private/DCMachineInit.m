function [Ra, La, Rf, Lf] = DCMachineInit(block, WantDiscreteModel, RLa, RLf)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isequal(size(RLa), [1.0 2.0])
        Ra = RLa(1.0);
        La = RLa(2.0);
    else
        Ra = 1.0;
        La = 1.0;
    end % if
    if isequal(size(RLf), [1.0 2.0])
        Rf = RLf(1.0);
        Lf = RLf(2.0);
    else
        Rf = 1.0;
        Lf = 1.0;
    end % if
    % 24 25
    MechanicalLoad = get_param(block, 'MechanicalLoad');
    SpeedInputBlock = not(isempty(findstr(get_param(horzcat(block, '/Mechanics'), 'ReferenceBlock'), '_speed')));
    TorqueInputBlock = not(SpeedInputBlock);
    ResolvedLink = strcmp(get_param(horzcat(block, '/Mechanics'), 'linkstatus'), 'resolved');
    % 29 31
    % 30 31
    WantTorqueInput = strcmp(MechanicalLoad, 'Torque TL');
    WantSpeedInput = strcmp(MechanicalLoad, 'Speed w');
    % 33 35
    % 34 35
    NeedToUpdate = or(and(WantTorqueInput, not(TorqueInputBlock)), and(WantSpeedInput, not(SpeedInputBlock)));
    % 36 38
    % 37 38
    if NeedToUpdate && ResolvedLink
        % 39 40
        if WantDiscreteModel
            ReferenceModel = 'powerlib_models/Discrete/DC_Machine_mec';
        else
            ReferenceModel = 'powerlib_models/Continuous/DC_Machine_mec';
        end % if
        if WantSpeedInput
            ReferenceModel = horzcat(ReferenceModel, '_speed');
        end % if
        load_system('powerlib_models');
        replace_block(block, 'Followlinks', 'on', 'Name', 'Mechanics', ReferenceModel, 'noprompt');
    end % if
end % function
