function ThreeLevelBridgeCback(block, option)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch option
    case 'device configuration'
        % 9 12
        % 10 12
        visibilities = {'on';'on';'on';'on';'on';'on';'on'};
        device = get_param(block, 'Device');
        [Ron, Vfs, WSStatus] = getSPSmaskvalues(block, {'Ron','ForwardVoltages'}, 1.0);
        if eq(WSStatus, 0.0)
            % 15 20
            % 16 20
            % 17 20
            % 18 20
            return
        end
        if strcmp(device, 'GTO / Diodes')
            % 22 25
            % 23 25
            VF = Vfs(1.0);
            % 25 27
            if not(isequal(size(Vfs), [1.0 2.0]))
                message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The forward voltages [Vf Vfd] parameter must be a 1-by-2 vector with positive or null values.');
                % 28 30
                Erreur.message = message;
                Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                psberror(Erreur);
            else
                if lt(Vfs(1.0), 0.0) || lt(Vfs(2.0), 0.0)
                    message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The forward voltages [Vf Vfd] parameter must be a 1-by-2 vector with positive or null values.');
                    % 35 37
                    Erreur.message = message;
                    Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                    psberror(Erreur);
                end
            end
            % 41 44
            % 42 44
            VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
            if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0)
                replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Goto', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
            else
                if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Terminator', 'noprompt');
                end
            end
            ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
            if strcmp(ITAIL_Blocktype, 'Terminator')
                replace_block(block, 'Followlinks', 'on', 'Name', 'ITAIL', 'Goto', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
            end
            visibilities{6.0} = 'on';
            set_param(block, 'Maskvisibilities', visibilities);
        else
            if strcmp(device, 'MOSFET / Diodes')
                % 63 65
                if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Goto')
                    replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Terminator', 'noprompt');
                end
                % 67 70
                % 68 70
                ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                if strcmp(ITAIL_Blocktype, 'Terminator')
                    replace_block(block, 'Followlinks', 'on', 'Name', 'ITAIL', 'Goto', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
                end
                % 75 77
                visibilities{6.0} = 'off';
                set_param(block, 'Maskvisibilities', visibilities);
            else
                if strcmp(device, 'IGBT / Diodes')
                    % 80 83
                    % 81 83
                    VF = Vfs(1.0);
                    % 83 85
                    if not(isequal(size(Vfs), [1.0 2.0]))
                        message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The ''forward voltages [Vf Vfd]'' parameter must be a 1-by-2 vector with positive or null values.');
                        % 86 88
                        Erreur.message = message;
                        Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                        psberror(Erreur);
                    else
                        if lt(Vfs(1.0), 0.0) || lt(Vfs(2.0), 0.0)
                            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The ''forward voltages [Vf Vfd]'' parameter must be a 1-by-2 vector with positive or null values.');
                            % 93 95
                            Erreur.message = message;
                            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                            psberror(Erreur);
                        end
                    end
                    % 99 102
                    % 100 102
                    VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
                    if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
                    else
                        if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                            replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Terminator', 'noprompt');
                        end
                    end
                    ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                    if strcmp(ITAIL_Blocktype, 'Terminator')
                        replace_block(block, 'Followlinks', 'on', 'Name', 'ITAIL', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
                    end
                    visibilities{6.0} = 'on';
                    set_param(block, 'Maskvisibilities', visibilities);
                else
                    if strcmp(device, 'Ideal Switches')
                        % 121 125
                        % 122 125
                        % 123 125
                        if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Goto')
                            replace_block(block, 'Followlinks', 'on', 'Name', 'VF', 'Terminator', 'noprompt');
                        end
                        % 127 129
                        if strcmp(get_param(horzcat(block, '/ITAIL'), 'blocktype'), 'Goto')
                            replace_block(block, 'Followlinks', 'on', 'Name', 'ITAIL', 'Terminator', 'noprompt');
                        end
                        % 131 133
                        visibilities{6.0} = 'off';
                        set_param(block, 'Maskvisibilities', visibilities);
                        % 134 136
                    end
                end
            end
        end
    case 'BridgeArms'
        Arms = eval(get_param(block, 'Arms'));
        ports = get_param(block, 'ports');
        PortHandles = get_param(horzcat(block, '/UniversalBridge'), 'PortHandles');
        possibilities = mat2str(horzcat(ports(6.0), Arms));
        switch possibilities
        case '[3 2]'
            ligne = get_param(PortHandles.LConn(3.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/C'));
        case '[3 1]'
            ligne = get_param(PortHandles.LConn(3.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/C'));
            ligne = get_param(PortHandles.LConn(2.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/B'));
        case '[2 1]'
            ligne = get_param(PortHandles.LConn(2.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/B'));
        case '[2 3]'
            add_block('built-in/PMIOPort', horzcat(block, '/C'));
            set_param(horzcat(block, '/C'), 'Position', [20.0 95.0 50.0 115.0], 'orientation', 'right', 'port', '3');
            set_param(horzcat(block, '/C'), 'side', 'Left');
            CPortHandle = get_param(horzcat(block, '/C'), 'PortHandles');
            add_line(block, PortHandles.LConn(3.0), CPortHandle.RConn);
        case '[1 2]'
            add_block('built-in/PMIOPort', horzcat(block, '/B'));
            set_param(horzcat(block, '/B'), 'Position', [20.0 65.0 50.0 85.0], 'orientation', 'right', 'port', '2');
            set_param(horzcat(block, '/B'), 'side', 'Left');
            BPortHandle = get_param(horzcat(block, '/B'), 'PortHandles');
            add_line(block, PortHandles.LConn(2.0), BPortHandle.RConn);
        case '[1 3]'
            add_block('built-in/PMIOPort', horzcat(block, '/B'));
            set_param(horzcat(block, '/B'), 'Position', [20.0 65.0 50.0 85.0], 'orientation', 'right', 'port', '2');
            set_param(horzcat(block, '/B'), 'side', 'Left');
            BPortHandle = get_param(horzcat(block, '/B'), 'PortHandles');
            add_line(block, PortHandles.LConn(2.0), BPortHandle.RConn);
            add_block('built-in/PMIOPort', horzcat(block, '/C'));
            set_param(horzcat(block, '/C'), 'Position', [20.0 95.0 50.0 115.0], 'orientation', 'right', 'port', '3');
            set_param(horzcat(block, '/C'), 'side', 'Left');
            CPortHandle = get_param(horzcat(block, '/C'), 'PortHandles');
            add_line(block, PortHandles.LConn(3.0), CPortHandle.RConn);
        end
    end
end
