function varargout = drive_impactblock(Mode, varargin)
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
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        % 15 17
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
        drive_set_param(Ports.LConn, 'Tag', 'B');
        drive_set_param(Ports.RConn, 'Tag', 'F');
        varargout{1.0} = Icon;
    case 'compile'
        Data = varargin{1.0};
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DriveImpact';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.impact = DRIVE.DriveImpact;
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        InitialConditions = Ws(strmatch('InitialConditions', Search, 'exact')).Value;
        if eq(InitialConditions, 1.0)
            Data.block.impact.lockWhenApplyingInitialConditions = false;
        else
            Data.block.impact.lockWhenApplyingInitialConditions = true;
        end
        Linearize = Ws(strmatch('Linearize', Search, 'exact')).Value;
        if eq(Linearize, 1.0)
            Data.block.impact.lockWhenLinearizing = false;
        else
            Data.block.impact.lockWhenLinearizing = true;
        end
        RestitutionCoefficient = Ws(strmatch('Epsilon', Search, 'exact')).Value;
        if isempty(RestitutionCoefficient) || gt(RestitutionCoefficient, 1.0) || lt(RestitutionCoefficient, 0.0)
            thisBlockName = horzcat('''', get_param(Data.BlockHandle, 'Parent'), '/', get_param(Data.BlockHandle, 'Name'), '''');
            error('physmod:drive:drive_impactblock:InvalidRestitution', horzcat('Error in the Impact block:', thisBlockName, '. The restitution must lie in the interval [0,1]. Check and reset the restitution.'));
        end
        Data.block.impact.restitutionCoefficient = RestitutionCoefficient;
        VelocityTolerance = Ws(strmatch('VelocityTolerance', Search, 'exact')).Value;
        if isempty(VelocityTolerance)
            VelocityTolerance = 0.0;
        else
            if lt(VelocityTolerance, 0.0)
                VelocityTolerance = 0.0;
            end
        end
        Data.block.impact.velocityTolerance = VelocityTolerance;
        PositiveDeadZone = Ws(strmatch('PositiveDeadZone', Search, 'exact')).Value;
        if isempty(PositiveDeadZone) || lt(PositiveDeadZone, 0.0)
            thisBlockName = horzcat('''', get_param(Data.BlockHandle, 'Parent'), '/', get_param(Data.BlockHandle, 'Name'), '''');
            error('physmod:drive:drive_impactblock:InvalidBaseToFollowerDeadZone', horzcat('Error in the Impact block:', thisBlockName, '. The base-to-follower dead zone must be positive or zero.'));
        end
        Data.block.impact.positiveDeadZone = PositiveDeadZone;
        % 94 97
        % 95 97
        NegativeDeadZone = Ws(strmatch('NegativeDeadZone', Search, 'exact')).Value;
        if isempty(NegativeDeadZone) || lt(NegativeDeadZone, 0.0)
            thisBlockName = horzcat('''', get_param(Data.BlockHandle, 'Parent'), '/', get_param(Data.BlockHandle, 'Name'), '''');
            error('physmod:drive:drive_impactblock:InvalidFollowerToBaseDeadZone', horzcat('Error in the Impact block:', thisBlockName, '. The follower-to-base dead zone must be positive or zero.'));
            % 100 103
            % 101 103
        end
        Data.block.impact.negativeDeadZone = NegativeDeadZone;
        % 104 106
        if eq(PositiveDeadZone, 0.0) && eq(NegativeDeadZone, 0.0)
            thisBlockName = horzcat('''', get_param(Data.BlockHandle, 'Parent'), '/', get_param(Data.BlockHandle, 'Name'), '''');
            error('physmod:drive:drive_impactblock:InvalidDeadZones', horzcat('Error in the Impact block:', thisBlockName, '. The base-to-follower dead zone and the follower-to-base dead zone cannot both be zero.'));
            % 108 111
            % 109 111
        end
        % 111 113
        if strcmp(drive_get_param(Data.PortHandle(1.0), 'Tag'), 'B')
            Data.block.impact.baseFlange = 0.0;
            Data.block.impact.followerFlange = 1.0;
        else
            Data.block.impact.baseFlange = 1.0;
            Data.block.impact.followerFlange = 0.0;
        end
        % 119 122
        % 120 122
        Data.SizesStructure.numModes = plus(Data.SizesStructure.numModes, 1.0);
        Data.SizesStructure.numZeroCrossings = plus(Data.SizesStructure.numZeroCrossings, 4.0);
        Data.SizesStructure.numDynamicInputs = plus(Data.SizesStructure.numDynamicInputs, 0.0);
        Data.SizesStructure.numKinematicOutputs = plus(Data.SizesStructure.numKinematicOutputs, 0.0);
        Data.SizesStructure.needPositionStates = true;
        % 126 128
        varargout{1.0} = Data;
    end
end
