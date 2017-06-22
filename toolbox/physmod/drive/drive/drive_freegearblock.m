function varargout = drive_freegearblock(Mode, varargin)
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
        Icon.x1 = [-1.2 -.9];
        Icon.y1 = [0.0 0.0];
        Icon.x2 = [.8 1.1];
        Icon.y2 = [0.0 0.0];
        Icon.x3 = [-.5 -.2];
        Icon.y3 = [0.0 0.0];
        Icon.x4 = [.4 .1];
        Icon.y4 = [0.0 0.0];
        Icon.x5 = [-.2 -.2];
        Icon.y5 = [-.2 .2];
        Icon.x6 = [.1 .1];
        Icon.y6 = [-.2 .2];
        Offsetx = -.7;
        Offsety = -.2;
        Icon.x7 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y7 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x8 = plus(Offsetx, [-.2 .2]);
        Icon.y8 = plus(Offsety, [-.06 -.06]);
        Icon.x9 = plus(Offsetx, [-.1 .1]);
        Icon.y9 = plus(Offsety, [-.12 -.12]);
        Offsetx = .6;
        Offsety = -.2;
        Icon.x10 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y10 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x11 = plus(Offsetx, [-.2 .2]);
        Icon.y11 = plus(Offsety, [-.06 -.06]);
        Icon.x12 = plus(Offsetx, [-.1 .1]);
        Icon.y12 = plus(Offsety, [-.12 -.12]);
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn, 'Tag', 'B');
        drive_set_param(PHandles.RConn, 'Tag', 'F');
        varargout{1.0} = Icon;
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        varargout{1.0} = [];
    case 'compile'
        Data = varargin{1.0};
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVEFREEGEAR';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        varargout{1.0} = Data;
    end % switch
end % function
