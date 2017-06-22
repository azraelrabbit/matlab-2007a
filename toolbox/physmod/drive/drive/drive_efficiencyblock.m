function varargout = drive_efficiencyblock(Mode, varargin)
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
        Tolerance = varargin{1.0};
        LossPower = varargin{2.0};
        LossTorque = varargin{3.0};
        DriveEfficiency = varargin{4.0};
        EfficiencyType = varargin{5.0};
        % 21 24
        % 22 24
        Icon.x1 = [-.5 -.8];
        Icon.y1 = [0.0 0.0];
        Icon.x2 = [.5 .8];
        Icon.y2 = [0.0 0.0];
        Icon.x3 = [-.5 -.5 .5 .5 -.5];
        Icon.y3 = [-.2 .2 .2 -.2 -.2];
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        varargout{1.0} = Icon;
        Affordance.x = [];
        Affordance.y = [];
        StartIndex = 1.0;
        if eq(EfficiencyType, 3.0)
            Affordance.x = [-.5 -.48 -.46 -.44 -.42 -.4 -.38 -.36 -.33999999999999997 -.32 -.3 -.28 -.26 -.24 -.21999999999999997 -.2 -.18 -.15999999999999998 -.14 -.12 -.09999999999999998 -.08000000000000002 -.06 -.03999999999999998 -.020000000000000018 0.0 .020000000000000018 .03999999999999998 .06 .08000000000000002 .09999999999999998 .12 .14 .15999999999999998 .18 .2 .21999999999999997 .24 .26 .28 .3 .32 .33999999999999997 .36 .38 .4 .42 .44 .46 .48 .5];
            Affordance.y = plus(mtimes(.2, sin(mrdivide(mtimes(3.141592653589793, Affordance.x), .5))), .6);
            Affordance.x = Affordance.x;
            StartIndex = 3.0;
        else
            if eq(EfficiencyType, 2.0)
                Affordance.x = [-.5 -.3 -.3 -.1 -.1 .1 .1 .3 .3 .5];
                Affordance.y = [.35 .35 .5 .5 .65 .65 .8 .8 .35 .35];
                StartIndex = 2.0;
            end
        end
        varargout{2.0} = Affordance;
        Name = eval('gcb');
        FullName = drive_gentag(Name);
        PortNames{1.0} = 'Trig ';
        PortNames{2.0} = 'E';
        GotoNames{1.0} = 'Trigger';
        GotoNames{2.0} = 'DriveEfficiency';
        if eq(StartIndex, 2.0) || eq(StartIndex, 3.0)
            for i=minus(StartIndex, 1.0):2.0
                PortName = PortNames{i};
                GotoName = GotoNames{i};
                Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
                if isempty(Port)
                    NewBlock = add_block('built-in/Inport', horzcat(Name, '/', PortName));
                    set_param(NewBlock, 'Position', [15.0 60.0 35.0 80.0]);
                    NewBlock = add_block('built-in/Goto', horzcat(Name, '/', GotoName));
                    set_param(NewBlock, 'Position', [105.0 60.0 125.0 80.0]);
                    set_param(NewBlock, 'TagVisibility', 'Global');
                    add_line(Name, horzcat(PortName, '/1'), horzcat(GotoName, '/1'));
                end
                set_param(horzcat(Name, '/', GotoName), 'GotoTag', horzcat(FullName, GotoName));
            end % for
        end
        if eq(StartIndex, 1.0) || eq(StartIndex, 3.0)
            if eq(StartIndex, 3.0)
                EndIndex = 1.0;
                StartIndex = 1.0;
            else
                EndIndex = 2.0;
            end
            for i=StartIndex:EndIndex
                PortName = PortNames{i};
                GotoName = GotoNames{i};
                Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
                if not(isempty(Port))
                    delete_line(Name, horzcat(PortName, '/1'), horzcat(GotoName, '/1'));
                    delete_block(horzcat(Name, '/', PortName));
                    delete_block(horzcat(Name, '/', GotoName));
                end
            end % for
        end
        % 90 92
        if LossTorque || LossPower || eq(EfficiencyType, 2.0) || eq(EfficiencyType, 3.0)
            set_param(Name, 'MaskIconOpaque', 'off');
        else
            set_param(Name, 'MaskIconOpaque', 'on');
        end
        % 96 98
        DriveSignal{1.0} = LossTorque;
        DriveSignal{2.0} = LossPower;
        % 99 101
        OutPosition{1.0} = [375.0 55.0 395.0 75.0];
        OutPosition{2.0} = [375.0 105.0 395.0 125.0];
        % 102 104
        FromPosition{1.0} = [270.0 51.0 310.0 79.0];
        FromPosition{2.0} = [270.0 101.0 310.0 129.0];
        % 105 107
        OutputNames{1.0} = 'T';
        OutputNames{2.0} = 'L';
        % 108 110
        FromNames{1.0} = 'Torque';
        FromNames{2.0} = 'Loss';
        % 111 113
        pCount = 0.0;
        for i=1.0:2.0
            FromName = FromNames{i};
            PortName = OutputNames{i};
            NewName = horzcat(Name, '/', PortName);
            Port = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Name', PortName);
            if eq(DriveSignal{i}, 1.0)
                pCount = plus(pCount, 1.0);
                if isempty(Port)
                    NewBlock = add_block('built-in/Outport', NewName);
                    set_param(NewBlock, 'Port', num2str(pCount));
                    set_param(NewBlock, 'Position', OutPosition{i});
                    % 124 126
                    NewBlock = add_block('built-in/From', horzcat(Name, '/', FromName));
                    set_param(NewBlock, 'Position', FromPosition{i});
                    add_line(Name, horzcat(FromName, '/1'), horzcat(PortName, '/1'), 'autorouting', 'on');
                end
                set_param(horzcat(Name, '/', FromName), 'GotoTag', horzcat(FullName, FromName));
            else
                if not(isempty(Port))
                    delete_line(Name, horzcat(FromName, '/1'), horzcat(PortName, '/1'));
                    delete_block(NewName);
                    delete_block(horzcat(Name, '/', FromName));
                end
            end
        end % for
        phs = get_param(Name, 'PortHandles');
        drive_set_param(phs.RConn, 'Tag', 'A');
        drive_set_param(phs.LConn, 'Tag', 'B');
    case 'compile'
        Data = varargin{1.0};
        % 143 145
        Data.block = DRIVE.DriveBlock;
        Data.block.type = 'DriveEfficiency';
        Data.block.name = getfullname(Data.BlockHandle);
        Data.block.visibleName = drive_getvisibleblock(Data.BlockHandle);
        Data.block.flange = minus(Data.FlangeMap(Data.PortIndex), 1.0);
        Data.block.efficiency = DRIVE.DriveEfficiency;
        % 150 152
        Ws = get_param(Data.BlockHandle, 'MaskWsVariables');
        Search = cellhorzcat(Ws.Name);
        % 153 155
        LossTorque = Ws(strmatch('LossTorque', Search, 'exact')).Value;
        if LossTorque
            Data.block.efficiency.lossTorque = true;
            From = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'From');
            if gt(length(From), 1.0)
                if strcmp(get_param(From(1.0), 'Name'), 'Torque')
                    FromTorque = From(1.0);
                else
                    FromTorque = From(2.0);
                end
            else
                FromTorque = From;
            end
            Data.block.efficiency.lossTorqueFlag = get_param(FromTorque, 'GotoTag');
            Data.SizesStructure.numDynamicOutputs = plus(Data.SizesStructure.numDynamicOutputs, 1.0);
        end
        % 170 172
        LossPower = Ws(strmatch('LossPower', Search, 'exact')).Value;
        if LossPower
            Data.block.efficiency.lossPower = true;
            From = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'From');
            if gt(length(From), 1.0)
                if strcmp(get_param(From(1.0), 'Name'), 'Loss')
                    FromPower = From(1.0);
                else
                    FromPower = From(2.0);
                end
            else
                FromPower = From;
            end
            Data.block.efficiency.lossPowerFlag = get_param(FromPower, 'GotoTag');
            Data.SizesStructure.numDynamicOutputs = plus(Data.SizesStructure.numDynamicOutputs, 1.0);
        end
        % 187 189
        VelocityTolerance = Ws(strmatch('Tolerance', Search, 'exact')).Value;
        if isempty(VelocityTolerance)
            VelocityTolerance = 0.0;
        else
            if lt(VelocityTolerance, 0.0)
                VelocityTolerance = 0.0;
            end
        end
        Data.block.efficiency.velocityTolerance = VelocityTolerance;
        LinearizationFlag = Ws(strmatch('LinearizationFlag', Search, 'exact')).Value;
        if eq(LinearizationFlag, 1.0)
            Data.block.efficiency.forceUnityEfficiency = true;
        else
            Data.block.efficiency.forceUnityEfficiency = false;
        end
        EfficiencyType = Ws(strmatch('EfficiencyType', Search, 'exact')).Value;
        switch EfficiencyType
        case 1.0
            Data.block.efficiency.isFixed = true;
            Data.block.efficiency.isDiscrete = false;
            Data.block.efficiency.isContinuous = false;
            Data.block.efficiency.efficiencyFactor = str2num(get_param(Data.BlockHandle, 'Efficiency'));
        case 2.0
            Data.block.efficiency.isFixed = false;
            Data.block.efficiency.isDiscrete = true;
            Data.block.efficiency.isContinuous = false;
            % 214 216
            Goto = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'Goto');
            Trigger = strmatch('Trigger', get_param(Goto, 'Name'));
            DriveEfficiency = strmatch('DriveEfficiency', get_param(Goto, 'Name'));
            if not(isempty(Trigger))
                Data.block.efficiency.triggerFlag = get_param(Goto(Trigger), 'GotoTag');
            end
            if not(isempty(DriveEfficiency))
                Data.block.efficiency.efficiencyFlag = get_param(Goto(DriveEfficiency), 'GotoTag');
            end
            Data.SizesStructure.numModes = plus(Data.SizesStructure.numModes, 1.0);
            Data.SizesStructure.numDynamicInputs = plus(Data.SizesStructure.numDynamicInputs, 2.0);
            Data.SizesStructure.numZeroCrossings = plus(Data.SizesStructure.numZeroCrossings, 1.0);
        case 3.0
            Data.block.efficiency.isFixed = false;
            Data.block.efficiency.isDiscrete = false;
            Data.block.efficiency.isContinuous = true;
            % 231 233
            Goto = find_system(Data.BlockHandle, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'BlockType', 'Goto');
            DriveEfficiency = strmatch('DriveEfficiency', get_param(Goto, 'Name'));
            if not(isempty(DriveEfficiency))
                Data.block.efficiency.efficiencyFlag = get_param(Goto(DriveEfficiency), 'GotoTag');
            end
            Data.SizesStructure.numDynamicInputs = plus(Data.SizesStructure.numDynamicInputs, 1.0);
        end
        % 239 242
        % 240 242
        Data.SizesStructure.numModes = plus(Data.SizesStructure.numModes, 1.0);
        Data.SizesStructure.numZeroCrossings = plus(Data.SizesStructure.numZeroCrossings, 1.0);
        % 243 245
        varargout{1.0} = Data;
    end
end
