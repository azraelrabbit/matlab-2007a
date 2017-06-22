function varargout = drive_hardstopblock(Mode, varargin)
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
    switch lower(Mode)
    case 'mask'
        % 13 15
        Icon.LowerLeftx = -1.3;
        Icon.LowerLefty = -.7;
        Icon.UpperRightx = 1.3;
        Icon.UpperRighty = .7;
        Icon.x1 = [.5 .9];
        Icon.y1 = [0.0 0.0];
        Icon.x2 = [1.2 1.4];
        Icon.y2 = [0.0 0.0];
        Icon.x3 = [-.9 -1.1];
        Icon.y3 = [0.0 0.0];
        Icon.x4 = [.8 1.3];
        Icon.y4 = [-.2 -.2];
        Icon.x5 = [.9 1.2];
        Icon.y5 = [-.25 -.25];
        Icon.x6 = [1.0 1.1];
        Icon.y6 = [-.3 -.3];
        Icon.x7 = [-.5 -1.0];
        Icon.y7 = [-.2 -.2];
        Icon.x8 = [-.6 -.9];
        Icon.y8 = [-.25 -.25];
        Icon.x9 = [-.7 -.8];
        Icon.y9 = [-.3 -.3];
        Icon.x10 = [.9 .9 1.2 1.2 .9 .9];
        Icon.y10 = [0.0 .1 .1 -.2 -.2 0.0];
        Icon.x11 = [-.2 -.6 -.6 -.9 -.9 -.6 -.6];
        Icon.y11 = [0.0 0.0 .1 .1 -.2 -.2 0.0];
        Icon.x12 = [.5 .5 .3 .3 .1 .1 .3 .3 .1 .1 .3 .3 .5 .5];
        Icon.y12 = [0.0 .5 .5 .3 .3 .2 .2 -.2 -.2 -.3 -.3 -.5 -.5 0.0];
        Icon.x13 = [.2 .2 0.0 0.0 -.2 -.2 0.0 0.0 .2];
        Icon.y13 = [-.05 .05 .05 .5 .5 -.5 -.5 -.05 -.05];
        Name = eval('gcb');
        Ports = get_param(Name, 'PortHandles');
        set_param(Ports.LConn, 'Tag', 'B');
        set_param(Ports.RConn, 'Tag', 'F');
        varargout{1.0} = Icon;
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        varargout{1.0} = [];
    case 'start'
        dr = get_param(0.0, 'DomainRegistry');
        Name = get_param(gcb, 'Name');
        Parent = get_param(gcb, 'Parent');
        Ws = get_param(gcb, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        thisBlockName = horzcat('''', Parent, '/', Name, '''');
        UpperLimit = Ws(strmatch('Limit_upper', Search, 'exact')).Value;
        if isempty(UpperLimit)
            error('physmod:drive:drive_hardstopblock:UnspecifiedRotationUpperLimit', horzcat('Error in ', thisBlockName, ':', ' The relative rotation upper limit must be specified.'));
            % 63 66
            % 64 66
        end % if
        % 66 69
        % 67 69
        LowerLimit = Ws(strmatch('Limit_lower', Search, 'exact')).Value;
        if isempty(LowerLimit) || ge(LowerLimit, UpperLimit)
            error('physmod:drive:drive_hardstopblock:InvalidRotationLowerLimit', horzcat('Error in ', thisBlockName, ':', ' The relative rotation lower limit must not be greater than ', 'or equal to the upper limit. Check and set the lower limit to an ', 'appropriate value.'));
            % 71 76
            % 72 76
            % 73 76
            % 74 76
        end % if
        % 76 79
        % 77 79
        ContactStiffness = Ws(strmatch('Stiffness', Search, 'exact')).Value;
        if isempty(ContactStiffness) || le(ContactStiffness, 0.0)
            error('physmod:drive:drive_hardstopblock:InvalidContactStiffness', horzcat('Error in ', thisBlockName, ':', ' The contact stiffness must be positive. Change the ', 'contact stiffness to a positive value.'));
            % 81 85
            % 82 85
            % 83 85
        end % if
        % 85 88
        % 86 88
        ContactDamping = Ws(strmatch('Damping', Search, 'exact')).Value;
        if isempty(ContactDamping) || lt(ContactDamping, 0.0)
            error('physmod:drive:drive_hardstopblock:InvalidContactDamping', horzcat('Error in ', thisBlockName, ':', ' The contact damping must not be negative. Change the ', 'contact damping to a positive or zero value.'));
            % 90 94
            % 91 94
            % 92 94
        end % if
    otherwise
        Name = get_param(gcb, 'Name');
        Parent = get_param(gcb, 'Parent');
        error('physmod:drive:drive_hardstopblock:IllegalMode', horzcat('Error in ', Parent, '/', Name, ':', ' Illegal Mode value.'));
        % 98 100
    end % switch
