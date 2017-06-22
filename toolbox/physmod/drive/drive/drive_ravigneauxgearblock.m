function varargout = drive_ravigneauxgearblock(Mode, varargin)
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
        Icon.x1 = [-1.0 -.6 -.6 -.8 -.4];
        Icon.y1 = [.1 .1 1.1 1.1 1.1];
        Icon.x2 = [-.8 .4 -.2 -.2 -.8 .4];
        Icon.y2 = [1.2 1.2 1.2 1.7 1.7 1.7];
        Icon.x3 = [.4 0.0 .2 .2 0.0 .4];
        Icon.y3 = [1.1 1.1 1.1 .7 .7 .7];
        Icon.x4 = [.4 0.0 .2 .2 -1.0];
        Icon.y4 = [.6 .6 .6 0.0 0.0];
        Icon.x5 = [-1.3 -1.5];
        Icon.y5 = [.05 .05];
        Icon.x6 = [-1.0 -.3 -.3 .5 .5 -1.0 -1.0];
        Icon.y6 = [.05 .05 .9 .9 1.45 1.45 2.1];
        Icon.x7 = [-.6 .2 -.2 -.2 .7 .7 1.0];
        Icon.y7 = [1.8 1.8 1.8 2.1 2.1 0.0 0.0];
        Icon.x8 = [1.3 1.5];
        Icon.y8 = [0.0 0.0];
        Icon.x9 = [-1.0 -.6 -.6 -.8 -.4];
        Icon.y9 = [-.1 -.1 -1.1 -1.1 -1.1];
        Icon.x10 = [-.8 .4 -.2 -.2 -.8 .4];
        Icon.y10 = [-1.2 -1.2 -1.2 -1.7 -1.7 -1.7];
        Icon.x11 = [.4 0.0 .2 .2 0.0 .4];
        Icon.y11 = [-1.1 -1.1 -1.1 -.7 -.7 -.7];
        Icon.x12 = [.4 0.0 .2 .2 -1.0];
        Icon.y12 = [-.6 -.6 -.6 -0.0 -0.0];
        Icon.x13 = [-1.3 -1.5];
        Icon.y13 = [-.05 -.05];
        Icon.x14 = [-1.3 -1.5];
        Icon.y14 = [-.1 -.1];
        Icon.x15 = [-1.0 -.3 -.3 .5 .5 -1.0 -1.0];
        Icon.y15 = [-.05 -.05 -.9 -.9 -1.45 -1.45 -2.1];
        Icon.x16 = [-.6 .2 -.2 -.2 .7 .7 1.0];
        Icon.y16 = [-1.8 -1.8 -1.8 -2.1 -2.1 -0.0 -0.0];
        Icon.x17 = [-1.3 -1.5];
        Icon.y17 = [0.0 0.0];
        Icon.x18 = [-1.3 -1.5];
        Icon.y18 = [.1 .1];
        Icon.x19 = [-1.0 -1.0 -1.3 -1.3 -1.0 -1.0];
        Icon.y19 = [0.0 .2 .2 -.4 -.4 0.0];
        Icon.x20 = [-1.4 -.9];
        Icon.y20 = [-.4 -.4];
        Icon.x21 = [-1.3 -1.0];
        Icon.y21 = [-.5 -.5];
        Icon.x22 = [-1.2 -1.1];
        Icon.y22 = [-.6 -.6];
        Icon.x23 = [1.0 1.0 1.3 1.3 1.0 1.0];
        Icon.y23 = [0.0 .2 .2 -.4 -.4 0.0];
        Icon.x24 = [1.4 .9];
        Icon.y24 = [-.4 -.4];
        Icon.x25 = [1.3 1.0];
        Icon.y25 = [-.5 -.5];
        Icon.x26 = [1.2 1.1];
        Icon.y26 = [-.6 -.6];
        Icon.x27 = [-1.1 -1.1 -.9 -.9];
        Icon.y27 = [2.0 2.2 2.2 2.0];
        Icon.x28 = [-1.1 -1.1 -.9 -.9];
        Icon.y28 = [-2.0 -2.2 -2.2 -2.0];
        Icon.LowerLeftx = -1.8;
        Icon.LowerLefty = -1.8;
        Icon.UpperRightx = 1.8;
        Icon.UpperRighty = 1.8;
        Affordance.x1 = [1.0 1.6];
        Affordance.y1 = [1.0 1.0];
        Affordance.x2 = [1.6 1.4];
        Affordance.y2 = [1.0 1.2];
        Affordance.x3 = [1.6 1.4];
        Affordance.y3 = [1.0 .8];
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
                add_line(Name, 'P/RConn1', 'Ring-Planet/LConn1', 'autorouting', 'on');
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
                    set_param(NewBlock, 'Position', [715.0 310.0 735.0 330.0]);
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
                    set_param(NewBlock, 'Position', [715.0 310.0 735.0 330.0]);
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
                    set_param(NewBlock, 'Position', [715.0 345.0 735.0 365.0]);
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
                    set_param(NewBlock, 'Position', [715.0 345.0 735.0 365.0]);
                    add_line(Name, strcat(DriveBlock, '/2'), 'L/1', 'autorouting', 'on');
                end
            end
        end
    case 'compile'
    case 'parametereditingmodes'
        authoringParams = {'Show'};
        varargout{1.0} = drive_setparammode(authoringParams);
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        drive_callback(gcbh, Mode);
    case 'validate'
        thisName = varargin{1.0};
        wsvariables = drive_getmaskdata(thisName);
        ringLargeSun = wsvariables.gRSL;
        ringSmallSun = wsvariables.gRSS;
        thisName = horzcat('''', thisName, '''');
        errorMsg = '';
        if lt(ringLargeSun, 0.0)
            tmpStr = horzcat('Gear block: ', thisName, ' contains a nonpositive gear ratio.', '''Ring(R)/Large Sun(S1)''.', '  Change this ratio to a positive number.');
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        if lt(ringSmallSun, 0.0)
            tmpStr = horzcat('Gear block: ', thisName, ' contains a nonpositive gear ratio.', '''Ring(R)/Small Sun(S2)''.', '  Change this ratio to a positive number.');
            % 187 189
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 194 196
        if le(ringSmallSun, ringLargeSun)
            % 196 198
            tmpStr = horzcat('The Ravigneaux Gear block: ', thisName, ':', 'Ring(R)/Small Sun(S1) gear ', 'ratio must be larger than the Ring(R)/Large Sun(S2) gear ratio.');
            % 198 200
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 205 207
        noError = isempty(errorMsg);
        varargout{1.0} = noError;
        varargout{2.0} = errorMsg;
    end
end
