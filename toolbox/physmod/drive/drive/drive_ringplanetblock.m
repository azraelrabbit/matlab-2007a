function varargout = drive_ringplanetblock(Mode, varargin)
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
    weState = drive_handleerror('save_flags');
    drive_handleerror('clear_flags');
    % 14 16
    switch lower(Mode)
    case 'mask'
        % 17 19
        if not(isempty(varargin))
            thisBlock = varargin{1.0};
        else
            thisBlock = gcb;
        end % if
        % 23 25
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        % 26 28
        Icon.x1 = [-.7 -.5 -.5 -.2 -.2 -.5 -.5];
        Icon.y1 = [0.0 0.0 .2 .2 -.2 -.2 0.0];
        Icon.x2 = [-.2 0.0 0.0 .3 .3 .3];
        Icon.y2 = [0.0 0.0 .6 .6 .8 .4];
        Icon.x3 = [.3 .3];
        Icon.y3 = [.6 .6];
        Icon.x4 = [.2 .4];
        Icon.y4 = [.4 .4];
        Icon.x5 = [.2 .4];
        Icon.y5 = [.8 .8];
        Icon.x6 = [.2 .4];
        Icon.y6 = [.9 .9];
        Icon.x7 = [.3 .3 .65 .65];
        Icon.y7 = [.9 1.0 1.0 0.0];
        Icon.x8 = [.7 1.0];
        Icon.y8 = [0.0 0.0];
        Icon.x9 = [1.0 1.0 1.3 1.3 1.0 1.0];
        Icon.y9 = [0.0 .2 .2 -.2 -.2 0.0];
        Icon.x10 = [1.3 1.5];
        Icon.y10 = [0.0 0.0];
        Icon.x11 = [-.6 -.1];
        Icon.y11 = [-.2 -.2];
        Icon.x12 = [-.5 -.2];
        Icon.y12 = [-.25 -.25];
        Icon.x13 = [-.4 -.3];
        Icon.y13 = [-.31 -.31];
        Icon.x14 = [.9 1.4];
        Icon.y14 = [-.2 -.2];
        Icon.x15 = [1.0 1.3];
        Icon.y15 = [-.25 -.25];
        Icon.x16 = [1.1 1.2];
        Icon.y16 = [-.31 -.31];
        % 59 63
        % 60 63
        % 61 63
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.8;
        Icon.UpperRighty = 1.0;
        % 66 68
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn(1.0), 'Tag', 'P');
        drive_set_param(PHandles.LConn(2.0), 'Tag', 'C');
        drive_set_param(PHandles.RConn, 'Tag', 'R');
        % 71 73
        varargout{1.0} = Icon;
        % 73 78
        % 74 78
        % 75 78
        % 76 78
        rtParam = l_GetRtParam(thisBlock);
        drive_configurertp(Mode, thisBlock, rtParam);
    case 'parametereditingmodes'
        % 80 83
        % 81 83
        varargout{1.0} = [];
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        % 84 86
        drive_callback(gcbh, Mode);
    case 'compile'
        % 87 90
        % 88 90
        Data = varargin{1.0};
        % 90 92
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVEPLANETRING';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.planetRing = DRIVE.DrivePlanetRing;
        % 97 99
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        % 100 102
        Ratio = Ws(strmatch('Ratio', Search, 'exact')).Value;
        Data.block.planetRing.ratio = Ratio;
        if isempty(Ratio) || le(Ratio, 1.0)
            blockName = horzcat('''', regexprep(Data.block.name, '\n+', ' '), '''');
            error('physmod:drive:drive_ringplanetblock:InvalidGearRatio', horzcat('The Ring-Planet Gear block: ', blockName, ' must have a gear ratio greater than one.', '  Change this ratio to a positive number.'));
            % 106 109
            % 107 109
        end % if
        % 109 111
        for i=1.0:length(Data.PortHandle)
            name = drive_get_param(Data.PortHandle(i), 'Tag');
            switch lower(name)
            case 'c'
                Data.block.planetRing.carrierFlange = minus(i, 1.0);
            case 'p'
                Data.block.planetRing.planetFlange = minus(i, 1.0);
            case 'r'
                Data.block.planetRing.ringFlange = minus(i, 1.0);
            end % switch
        end % for
        % 121 126
        % 122 126
        % 123 126
        % 124 126
        rtParam = l_GetRtParam(Data.BlockHandle);
        Data = drive_configurertp(Mode, Data, rtParam);
        % 127 129
        varargout{1.0} = Data;
    end % switch
    % 130 132
    drive_handleerror('restore_flags', weState);
    % 132 134
function rtParam = l_GetRtParam(blockHandle)
    % 134 138
    % 135 138
    % 136 138
    refBlock = get_param(blockHandle, 'ReferenceBlock');
    % 138 140
    switch lower(refBlock)
    case BLOCKRINGPLANET
        rtParam(1.0).blockName = 'RingPlanetRatio';
        rtParam(1.0).maskName = 'Ratio';
        rtParam(1.0).enumName = 'DRIVERTP_RINGPLANETGEARRATIO';
    otherwise
        rtParam = [];
    end % switch
    % 147 149
function name = BLOCKRINGPLANET
    % 149 153
    % 150 153
    % 151 153
    name = lower(sprintf('driveline/Gears/Ring-Planet'));
