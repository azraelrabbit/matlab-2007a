function varargout = drive_planetplanetblock(Mode, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    weState = drive_handleerror('save_flags');
    drive_handleerror('clear_flags');
    % 15 18
    % 16 18
    switch lower(Mode)
    case 'mask'
        % 19 21
        if not(isempty(varargin))
            thisBlock = varargin{1.0};
        else
            thisBlock = gcb;
        end % if
        % 25 27
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        % 28 30
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
        Icon.y6 = [.3 .3];
        Icon.x7 = [.3 .3 .4 .2];
        Icon.y7 = [.3 -.3 -.3 -.3];
        Icon.x8 = [.3 .5];
        Icon.y8 = [0.0 0.0];
        Icon.x9 = [.5 .5 .8 .8 .5 .5];
        Icon.y9 = [0.0 .2 .2 -.2 -.2 0.0];
        Icon.x10 = [.8 1.0];
        Icon.y10 = [0.0 0.0];
        Icon.x11 = [-.6 -.1];
        Icon.y11 = [-.2 -.2];
        Icon.x12 = [-.5 -.2];
        Icon.y12 = [-.25 -.25];
        Icon.x13 = [-.4 -.3];
        Icon.y13 = [-.31 -.31];
        Icon.x14 = [.4 .9];
        Icon.y14 = [-.2 -.2];
        Icon.x15 = [.5 .8];
        Icon.y15 = [-.25 -.25];
        Icon.x16 = [.6 .7];
        Icon.y16 = [-.31 -.31];
        % 61 65
        % 62 65
        % 63 65
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        % 68 70
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn, 'Tag', 'C');
        drive_set_param(PHandles.RConn(1.0), 'Tag', 'P');
        drive_set_param(PHandles.RConn(2.0), 'Tag', 'S');
        % 73 75
        varargout{1.0} = Icon;
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        rtParam = l_GetRtParam(thisBlock);
        drive_configurertp(Mode, thisBlock, rtParam);
        % 82 84
    case 'parametereditingmodes'
        % 83 86
        % 84 86
        varargout{1.0} = [];
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        % 87 89
        drive_callback(gcbh, Mode);
    case 'compile'
        % 90 93
        % 91 93
        Data = varargin{1.0};
        % 93 95
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVEPLANETPLANET';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.planetPlanet = DRIVE.DrivePlanetPlanet;
        % 100 102
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        % 103 105
        Ratio = Ws(strmatch('Ratio', Search, 'exact')).Value;
        Data.block.planetPlanet.ratio = Ratio;
        if isempty(Ratio) || le(Ratio, 0.0)
            blockName = horzcat('''', regexprep(Data.block.name, '\n+', ' '), '''');
            error('physmod:drive:drive_planetplanetblock:InvalidGearRatio', horzcat('The Planet-Planet Gear block: ', blockName, ' contains a nonpositive gear ratio.', '  Change this ratio to a positive number.'));
            % 109 112
            % 110 112
        end % if
        % 112 114
        for i=1.0:length(Data.PortHandle)
            name = drive_get_param(Data.PortHandle(i), 'Tag');
            switch lower(name)
            case 'c'
                Data.block.planetPlanet.carrierFlange = minus(i, 1.0);
            case 's'
                Data.block.planetPlanet.sunFlange = minus(i, 1.0);
            case 'p'
                Data.block.planetPlanet.planetFlange = minus(i, 1.0);
            end % switch
        end % for
        % 124 129
        % 125 129
        % 126 129
        % 127 129
        rtParam = l_GetRtParam(Data.BlockHandle);
        Data = drive_configurertp(Mode, Data, rtParam);
        % 130 132
        varargout{1.0} = Data;
        % 132 134
    end % switch
    % 134 136
    drive_handleerror('restore_flags', weState);
    % 136 138
function rtParam = l_GetRtParam(blockHandle)
    % 138 142
    % 139 142
    % 140 142
    refBlock = get_param(blockHandle, 'ReferenceBlock');
    % 142 144
    switch lower(refBlock)
    case BLOCKPLANETPLANET
        rtParam(1.0).blockName = 'PlanetPlanetRatio';
        rtParam(1.0).maskName = 'Ratio';
        rtParam(1.0).enumName = 'DRIVERTP_PLANETPLANETGEARRATIO';
    otherwise
        rtParam = [];
    end % switch
    % 151 153
function name = BLOCKPLANETPLANET
    % 153 157
    % 154 157
    % 155 157
    name = lower(sprintf('driveline/Gears/Planet-Planet'));
