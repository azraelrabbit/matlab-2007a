function varargout = drive_differentialgearblock(Mode, varargin)
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
    SDLversion = 'SimDrivelineLibraryVersion';
    currentSDLversion = '1.1';
    SDLblockUserData = horzcat(SDLversion, currentSDLversion);
    updateTool = 'drive_update';
    % 17 20
    % 18 20
    switch lower(Mode)
    case 'compile'
    case 'loadfcn'
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        blockName = varargin{1.0};
        % 27 29
        isCurrent = strcmp(get_param(blockName, SDLversion), currentSDLversion);
        if ~(isCurrent)
            modelName = bdroot(blockName);
            if ~(strcmp(modelName, 'driveline'))
                msg = sprintf('Gear block: ''%s'' needs to be updated to SimDriveline v. %s.  Run %s(''%s'') to update the model.', regexprep(blockName, '\n+', ' '), currentSDLversion, updateTool, modelName);
                % 33 38
                % 34 38
                % 35 38
                % 36 38
                warnstat = warning('off', 'backtrace');
                warning(msg)
                warning(warnstat);
            end
        end
        drive_callback(gcbh, Mode);
    case 'maskinitialization'
        % 44 52
        % 45 52
        % 46 52
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        blockName = varargin{1.0};
        if strcmp(bdroot(blockName), 'driveline')
            % 53 55
            set_param(blockName, 'UserData', SDLblockUserData);
        end
        % 57 59
    case 'copyfcn'
        % 58 62
        % 59 62
        % 60 62
        blockName = varargin{1.0};
        if isequal(get_param(blockName, 'UserData'), SDLblockUserData)
            % 63 66
            % 64 66
            set_param(blockName, SDLversion, currentSDLversion, 'UserData', []);
            % 66 68
        end
        % 68 70
        drive_callback(gcbh, Mode);
    case {'deletefcn','presavefcn','postsavefcn','predeletefcn','precopyfcn'}
        % 71 73
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        % 74 77
        % 75 77
        varargout{1.0} = [];
        % 78 80
    case 'validate'
        % 79 90
        % 80 90
        % 81 90
        % 82 90
        % 83 90
        % 84 90
        % 85 90
        % 86 90
        % 87 90
        % 88 90
        blockName = regexprep(varargin{1.0}, '\n+', ' ');
        wsVariables = drive_getmaskdata(blockName);
        % 91 93
        thisName = horzcat('''', blockName, '''');
        % 93 97
        % 94 97
        % 95 97
        errorMsg = '';
        % 97 101
        % 98 101
        % 99 101
        isCurrent = strcmp(wsVariables.(SDLversion), currentSDLversion);
        if ~(isCurrent)
            updateTool = 'drive_update';
            modelName = bdroot(blockName);
            tmpStr = horzcat('Gear block: ', thisName, ' needs to be updated to SimDriveline ', currentSDLversion, '  Run ', updateTool, '(''', modelName, ''')', ' to update the model.');
            % 105 109
            % 106 109
            % 107 109
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 114 117
        % 115 117
        gearRatio = wsVariables.R;
        if lt(gearRatio, 0.0)
            tmpStr = horzcat('Gear block: ', thisName, ' contains a nonpositive gear ratio.', ' Change the gear ratio to a positive value.');
            % 119 121
            if isempty(errorMsg)
                errorMsg = tmpStr;
            else
                errorMsg = sprintf('%s\n%s', errorMsg, tmpStr);
            end
        end
        % 126 129
        % 127 129
        noError = isempty(errorMsg);
        varargout{1.0} = noError;
        varargout{2.0} = errorMsg;
    end
end
