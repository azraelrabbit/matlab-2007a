function varargout = drive_motionsensorblock(Mode, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch lower(Mode)
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        drive_block(Mode);
    case 'mask'
        blk = varargin{1.0};
        angle = varargin{2.0};
        velocity = varargin{3.0};
        acceleration = varargin{4.0};
        lMaskInit(blk, angle, velocity, acceleration);
    case 'parametereditingmodes'
        % 18 21
        % 19 21
        authoringParams = {'Angle','Velocity','Acceleration'};
        varargout{1.0} = drive_setparammode(authoringParams);
        % 22 24
    end
end
function lMaskInit(blk, angle, velocity, accel)
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    portcnt = 0.0;
    display = sprintf('image(imread(''omega_out.bmp''), ''center'');\n');
    % 35 38
    % 36 38
    [portcnt, display] = l_adjustoutport(blk, angle, 'p', portcnt, display);
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    if angle
        l_replaceblock(blk, 'integrator', 'Integrator', 'InitialCondition', 'x0');
    else
        l_replaceblock(blk, 'integrator', 'Gain');
    end
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    [portcnt, display] = l_adjustoutport(blk, velocity, 'v', portcnt, display);
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    [portcnt, display] = l_adjustoutport(blk, accel, 'a', portcnt, display);
    % 57 59
    set_param(blk, 'MaskDisplay', display);
end
function [portcnt, display] = l_adjustoutport(sys, selected, name, portcnt, display)
    % 61 65
    % 62 65
    % 63 65
    if selected
        type = 'Outport';
    else
        type = 'Terminator';
    end
    % 69 71
    block = l_replaceblock(sys, name, type);
    % 71 73
    if selected
        portcnt = plus(portcnt, 1.0);
        set_param(block, 'Port', int2str(portcnt));
        % 75 80
        % 76 80
        % 77 80
        % 78 80
        switch name
        case 'v'
            name = 'v';
        case 'a'
            name = 'a';
        end
        % 85 87
        display = sprintf('%sport_label(''output'', %d, ''%s'', ''texmode'', ''off'');\n', display, portcnt, name);
    end
end
function blk = l_replaceblock(sys, name, type, varargin)
    % 90 92
    blkname = horzcat(getfullname(sys), '/', name);
    blk = get_param(blkname, 'Handle');
    if not(strcmp(get_param(blk, 'BlockType'), type))
        position = get_param(blk, 'Position');
        delete_block(blk);
        blk = add_block(horzcat('built-in/', type), blkname, 'Position', position, varargin{:});
    else
        % 98 100
        if not(isempty(varargin))
            set_param(blk, varargin{:});
        end
    end
end
