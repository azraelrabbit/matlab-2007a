function varargout = drive_dualratioplanetarygearblock(Mode, varargin)
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
        Icon.x12 = [-.1 .1 .1 .1 0.0 .2 .1 .1 0.0 .2];
        Icon.y12 = [.4 .4 .3 .5 .5 .5 .5 .3 .3 .3];
        Icon.x13 = [.65 .9];
        Icon.y13 = [.05 .05];
        Icon.x14 = [.65 .9];
        Icon.y14 = [0.0 0.0];
        Icon.x15 = [0.0 .2 .1 .1 .3 .3 .35];
        Icon.y15 = [.55 .55 .55 .7 .7 .05 .05];
        Affordance.x1 = [.1 .6];
        Affordance.y1 = [.525 .525];
        Affordance.x2 = [.5 .6];
        Affordance.y2 = [.625 .525];
        Affordance.x3 = [.5 .6];
        Affordance.y3 = [.425 .525];
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
        % 142 149
        % 143 149
        % 144 149
        % 145 149
        % 146 149
        % 147 149
        PHandles = get_param(gcb, 'PortHandles');
        for i=1.0:length(PHandles.LConn)
            drive_set_param(PHandles.LConn(i), 'Tag', 'C');
        end % for
        drive_set_param(PHandles.RConn(1.0), 'Tag', 'R');
        drive_set_param(PHandles.RConn(2.0), 'Tag', 'S');
        % 155 157
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        % 156 158
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        % 159 162
        % 160 162
        authoringParams = {'Show'};
        varargout{1.0} = drive_setparammode(authoringParams);
        % 163 165
    case 'compile'
    case 'validate'
        % 166 176
        % 167 176
        % 168 176
        % 169 176
        % 170 176
        % 171 176
        % 172 176
        % 173 176
        % 174 176
        thisName = varargin{1.0};
        wsvariables = drive_getmaskdata(thisName);
        ringPlanetRatio = wsvariables.RP;
        planetSunRatio = wsvariables.PS;
        % 179 181
        thisName = horzcat('''', thisName, '''');
        % 181 186
        % 182 186
        % 183 186
        % 184 186
        errorMsg = '';
        % 186 188
        if lt(ringPlanetRatio, 0.0)
            tmpStr = horzcat('Gear block: ', thisName, ' contains a nonpositive gear ratio ', '''Ring(R)/Planet(P)''.', ' Change this ratio to a positive value.');
            % 189 191
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 196 198
        if lt(planetSunRatio, 0.0)
            tmpStr = horzcat('Gear block: ', thisName, ' contains a nonpositive gear ratio ', '''Planet(P)/Sun(S)''.', '  Change this ratio to a positive value.');
            % 199 201
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 206 208
        if lt(ringPlanetRatio, 1.0)
            % 208 210
            tmpStr = horzcat('The Dual-Ratio Planetary Gear block: ', thisName, ':', 'Ring(R)/Planet(P) gear ', 'ratio must be greater than one.  Change this ratio to a positive value.');
            % 210 212
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 217 219
        noError = isempty(errorMsg);
        varargout{1.0} = noError;
        varargout{2.0} = errorMsg;
    end
end
