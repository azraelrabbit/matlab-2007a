function setInternalDriveMechInput(DriveType, block)
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
    switch DriveType
    case {'AC1','AC2','AC3','AC4'}
        MachineType = '/Induction machine';
        MachineInputTorque = 'Torque Tm';
        MachineInputSpeed = 'Speed w';
        BusSelectorTorque = 'Mechanical.Electromagnetic torque Te (N*m)';
        BusSelectorSpeed = 'Mechanical.Rotor speed (wm)';
    case 'AC5'
        MachineType = '/Synchronous Machine SI Fundamental';
        MachineInputTorque = 'Mechanical power Pm';
        MachineInputSpeed = 'Speed w';
        BusSelectorTorque = 'Mechanical.Electromagnetic torque  Te (N*m)';
        BusSelectorSpeed = 'Mechanical.Rotor speed  wm (rad/s)';
    case {'AC6','AC7'}
        MachineType = '/Permanent Magnet Synchronous Machine';
        MachineInputTorque = 'Torque Tm';
        MachineInputSpeed = 'Speed w';
        BusSelectorTorque = 'Electromagnetic torque Te (N*m)';
        BusSelectorSpeed = 'Rotor speed wm (rad/s)';
    case {'DC1','DC2','DC3','DC4','DC5','DC6','DC7'}
        MachineType = '/DC Machine';
        MachineInputTorque = 'Torque TL';
        MachineInputSpeed = 'Speed w';
        BusSelectorTorque = 'Electrical torque Te (n m)';
        BusSelectorSpeed = 'Speed wm (rad/s)';
    end
    % 38 40
    WantTorqueInput = strcmp(get_param(block, 'MechanicalLoad'), 'Torque Tm');
    HaveTorqueInput = strcmp(get_param(horzcat(block, '/Wm'), 'BlockType'), 'Outport');
    if WantTorqueInput && not(HaveTorqueInput)
        % 42 44
        set_param(horzcat(block, '/Wm'), 'name', 'Tm');
        set_param(horzcat(block, '/Te'), 'name', 'Wm');
        set_param(horzcat(block, MachineType), 'MechanicalLoad', MachineInputTorque);
        set_param(horzcat(block, '/Output Bus Selector'), 'OutputSignals', BusSelectorSpeed);
    else
        if not(WantTorqueInput) && HaveTorqueInput
            set_param(horzcat(block, '/Wm'), 'name', 'Te');
            set_param(horzcat(block, '/Tm'), 'name', 'Wm');
            set_param(horzcat(block, MachineType), 'MechanicalLoad', MachineInputSpeed);
            set_param(horzcat(block, '/Output Bus Selector'), 'OutputSignals', BusSelectorTorque);
        end
    end
end
