function [WantBlockChoice, Ts, X, Y] = SwitchesInit(Device, block, Rs, Cs)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [X, Y] = SwitchesIcon(Device, Rs, Cs);
    % 10 12
    switch Device
    case {'Diode','Thyristor','GTO','IGBT'}
        % 13 16
        % 14 16
        Lon = eval(get_param(block, 'Lon'), 'NaN');
    case 'Detailed Thyristor'
        % 17 20
        % 18 20
        DetailedThyristorCback(block);
        Lon = eval(get_param(block, 'Lon'), 'NaN');
    case {'MOSFET','IGBT/Diode','Ideal Switch'}
        % 22 25
        % 23 25
        Lon = 0.0;
        % 25 27
    end
    % 27 29
    OutputMCback(block);
    % 29 31
    switch Device
    case 'MOSFET'
        % 32 35
        % 33 35
        WantBlockChoice = 'Not used';
        Ts = [];
        power_initmask;
        return
        % 38 42
        % 39 42
        % 40 42
    end
    if isnan(Lon)
        [Lon, WSStatus] = getSPSmaskvalues(block, {'Lon'}, 1.0);
        if eq(WSStatus, 0.0)
            % 45 49
            % 46 49
            % 47 49
            return
        end
    end
    % 51 54
    % 52 54
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    Ts = PowerguiInfo.Ts;
    % 55 57
    WantDiscreteModel = PowerguiInfo.Discrete;
    if WantDiscreteModel
        WantBlockChoice = 'Discrete';
    else
        if gt(Lon, 0.0)
            WantBlockChoice = 'Current source';
        else
            WantBlockChoice = 'Continuous';
        end
    end
    % 66 68
    ModelMaskType = get_param(horzcat(block, '/model1'), 'BlockChoice');
    % 68 70
    switch Device
    case 'Ideal Switch'
        % 71 74
        % 72 74
        if PowerguiInfo.Phasor
            WantBlockChoice = 'Phasor';
        else
            WantBlockChoice = 'Continuous';
        end
        % 78 80
        PhasorBlock = strcmp(ModelMaskType, 'Phasor');
        % 80 83
        % 81 83
        if PowerguiInfo.Phasor && not(PhasorBlock)
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'Ground', 'noprompt');
        end
        if not(PowerguiInfo.Phasor) && PhasorBlock
            if strcmp(get_param(horzcat(block, '/Status'), 'blocktype'), 'Ground')
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/Status'), 'GotoTag', tag);
            end
        end
        % 92 94
        powericon('power_gototags', block, 'Library', 0.0);
        power_initmask;
        % 95 99
        % 96 99
        % 97 99
        return
        % 100 102
    case {'Diode','GTO','IGBT'}
        % 101 104
        % 102 104
        if PowerguiInfo.Interpolate && PowerguiInfo.Discrete
            WantBlockChoice = 'Interpolation';
        end
        % 106 108
    end
    % 108 112
    % 109 112
    % 110 112
    if PowerguiInfo.Continuous
        if eq(Lon, 0.0) && not(strcmp('Continuous', ModelMaskType))
            % 113 115
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Terminator', 'noprompt');
            % 115 117
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
            set_param(horzcat(block, '/Goto'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
            % 118 120
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
            set_param(horzcat(block, '/Status'), 'GotoTag', 'LibraryTag');
            % 121 123
            if not(strcmp(Device, 'IGBT Diode'))
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                set_param(horzcat(block, '/VF'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
            end
        end
        if ne(Lon, 0.0) && not(strcmp('Current source', ModelMaskType))
            % 128 130
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Goto', 'noprompt');
            set_param(horzcat(block, '/ISWITCH'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
            % 131 133
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Terminator', 'noprompt');
            % 133 135
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'Ground', 'noprompt');
            % 135 137
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
            % 137 139
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Terminator', 'noprompt');
        end
    end
    % 141 143
    if PowerguiInfo.Discrete && not(strcmp('Discrete', ModelMaskType))
        % 143 145
        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Terminator', 'noprompt');
        % 145 147
        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
        set_param(horzcat(block, '/Goto'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
        % 148 150
        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
        set_param(horzcat(block, '/Status'), 'GotoTag', 'LibraryTag');
        % 151 153
        if not(strcmp(Device, 'IGBT/Diode'))
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
            set_param(horzcat(block, '/VF'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
        end
    end
    % 157 160
    % 158 160
    if eq(Lon, 0.0) && not(strcmp(Device, 'IGBT/Diode'))
        [VF, WSStatus] = getSPSmaskvalues(block, {'Vf'}, 1.0);
        if eq(WSStatus, 0.0)
            % 162 167
            % 163 167
            % 164 167
            % 165 167
            return
        end
        if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Goto') && eq(VF, 0.0)
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
        else
            if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Terminator') && ne(VF, 0.0)
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                set_param(horzcat(block, '/VF'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
            end
        end
    end
    switch Device
    case {'GTO','IGBT'}
        ITAIL = or(eq(Lon, 0.0), PowerguiInfo.Discrete);
        if strcmp(get_param(horzcat(block, '/ITAIL'), 'blocktype'), 'Terminator') && ne(ITAIL, 0.0)
            % 181 183
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Goto', 'noprompt');
            set_param(horzcat(block, '/ITAIL'), 'GotoTag', 'LibraryTag', 'TagVisibility', 'Global');
        else
            if strcmp(get_param(horzcat(block, '/ITAIL'), 'blocktype'), 'Goto') && eq(ITAIL, 0.0)
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Terminator', 'noprompt');
            end
        end
        % 189 191
    end
    power_gototags(block, 'Library', 1.0);
    % 192 195
    % 193 195
    power_initmask;
end
