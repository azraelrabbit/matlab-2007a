function varargout = drive_simplegearblock(Mode, varargin)
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
    % 15 17
    switch lower(Mode)
    case 'mask'
        Name = getfullname(varargin{1.0});
        Ratio = varargin{2.0};
        % 20 22
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        Offsetx = -.6;
        Offsety = -.5;
        Icon.x1 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y1 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x2 = plus(Offsetx, [-.2 .2]);
        Icon.y2 = plus(Offsety, [-.06 -.06]);
        Icon.x3 = plus(Offsetx, [-.1 .1]);
        Icon.y3 = plus(Offsety, [-.12 -.12]);
        Offsetx = .6;
        Offsety = .2;
        Icon.x4 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y4 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x5 = plus(Offsetx, [-.2 .2]);
        Icon.y5 = plus(Offsety, [-.06 -.06]);
        Icon.x6 = plus(Offsetx, [-.1 .1]);
        Icon.y6 = plus(Offsety, [-.12 -.12]);
        Icon.x6 = [-1.0 -.75];
        Icon.y6 = [-.3 -.3];
        Icon.x7 = [-.45 0.0 0.0 -.2 .2 0.0 0.0 -.2 .2];
        Icon.y7 = [-.3 -.3 -.6 -.6 -.6 -.6 0.0 0.0 0.0];
        Icon.x8 = uminus(Icon.x7);
        Icon.y8 = plus(Icon.y7, .7);
        Icon.x9 = uminus(Icon.x6);
        Icon.y9 = plus(Icon.y6, .7);
        Icon.x10 = [];
        Icon.y10 = [];
        Icon.x11 = [];
        Icon.y11 = [];
        Icon.x12 = [];
        Icon.y12 = [];
        % 53 81
        % 54 81
        % 55 81
        % 56 81
        % 57 81
        % 58 81
        % 59 81
        % 60 81
        % 61 81
        % 62 81
        % 63 81
        % 64 81
        % 65 81
        % 66 81
        % 67 81
        % 68 81
        % 69 81
        % 70 81
        % 71 81
        % 72 81
        % 73 81
        % 74 81
        % 75 81
        % 76 81
        % 77 81
        % 78 81
        % 79 81
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        % 84 86
        varargout{1.0} = Icon;
        % 86 88
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn, 'Tag', 'B');
        drive_set_param(PHandles.RConn, 'Tag', 'F');
        % 90 95
        % 91 95
        % 92 95
        % 93 95
        rtParam = l_GetRtParam(Name);
        drive_configurertp(Mode, Name, rtParam);
    case 'parametereditingmodes'
        % 97 100
        % 98 100
        authoringParams = {'Reversing'};
        varargout{1.0} = drive_setparammode(authoringParams);
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        % 102 104
        drive_callback(gcbh, Mode);
    case 'compile'
        % 105 108
        % 106 108
        Data = varargin{1.0};
        % 108 110
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVESIMPLEGEAR';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.simpleGear = DRIVE.DriveSimpleGear;
        % 115 117
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        % 118 120
        if strcmp(drive_get_param(Data.PortHandle(1.0), 'Tag'), 'B')
            Data.block.simpleGear.inputFlange = 0.0;
            Data.block.simpleGear.outputFlange = 1.0;
        else
            Data.block.simpleGear.inputFlange = 1.0;
            Data.block.simpleGear.outputFlange = 0.0;
        end % if
        % 126 128
        Ratio = Ws(strcmp('Ratio', Search)).Value;
        Data.block.simpleGear.ratio = Ratio;
        if isempty(Ratio) || le(Ratio, 0.0)
            blockName = horzcat('''', regexprep(Data.block.name, '\n+', ' '), '''');
            error('physmod:drive:drive_simplegearblock:InvalidGearRatio', horzcat('The Simple Gear block:', blockName, ' must have a positive gear ratio.', ' Change this ratio to a positive value.'));
            % 132 135
            % 133 135
        end % if
        % 135 137
        Data.block.simpleGear.reversing = logical(Ws(strcmp('Reversing', Search)).Value);
        % 137 142
        % 138 142
        % 139 142
        % 140 142
        rtParam = l_GetRtParam(Data.BlockHandle);
        Data = drive_configurertp(Mode, Data, rtParam);
        % 143 145
        varargout{1.0} = Data;
        % 145 147
    end % switch
    % 147 149
    drive_handleerror('restore_flags', weState);
    % 149 151
function rtParam = l_GetRtParam(blockHandle)
    % 151 155
    % 152 155
    % 153 155
    refBlock = get_param(blockHandle, 'ReferenceBlock');
    % 155 157
    switch lower(refBlock)
    case BLOCKSIMPLEGEAR
        rtParam(1.0).blockName = 'GearRatio';
        rtParam(1.0).maskName = 'Ratio';
        rtParam(1.0).enumName = 'DRIVERTP_SIMPLEGEARRATIO';
    otherwise
        rtParam = [];
    end % switch
    % 164 166
function name = BLOCKSIMPLEGEAR
    % 166 169
    % 167 169
    name = lower(sprintf('driveline/Gears/Simple Gear'));
