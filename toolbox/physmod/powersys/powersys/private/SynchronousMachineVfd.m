function SynchronousMachineVfd(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmp(get_param(block, 'DisplayVfd'), 'on')
        % 10 12
        % 11 12
        NominalParameters = eval(get_param(block, 'NominalParameters'));
        Stator = eval(get_param(block, 'Stator'));
        Field = eval(get_param(block, 'Field'));
        Mechanical = eval(get_param(block, 'Mechanical'));
        InitialConditions = eval(get_param(block, 'InitialConditions'));
        SetSaturation = get_param(block, 'SetSaturation');
        % 18 19
        RotorType = mtimes(strcmp(get_param(block, 'RotorType'), 'Round'), 2.0);
        % 20 21
        switch RotorType
        case 0.0
            Dampers = horzcat(eval(get_param(block, 'Dampers1')), 0.0, Inf);
        case 2.0
            Dampers = eval(get_param(block, 'Dampers2'));
        end % switch
        % 27 28
        if strcmp(SetSaturation, 'on')
            Saturation = eval(get_param(block, 'Saturation'));
        else
            Saturation = [];
        end % if
        % 33 35
        % 34 35
        [w1, w2, w3, w4, w5, w6, w7, w8] = SynchronousMachineConvert(NominalParameters, Stator, Field, Dampers, Mechanical, InitialConditions, SetSaturation, Saturation, '1');
        if eq(w8, 0.0)
            w8 = [];
        end % if
        % 39 40
        SynchronousMachineParam(w1, w2, w3, w4, w5, w6, w8, 1.0, 1.0);
        % 41 42
        set_param(block, 'DisplayVfd', 'off');
    end % if
end % function
