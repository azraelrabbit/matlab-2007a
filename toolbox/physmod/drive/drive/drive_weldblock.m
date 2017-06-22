









function varargout = drive_weldblock(Mode, varargin)
    switch lower(Mode)
    case 'mask'

        try
            dr = get_param(0.0, 'DomainRegistry');,             dr.load('driveline_domain');
        end % try
        Name = eval('gcb');


        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;

        Icon.x1 = [-.5 .5];,         Icon.y1 = [-.4 -.4];
        Icon.x2 = [-.4 .4];,         Icon.y2 = [-.5 -.5];
        Icon.x3 = [-.3 .3];,         Icon.y3 = [-.6 -.6];


        Orientation = get_param(Name, 'Orientation');
        switch lower(Orientation)
        case 'right'
            Icon.x4 = [0.0 0.0];,             Icon.y4 = [-.4 0.0];
            Icon.x5 = [0.0 1.2];,             Icon.y5 = [0.0 0.0];
        case 'left'
            Icon.x4 = [0.0 0.0];,             Icon.y4 = [-.4 0.0];
            Icon.x5 = [0.0 -1.2];,             Icon.y5 = [0.0 0.0];
        case 'up'
            Icon.y1 = plus(Icon.y1, .4);
            Icon.y2 = plus(Icon.y2, .4);
            Icon.y3 = plus(Icon.y3, .4);
            Icon.x4 = [0.0 0.0];,             Icon.y4 = [0.0 .8];
            Icon.x5 = [];,             Icon.y5 = [];
        case 'down'
            Icon.y1 = plus(Icon.y1, .4);
            Icon.y2 = plus(Icon.y2, .6);
            Icon.y3 = plus(Icon.y3, .8);
            Icon.x4 = [0.0 0.0];,             Icon.y4 = [0.0 -.8];
            Icon.x5 = [];,             Icon.y5 = [];
        end
        varargout{1.0} = Icon;

    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        varargout{1.0} = [];

    case 'compile'

        Data = varargin{1.0};

        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DriveWeld';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.weld = DRIVE.DriveWeld;
        Data.block.weld.isWeld = true;

        varargout{1.0} = Data;
    end
end