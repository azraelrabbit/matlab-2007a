function passThroughOutputChecker(passThroughOutputBlock, driverBlock, targetSubsystem, verbose)
    % 1 32
    % 2 32
    % 3 32
    % 4 32
    % 5 32
    % 6 32
    % 7 32
    % 8 32
    % 9 32
    % 10 32
    % 11 32
    % 12 32
    % 13 32
    % 14 32
    % 15 32
    % 16 32
    % 17 32
    % 18 32
    % 19 32
    % 20 32
    % 21 32
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    varStruct.passThroughOutputBlock = passThroughOutputBlock;
    varStruct.driverBlock = driverBlock;
    varStruct.targetSubsystem = targetSubsystem;
    varStruct.verbose = verbose;
    % 35 38
    % 36 38
    block_UDD = get_param(passThroughOutputBlock, 'UDDObject');
    % 38 40
    outPort_UDD = get_param(block_UDD.PortHandles.Outport, 'UDDObject');
    i_followPath(outPort_UDD, varStruct);
    % 41 43
    return;
function i_followPath(udd_obj, varStruct, varargin)
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    if eq(varStruct.verbose, 1.0)
        if eq(length(varargin), 1.0)
            portnum = varargin{1.0};
            disp(horzcat(class(udd_obj), ' Handle=', sprintf('%f', udd_obj.handle), ' Port=', portnum));
        else
            disp(horzcat(class(udd_obj), ' Handle=', sprintf('%f', udd_obj.handle)));
        end % if
    end % if
    % 59 62
    % 60 62
    switch class(udd_obj)
        % 63 66
        % 64 66
    case 'Simulink.Port'
        % 65 67
        i_Port(udd_obj, varStruct);
    case 'Simulink.Segment'
        % 68 70
        i_Segment(udd_obj, varStruct);
        % 71 74
        % 72 74
    case 'Simulink.SubSystem'
        % 73 76
        % 74 76
        if eq(length(varargin), 1.0)
            portnum = varargin{1.0};
        else
            % 78 80
            i_displayError(udd_obj, 'noPortNum', varStruct);
        end % if
        i_Subsystem(udd_obj, varStruct, portnum);
    case 'Simulink.Inport'
        % 83 85
        i_Inport(udd_obj, varStruct);
    case 'Simulink.Outport'
        % 86 88
        i_Outport(udd_obj, varStruct);
        % 89 91
    case 'Simulink.Terminator'
        % 91 94
        % 92 94
    case {'Simulink.Mux','Simulink.BusCreator'}
        % 93 95
        i_Mux(udd_obj, varStruct);
    case {'Simulink.Demux','Simulink.BusSelector'}
        % 96 98
        i_Demux(udd_obj, varStruct);
    otherwise
        % 99 106
        % 100 106
        % 101 106
        % 102 106
        % 103 106
        % 104 106
        libBlock = udd_obj.ReferenceBlock;
        if isempty(libBlock)
            % 107 109
            i_displayError(udd_obj, 'InvalidBlock', varStruct);
        else
            % 110 114
            % 111 114
            % 112 114
            tag = get_param(libBlock, 'Tag');
            if not(strcmp(tag, 'PassThroughFriendly'))
                % 115 117
                i_displayError(udd_obj, 'InvalidBlock', varStruct);
            end % if
        end % if
    end % switch
    return;
