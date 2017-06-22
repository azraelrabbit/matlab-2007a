function varargout = drive_straingaugeblock(Mode, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    switch lower(Mode)
    case 'mask'
        % 19 21
        dr = get_param(0.0, 'DomainRegistry');
        dr.load('driveline_domain');
        Name = eval('gcb');
        FullName = drive_gentag(Name);
        PHandles = get_param(gcb, 'PortHandles');
        drive_set_param(PHandles.LConn, 'Tag', 'B');
        drive_set_param(PHandles.RConn, 'Tag', 'F');
        set_param(horzcat(Name, '/From'), 'GotoTag', FullName);
        % 29 31
    case 'mask_external'
        % 30 33
        % 31 33
        Icon.x1 = [-.5 -.8];
        Icon.y1 = [0.0 0.0];
        Icon.x2 = [.5 .8];
        Icon.y2 = [0.0 0.0];
        Icon.x3 = [-.5 -.5 .5 .5 -.5];
        Icon.y3 = [-.2 .2 .2 -.2 -.2];
        % 38 40
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        % 43 45
        varargout{1.0} = Icon;
        % 46 48
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        % 47 49
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        varargout{1.0} = [];
    case 'compile'
        % 52 55
        % 53 55
        Data = varargin{1.0};
        % 55 57
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DRIVESTRAINGAUGE';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.strainGauge = DRIVE.DriveStrainGauge;
        % 62 64
        From = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'From');
        % 64 66
        Data.block.strainGauge.flag = get_param(From, 'GotoTag');
        % 66 68
        if strcmp(drive_get_param(Data.PortHandle(1.0), 'Tag'), 'F')
            Data.block.strainGauge.measurementFlange = 0.0;
        else
            Data.block.strainGauge.measurementFlange = 1.0;
        end % if
        % 72 74
        Data.SizesStructure.numDynamicOutputs = plus(Data.SizesStructure.numDynamicOutputs, 1.0);
        % 74 76
        varargout{1.0} = Data;
    end % switch
