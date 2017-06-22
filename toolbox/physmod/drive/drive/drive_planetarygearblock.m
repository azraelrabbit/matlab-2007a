function varargout = drive_planetarygearblock(Mode, varargin)
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
        Name = eval('gcb');
        % 16 18
        Offsetx = -.7;
        Offsety = -.2;
        Icon.x1 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y1 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x2 = plus(Offsetx, [-.2 .2]);
        Icon.y2 = plus(Offsety, [-.06 -.06]);
        Icon.x3 = plus(Offsetx, [-.1 .1]);
        Icon.y3 = plus(Offsety, [-.12 -.12]);
        Offsetx = .5;
        Offsety = -.2;
        Icon.x4 = plus(Offsetx, [-.15 -.15 .15 .15 .3 -.3]);
        Icon.y4 = plus(Offsety, [0.0 .35 .35 0.0 0.0 0.0]);
        Icon.x5 = plus(Offsetx, [-.2 .2]);
        Icon.y5 = plus(Offsety, [-.06 -.06]);
        Icon.x6 = plus(Offsetx, [-.1 .1]);
        Icon.y6 = plus(Offsety, [-.12 -.12]);
        Icon.x7 = [-1.1 -.85];
        Icon.y7 = [0.0 0.0];
        Icon.x8 = [-.55 -.4 -.4 -.05];
        Icon.y8 = [0.0 0.0 .4 .4];
        Icon.x9 = [-.15 -.15 -.3 0.0 -.15 -.15 -.3 0.0];
        Icon.y9 = [.4 .6 .6 .6 .6 .2 .2 .2];
        Icon.x10 = [-.3 0.0 -.15 -.15 -.3 0.0];
        Icon.y10 = [.15 .15 .15 -.15 -.15 -.15];
        Icon.x11 = [-.15 .35];
        Icon.y11 = [0.0 0.0];
        Icon.x12 = [-.3 0.0 -.15 -.15 .2 .2 .35];
        Icon.y12 = [.65 .65 .65 .7 .7 .05 .05];
        Icon.x13 = [.65 .9];
        Icon.y13 = [.05 .05];
        Icon.x14 = [.65 .9];
        Icon.y14 = [0.0 0.0];
        Affordance.x1 = [-.8 -.4];
        Affordance.y1 = [.625 .625];
        Affordance.x2 = [-.8 -.6];
        Affordance.y2 = [.625 .725];
        Affordance.x3 = [-.8 -.6];
        Affordance.y3 = [.625 .525];
        Icon.LowerLeftx = -1.0;
        Icon.LowerLefty = -1.0;
        Icon.UpperRightx = 1.0;
        Icon.UpperRighty = 1.0;
        varargout{1.0} = Icon;
        varargout{2.0} = Affordance;
        LinearizationFlag = varargin{1.0};
        DriveBlock = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'on', 'Name', 'Ring-Planet');
        Ws = get_param(DriveBlock{1.0}, 'MaskWsVariables');
        HasLinearizationFlag = strmatch('LinearizationFlag', cellhorzcat(Ws.Name), 'exact');
        if not(isempty(HasLinearizationFlag))
            if eq(LinearizationFlag, 1.0)
                set_param(DriveBlock{1.0}, 'LinearizationFlag', 'on');
            else
                set_param(DriveBlock{1.0}, 'LinearizationFlag', 'off');
            end
        end
        Show = varargin{2.0};
        Old = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'P');
        if Show
            if isempty(Old)
                NewBlock = add_block('built-in/pmIOPort', horzcat(Name, '/P'));
                set_param(NewBlock, 'ForegroundColor', 'Magenta');
                add_line(Name, 'P/RConn1', 'Planet-Planet/RConn1', 'autorouting', 'on');
            end
        else
            if not(isempty(Old))
                Port = get_param(horzcat(Name, '/P'), 'PortHandles');
                delete_line(get_param(Port.RConn, 'Line'));
                delete_block(horzcat(Name, '/P'));
            end
        end
        if gt(nargin, 3.0)
            DriveBlock = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'on', 'Name', 'Ring-Planet');
            DriveBlock = get_param(DriveBlock{1.0}, 'Name');
            LossTorque = varargin{3.0};
            LossPower = varargin{4.0};
            if eq(LossTorque, 0.0)
                Old = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'T');
                if not(isempty(Old))
                    delete_line(Name, strcat(DriveBlock, '/1'), 'T/1');
                    delete_block(horzcat(Name, '/T'));
                end
                if isempty(find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'Terminator '))
                    NewBlock = add_block('built-in/Terminator', horzcat(Name, '/Terminator '));
                    set_param(NewBlock, 'Position', [450.0 120.0 470.0 140.0]);
                    add_line(Name, strcat(DriveBlock, '/1'), 'Terminator /1', 'autorouting', 'on');
                end
            else
                Old = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'Terminator ');
                if not(isempty(Old))
                    delete_line(Name, strcat(DriveBlock, '/1'), 'Terminator /1');
                    delete_block(horzcat(Name, '/Terminator '));
                end
                if isempty(find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'T'))
                    NewBlock = add_block('built-in/Outport', horzcat(Name, '/T'));
                    set_param(NewBlock, 'Position', [450.0 155.0 470.0 175.0]);
                    add_line(Name, strcat(DriveBlock, '/1'), 'T/1', 'autorouting', 'on');
                end
                set_param(horzcat(Name, '/T'), 'Port', '1');
            end
            if eq(LossPower, 0.0)
                Old = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'L');
                if not(isempty(Old))
                    delete_line(Name, strcat(DriveBlock, '/2'), 'L/1');
                    delete_block(horzcat(Name, '/L'));
                end
                if isempty(find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'Terminator'))
                    NewBlock = add_block('built-in/Terminator', horzcat(Name, '/Terminator'));
                    set_param(NewBlock, 'Position', [450.0 155.0 470.0 175.0]);
                    add_line(Name, strcat(DriveBlock, '/2'), 'Terminator/1', 'autorouting', 'on');
                end
            else
                Old = find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'Terminator');
                if not(isempty(Old))
                    delete_line(Name, strcat(DriveBlock, '/2'), 'Terminator/1');
                    delete_block(horzcat(Name, '/Terminator'));
                end
                if isempty(find_system(Name, 'SearchDepth', 1.0, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'Regexp', 'off', 'Name', 'L'))
                    NewBlock = add_block('built-in/Outport', horzcat(Name, '/L'));
                    set_param(NewBlock, 'Position', [450.0 155.0 470.0 175.0]);
                    add_line(Name, strcat(DriveBlock, '/2'), 'L/1', 'autorouting', 'on');
                end
            end
        end
        % 140 148
        % 141 148
        % 142 148
        % 143 148
        % 144 148
        % 145 148
        % 146 148
        PHandles = get_param(gcb, 'PortHandles');
        for i=1.0:length(PHandles.LConn)
            drive_set_param(PHandles.LConn(i), 'Tag', 'C');
        end % for
        drive_set_param(PHandles.RConn(1.0), 'Tag', 'R');
        drive_set_param(PHandles.RConn(2.0), 'Tag', 'S');
    case 'compile'
        % 154 156
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        % 158 161
        % 159 161
        authoringParams = {'Show'};
        varargout{1.0} = drive_setparammode(authoringParams);
        % 162 164
    case 'validate'
        % 164 174
        % 165 174
        % 166 174
        % 167 174
        % 168 174
        % 169 174
        % 170 174
        % 171 174
        % 172 174
        thisName = varargin{1.0};
        wsvariables = drive_getmaskdata(thisName);
        ringSunRatio = wsvariables.Ratio;
        % 176 178
        noError = gt(ringSunRatio, 1.0);
        varargout{1.0} = noError;
        varargout{2.0} = '';
        if eq(noError, false)
            thisName = horzcat('''', thisName, '''');
            % 182 188
            % 183 188
            % 184 188
            % 185 188
            % 186 188
            varargout{2.0} = horzcat('The Planetary Gear block: ', thisName, ':', 'Ring(R)/Sun (S) gear ', 'ratio must be larger than one.');
            % 188 190
        end
    end
end
