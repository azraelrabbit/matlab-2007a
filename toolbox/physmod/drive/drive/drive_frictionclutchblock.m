function varargout = drive_frictionclutchblock(Mode, varargin)
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
    switch lower(Mode)
    case 'mask'
        % 14 16
        Slip = varargin{1.0};
        Torque = varargin{2.0};
        EnergyLoss = varargin{3.0};
        Mode = varargin{4.0};
        % 19 21
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        % 22 24
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        Icon.x1 = [-.5 -.3 -.3 .2 -.3 -.3 .2];
        Icon.y1 = [0.0 0.0 .5 .5 .5 -.5 -.5];
        Icon.x2 = [-.2 -.2];
        Icon.y2 = [.2 .5];
        Icon.x3 = [-.2 -.2];
        Icon.y3 = [-.2 -.5];
        Icon.x4 = [0.0 0.0];
        Icon.y4 = [.2 .5];
        Icon.x5 = [0.0 0.0];
        Icon.y5 = [-.2 -.5];
        Icon.x6 = [.2 .2];
        Icon.y6 = [.2 .5];
        Icon.x7 = [.2 .2];
        Icon.y7 = [-.2 -.5];
        Icon.x8 = [-.1 -.1 -.1 .1 .1 .1 .1 .35];
        Icon.y8 = [.4 -.4 0.0 0.0 .4 -.4 0.0 0.0];
        Icon.x9 = [.65 .75];
        Icon.y9 = [0.0 0.0];
        Icon.x10 = [-.9 -.8];
        Icon.y10 = [0.0 0.0];
        Icon.x11 = [-.8 -.8 -.5 -.5 -.35 -.95];
        Icon.y11 = [-.2 .15 .15 -.2 -.2 -.2];
        Icon.x12 = [-.85 -.45];
        Icon.y12 = [-.26 -.26];
        Icon.x13 = [-.75 -.55];
        Icon.y13 = [-.32 -.32];
        Icon.x14 = [.35 .35 .65 .65 .7999999999999999 .19999999999999998];
        Icon.y14 = [-.2 .15 .15 -.2 -.2 -.2];
        Icon.x15 = [.30000000000000004 .7];
        Icon.y15 = [-.26 -.26];
        Icon.x16 = [.4 .6];
        Icon.y16 = [-.32 -.32];
        varargout{1.0} = Icon;
        Name = eval('gcb');
        portNumber = 0.0;
        PortName = 'S';
        Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
        if eq(Slip, 1.0)
            portNumber = plus(portNumber, 1.0);
            if isempty(Port)
                add_block('built-in/Outport', horzcat(Name, '/', PortName));
                set_param(horzcat(Name, '/', PortName), 'Position', [760.0 303.0 790.0 317.0], 'Port', int2str(portNumber));
                add_line(Name, 'Relative velocity/1', horzcat(PortName, '/1'), 'autorouting', 'on');
            end
        else
            if not(isempty(Port))
                delete_line(Name, 'Relative velocity/1', horzcat(PortName, '/1'));
                delete_block(horzcat(Name, '/', PortName));
            end
        end
        PortName = 'T';
        Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
        if eq(Torque, 1.0)
            portNumber = plus(portNumber, 1.0);
            if isempty(Port)
                add_block('built-in/Outport', horzcat(Name, '/', PortName));
                set_param(horzcat(Name, '/', PortName), 'Position', [760.0 268.0 790.0 282.0], 'Port', int2str(portNumber));
                add_line(Name, 'Disc Friction/1', horzcat(PortName, '/1'), 'autorouting', 'on');
            end
        else
            if not(isempty(Port))
                delete_line(Name, 'Disc Friction/1', horzcat(PortName, '/1'));
                delete_block(horzcat(Name, '/', PortName));
            end
        end
        PortName = 'L';
        Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
        if eq(EnergyLoss, 1.0)
            portNumber = plus(portNumber, 1.0);
            if isempty(Port)
                add_block('built-in/Product', horzcat(Name, '/', 'Product'));
                set_param(horzcat(Name, '/Product'), 'Position', [640.0 227.0 670.0 258.0]);
                add_block('built-in/Outport', horzcat(Name, '/', PortName));
                set_param(horzcat(Name, '/', PortName), 'Position', [760.0 238.0 790.0 252.0], 'Port', int2str(portNumber));
                add_line(Name, 'Disc Friction/1', 'Product/1', 'autorouting', 'on');
                add_line(Name, 'Relative velocity/1', 'Product/2', 'autorouting', 'on');
                add_line(Name, 'Product/1', horzcat(PortName, '/1'), 'autorouting', 'on');
            end
        else
            if not(isempty(Port))
                delete_line(Name, 'Product/1', horzcat(PortName, '/1'));
                delete_line(Name, 'Relative velocity/1', 'Product/2');
                delete_line(Name, 'Disc Friction/1', 'Product/1');
                delete_block(horzcat(Name, '/', PortName));
                delete_block(horzcat(Name, '/Product'));
            end
        end
        PortName = 'M';
        Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
        if eq(Mode, 1.0)
            portNumber = plus(portNumber, 1.0);
            if isempty(Port)
                delete_line(Name, 'Disc Friction/2', 'Terminator/1');
                delete_block(horzcat(Name, '/', 'Terminator'));
                add_block('built-in/Outport', horzcat(Name, '/', PortName));
                set_param(horzcat(Name, '/', PortName), 'Position', [760.0 193.0 790.0 207.0]);
                add_line(Name, 'Disc Friction/2', horzcat(PortName, '/1'), 'autorouting', 'on');
            end
        else
            if not(isempty(Port))
                delete_line(Name, 'Disc Friction/2', horzcat(PortName, '/1'));
                delete_block(horzcat(Name, '/', PortName));
                add_block('built-in/Terminator', horzcat(Name, '/', 'Terminator'));
                set_param(horzcat(Name, '/', 'Terminator'), 'Position', [760.0 193.0 790.0 207.0]);
                add_line(Name, 'Disc Friction/2', 'Terminator/1', 'autorouting', 'on');
            end
        end
    case 'start'
        Name = get_param(gcb, 'Name');
        Parent = get_param(gcb, 'Parent');
        dr = get_param(0.0, 'DomainRegistry');
        Ws = get_param(gcb, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        thisBlockName = horzcat('''', Parent, '/', Name, '''');
        NumberDiscs = Ws(strmatch('Nf', Search, 'exact')).Value;
        if isempty(NumberDiscs) || le(NumberDiscs, 0.0)
            error('physmod:drive:drive_frictionclutchblock:InvalidNumberOfFrictionSurfaces', horzcat('Error in ', thisBlockName, ':', ' Parameter "Number of friction surfaces" must be greater ', 'than zero. Change the number of friction surfaces from %d to', ' a positive integer.'), NumberDiscs);
        end
        EffectiveRadius = Ws(strmatch('EffectiveRadius', Search, 'exact')).Value;
        if isempty(EffectiveRadius) || le(EffectiveRadius, 0.0)
            error('physmod:drive:drive_frictionclutchblock:InvalidEffectiveTorqueRadius', horzcat('Error in ', thisBlockName, ':', ' Parameter "Effective torque radius" must be greater than ', 'zero. Change the "Effective torque radius" from %d to a positive value.'), EffectiveRadius);
        end
        PeakNormalForce = Ws(strmatch('PeakForce', Search, 'exact')).Value;
        if isempty(PeakNormalForce) || le(PeakNormalForce, 0.0)
            error('physmod:drive:drive_frictionclutchblock:InvalidPeakNormalForce', horzcat('Error in ', thisBlockName, ':', ' Parameter "Peak normal force" must be greater than zero. ', 'Change the "Peak normal force" from %d to a positive value.'), PeakNormalForce);
            % 152 155
            % 153 155
        end
        % 155 157
        VelocityTolerance = Ws(strmatch('VelocityTolerance', Search, 'exact')).Value;
        if isempty(VelocityTolerance) || le(VelocityTolerance, 0.0)
            error('physmod:drive:drive_frictionclutchblock:InvalidVelocityTolerance', horzcat('Error in ', thisBlockName, ':', ' Parameter "Velocity tolerance" must be greater than zero.', ' Change the "Velocity tolerance" from %d to a ', 'positive value.'), VelocityTolerance);
            % 159 164
            % 160 164
            % 161 164
            % 162 164
        end
        % 164 166
    end
end
