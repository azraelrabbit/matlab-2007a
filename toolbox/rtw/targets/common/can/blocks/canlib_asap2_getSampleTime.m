function varargout = canlib_asap2_getSampleTime(SIGNAL_ID, SYSTEM, UPDATE, VERBOSE)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    warningID = 'Simulink:SL_JacobianAnalyticLinNotEnabled';
    warningState = warning('off', warningID);
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    if eq(UPDATE, 1.0)
        set_param(strtok(SYSTEM, '/'), 'SimulationCommand', 'update');
    end % if
    % 33 36
    % 34 36
    segment_handle = find_system(SYSTEM, 'findall', 'on', 'lookundermasks', 'all', 'followlinks', 'on', 'type', 'line', 'name', SIGNAL_ID);
    % 36 38
    if eq(size(segment_handle, 1.0), 0.0)
        error('Signal was not found in the model');
    end % if
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    trunk_segment_found = 0.0;
    for i=1.0:size(segment_handle, 1.0)
        segment_UDD = get_param(segment_handle(i), 'UDDObject');
        if eq(strcmp(segment_UDD.SegmentType, 'trunk'), 1.0)
            % 48 50
            trunk_segment_found = 1.0;
            break
        end % if
    end % for
    % 53 55
    if eq(trunk_segment_found, 0.0)
        error('No trunk segment corresponding to this signal could be found!');
    end % if
    % 57 61
    % 58 61
    % 59 61
    [sampleTimeBlock, code] = i_findRootBlock(segment_UDD, VERBOSE);
    % 61 63
    switch code
    case 'CompiledSampleTime'
        % 64 67
        % 65 67
        varargout{1.0} = sampleTimeBlock.CompiledSampleTime(1.0);
    otherwise
        % 68 70
        disp(horzcat('ERROR ', code));
        varargout{1.0} = '-2';
    end % switch
    varargout{2.0} = sampleTimeBlock;
    % 73 76
    % 74 76
    warning(warningState);
    % 76 78
    return;
function [block, code] = i_Port(udd_obj, VERBOSE)
    % 79 83
    % 80 83
    % 81 83
    if eq(udd_obj.Line, -1.0)
        block = udd_obj;
        code = 'Unconnected inport in Subsystem.';
        return;
    end % if
    [block, code] = i_findRootBlock(get_param(udd_obj.Line, 'UDDObject'), VERBOSE);
    return;
function [block, code] = i_Segment(udd_obj, VERBOSE)
    % 90 98
    % 91 98
    % 92 98
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    if eq(udd_obj.srcPortHandle, -1.0)
        block = udd_obj;
        code = 'Unconnected line segment.';
        return;
    end % if
    % 102 107
    % 103 107
    % 104 107
    % 105 107
    parent = get_param(udd_obj.parent, 'UDDObject');
    fields = get(parent);
    if eq(isfield(fields, 'PortHandles'), 1.0)
        if eq(isfield(fields.PortHandles, 'Trigger'), 1.0)
            if eq(isempty(fields.PortHandles.Trigger), 0.0)
                [block, code] = i_findRootBlock(get_param(parent.PortHandles.Trigger, 'UDDObject'), VERBOSE);
                return;
            end % if
        end % if
    end % if
    % 116 120
    % 117 120
    % 118 120
    portObj = get_param(udd_obj.srcPortHandle, 'UDDObject');
    [block, code] = i_findRootBlock(get_param(udd_obj.srcBlockHandle, 'UDDObject'), VERBOSE, portObj.PortNumber);
    return;
function [block, code] = i_Subsystem(udd_obj, VERBOSE, portnum)
    % 123 131
    % 124 131
    % 125 131
    % 126 131
    % 127 131
    % 128 131
    % 129 131
    outport_handle = find_system(udd_obj.Handle, 'findall', 'on', 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0, 'blocktype', 'Outport', 'Port', num2str(portnum));
    if ne(size(outport_handle, 1.0), 1.0)
        error('Could not find outport handle');
    end % if
    [block, code] = i_findRootBlock(get_param(outport_handle, 'UDDObject'), VERBOSE);
function [block, code] = i_genericBlock(udd_obj, VERBOSE)
    % 136 146
    % 137 146
    % 138 146
    % 139 146
    % 140 146
    % 141 146
    % 142 146
    % 143 146
    % 144 146
    fields = get(udd_obj);
    % 146 148
    if eq(isfield(fields, 'CompiledSampleTime'), 1.0)
        block = udd_obj;
        code = 'CompiledSampleTime';
        return;
    end % if
function [block, code] = i_findRootBlock(udd_obj, VERBOSE, varargin)
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    if eq(VERBOSE, 1.0)
        if eq(length(varargin), 1.0)
            portnum = varargin{1.0};
            disp(horzcat(class(udd_obj), ' Handle=', num2str(udd_obj.handle), ' Port=', num2str(portnum)));
        else
            disp(horzcat(class(udd_obj), ' Handle=', num2str(udd_obj.handle)));
        end % if
    end % if
    % 165 167
    switch class(udd_obj)
    case 'Simulink.Port'
        [block, code] = i_Port(udd_obj, VERBOSE);
    case 'Simulink.Segment'
        [block, code] = i_Segment(udd_obj, VERBOSE);
    case 'Simulink.SubSystem'
        % 172 174
        if eq(length(varargin), 1.0)
            portnum = varargin{1.0};
        else
            block = udd_obj;
            code = 'No port number supplied by the Simulink.Segment!';
            return;
        end % if
        [block, code] = i_Subsystem(udd_obj, VERBOSE, varargin{1.0});
    otherwise
        [block, code] = i_genericBlock(udd_obj, VERBOSE);
    end % switch