function i_displayError(udd_obj, type, varStruct)
    % 122 126
    % 123 126
    % 124 126
    errormsg = horzcat('A driver block, ''', varStruct.driverBlock, ''', with a pass-through output was incorrectly routed to block, ''', horzcat(udd_obj.parent, '/', udd_obj.name), '''. ', 'During code generation, pass-through outputs will be eliminated, ', 'so they may only be routed via Virtual Blocks (eg. Subsystems) in the Target Subsystem, or outside the Target ', 'Subsystem by connecting to outports at the Target Subsystem level.   To fix this error, please make ', 'sure your driver block pass-through output signals are connected as described above. ', 'Then try updating the model again.');
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    switch lower(type)
    case 'invalidblock'
        hilite_system(udd_obj.handle);
        error(errormsg);
    case 'subsystem'
        % 136 138
        error('Correct Inport could not be found in the subsystem');
    case 'noportnum'
        % 139 141
        error('No port number supplied by the Simulink.Segment call');
    otherwise
        error('Unknown error type.');
    end % switch
    return;
function i_Mux(udd_obj, varStruct)
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    if eq(udd_obj.LineHandles.Outport, -1.0)
        % 152 154
        return;
    end % if
    i_followPath(get_param(udd_obj.LineHandles.Outport, 'UDDObject'), varStruct);
    return;
function i_Demux(udd_obj, varStruct)
    % 158 164
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    for i=1.0:length(udd_obj.LineHandles.Outport)
        if eq(udd_obj.LineHandles.Outport(i), -1.0)
            % 165 168
            % 166 168
            continue;
        end % if
        i_followPath(get_param(udd_obj.LineHandles.Outport(i), 'UDDObject'), varStruct);
    end % for
    return;
function i_Outport(udd_obj, varStruct)
    % 173 185
    % 174 185
    % 175 185
    % 176 185
    % 177 185
    % 178 185
    % 179 185
    % 180 185
    % 181 185
    % 182 185
    % 183 185
    if strcmp(udd_obj.Parent, varStruct.targetSubsystem)
        % 185 187
        return;
    else
        % 188 192
        % 189 192
        % 190 192
        portnum = sscanf(udd_obj.Port, '%d');
        % 192 194
        parent = get_param(udd_obj.Parent, 'UDDObject');
        % 194 197
        % 195 197
        i_followPath(get_param(parent.PortHandles.Outport(portnum), 'UDDObject'), varStruct);
    end % if
    return;
function i_Inport(udd_obj, varStruct)
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    if eq(udd_obj.LineHandles.Outport, -1.0)
        % 206 208
        return;
    end % if
    i_followPath(get_param(udd_obj.LineHandles.Outport, 'UDDObject'), varStruct);
    return;
function i_Port(udd_obj, varStruct)
    % 212 219
    % 213 219
    % 214 219
    % 215 219
    % 216 219
    % 217 219
    if eq(udd_obj.Line, -1.0)
        % 219 221
        return;
    end % if
    i_followPath(get_param(udd_obj.Line, 'UDDObject'), varStruct);
    return;
function i_Segment(udd_obj, varStruct)
    % 225 234
    % 226 234
    % 227 234
    % 228 234
    % 229 234
    % 230 234
    % 231 234
    % 232 234
    if isempty(udd_obj.LineChildren)
        % 234 236
        if eq(udd_obj.dstPortHandle, -1.0)
            % 236 238
            return;
        end % if
        % 239 242
        % 240 242
        portObj = get_param(udd_obj.dstPortHandle, 'UDDObject');
        i_followPath(get_param(udd_obj.dstBlockHandle, 'UDDObject'), varStruct, sprintf('%d', portObj.PortNumber));
    else
        % 244 247
        % 245 247
        for i=1.0:length(udd_obj.LineChildren)
            i_followPath(get_param(udd_obj.LineChildren(i), 'UDDObject'), varStruct);
        end % for
    end % if
    return;
function i_Subsystem(udd_obj, varStruct, portnum)
    % 252 260
    % 253 260
    % 254 260
    % 255 260
    % 256 260
    % 257 260
    % 258 260
    inport_handle = find_system(udd_obj.Handle, 'findall', 'on', 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0, 'blocktype', 'Inport', 'Port', portnum);
    % 260 266
    % 261 266
    % 262 266
    % 263 266
    % 264 266
    if ne(size(inport_handle, 1.0), 1.0)
        i_displayError(udd_obj, 'Subsystem', varStruct);
    end % if
    i_followPath(get_param(inport_handle, 'UDDObject'), varStruct);
    return;
