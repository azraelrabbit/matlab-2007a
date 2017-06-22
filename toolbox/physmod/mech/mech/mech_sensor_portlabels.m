function mech_sensor_portlabels(hBlk)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    maskDisplayStr = get_param(hBlk, 'MaskDisplay');
    % 13 16
    % 14 16
    maskDisplayStr = lStripLabelCode(maskDisplayStr);
    % 16 18
    if strcmp(get_param(hBlk, 'Muxed'), 'off')
        clsName = get_param(hBlk, 'ClassName');
        % 19 21
        switch clsName
        case 'JointSensor'
            % 22 24
            labelScriptStr = lGenerateJointLabelScript(hBlk);
        case 'BodySensor'
            % 25 27
            labelScriptStr = lGenerateLabelScript(hBlk, @lBuildBodyMapInfo);
        case 'ConstraintSensor'
            % 28 30
            labelScriptStr = lGenerateLabelScript(hBlk, @lBuildConstraintMapInfo);
        otherwise
            return
        end
        % 33 36
        % 34 36
        maskDisplayStr = sprintf('%s\n%s', maskDisplayStr, labelScriptStr);
        % 36 38
    end
    set_param(hBlk, 'MaskDisplay', maskDisplayStr);
end
function stripStr = lStripLabelCode(maskDisplayStr)
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    stripStr = '';
    matches = findstr(maskDisplayStr, 'port_label');
    if numel(matches)
        stripStr = maskDisplayStr(1.0:minus(matches, 1.0));
        stripStr = strtrim(stripStr);
    else
        stripStr = maskDisplayStr;
    end
end
function labelCode = lGenerateLabelScript(hBlk, mapFcn)
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    labelCode = '';
    blkInfo = mapFcn();
    fldNames = fields(blkInfo);
    % 64 66
    maskDisplayStr = '';
    cnt = 1.0;
    % 67 69
    for idx=1.0:numel(fldNames)
        enabled = get_param(hBlk, blkInfo.(fldNames{idx}).param);
        if strcmp(enabled, 'on')
            tmp = sprintf('port_label (''output'', %d, ''%s'',''texmode'', ''off'')', cnt, blkInfo.(fldNames{idx}).portlabel);
            % 72 74
            maskDisplayStr = sprintf('%s\n%s;', maskDisplayStr, tmp);
            % 74 76
            cnt = plus(cnt, 1.0);
        end
    end % for
    labelCode = maskDisplayStr;
end
function labelCode = lGenerateJointLabelScript(hBlk)
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    labelCode = '';
    blkInfo = lBuildJointMapInfo;
    fldNames = fields(blkInfo);
    % 89 91
    maskDisplayStr = '';
    cnt = 1.0;
    primStr = get_param(hBlk, 'Primitive');
    switch primStr(1.0)
    case 'S'
        myFlds = {'quat','quatdt','quatddt','rforce','rtorque'};
    case 'P'
        myFlds = {'pos','vel','accel','force','rforce','rtorque'};
    case 'R'
        myFlds = {'angle','angleVel','angleAccel','torque','rforce','rtorque'};
    case 'W'
        % 101 103
        myFlds = {'rforce','rtorque'};
    otherwise
        myFlds = {};
    end
    % 106 108
    for idx=1.0:numel(fldNames)
        if ~(any(strcmp(fldNames{idx}, myFlds)))
            continue;
        end
        enabled = get_param(hBlk, blkInfo.(fldNames{idx}).param);
        if strcmp(enabled, 'on')
            tmp = sprintf('port_label (''output'', %d, ''%s'',''texmode'', ''off'')', cnt, blkInfo.(fldNames{idx}).portlabel);
            % 114 116
            maskDisplayStr = sprintf('%s\n%s;', maskDisplayStr, tmp);
            % 116 118
            cnt = plus(cnt, 1.0);
        end
    end % for
    labelCode = maskDisplayStr;
end
function info = lBuildJointMapInfo
    % 123 131
    % 124 131
    % 125 131
    % 126 131
    % 127 131
    % 128 131
    % 129 131
    persistent JOINTSENSORINFO;
    if isempty(JOINTSENSORINFO)
        JOINTSENSORINFO.pos.enabled = false;
        JOINTSENSORINFO.pos.portlabel = 'p';
        JOINTSENSORINFO.pos.param = 'CoordPosition';
        % 135 137
        JOINTSENSORINFO.vel.enabled = false;
        JOINTSENSORINFO.vel.portlabel = 'v';
        JOINTSENSORINFO.vel.param = 'Velocity';
        % 139 141
        JOINTSENSORINFO.accel.enabled = false;
        JOINTSENSORINFO.accel.portlabel = 'a';
        JOINTSENSORINFO.accel.param = 'Acceleration';
        % 143 145
        JOINTSENSORINFO.angle.enabled = false;
        JOINTSENSORINFO.angle.portlabel = 'ap';
        JOINTSENSORINFO.angle.param = 'Angle';
        % 147 149
        JOINTSENSORINFO.angleVel.enabled = false;
        JOINTSENSORINFO.angleVel.portlabel = 'av';
        JOINTSENSORINFO.angleVel.param = 'ArcVelocity';
        % 151 153
        JOINTSENSORINFO.angleAccel.enabled = false;
        JOINTSENSORINFO.angleAccel.portlabel = 'aa';
        JOINTSENSORINFO.angleAccel.param = 'ArcAcceleration';
        % 155 157
        JOINTSENSORINFO.quat.enabled = false;
        JOINTSENSORINFO.quat.portlabel = 'q';
        JOINTSENSORINFO.quat.param = 'Quaternion';
        % 159 161
        JOINTSENSORINFO.quatdt.enabled = false;
        JOINTSENSORINFO.quatdt.portlabel = 'qd';
        JOINTSENSORINFO.quatdt.param = 'QuaternionDT';
        % 163 165
        JOINTSENSORINFO.quatddt.enabled = false;
        JOINTSENSORINFO.quatddt.portlabel = 'qdd';
        JOINTSENSORINFO.quatddt.param = 'QuaternionDDT';
        % 167 169
        JOINTSENSORINFO.torque.enabled = false;
        JOINTSENSORINFO.torque.portlabel = 'Tc';
        JOINTSENSORINFO.torque.param = 'Torque';
        % 171 173
        JOINTSENSORINFO.force.enabled = false;
        JOINTSENSORINFO.force.portlabel = 'Fc';
        JOINTSENSORINFO.force.param = 'Force';
        % 175 177
        JOINTSENSORINFO.rtorque.enabled = false;
        JOINTSENSORINFO.rtorque.portlabel = 'Tr';
        JOINTSENSORINFO.rtorque.param = 'ReactionMoment';
        % 179 181
        JOINTSENSORINFO.rforce.enabled = false;
        JOINTSENSORINFO.rforce.portlabel = 'Fr';
        JOINTSENSORINFO.rforce.param = 'ReactionForce';
    end
    info = JOINTSENSORINFO;
end
function info = lBuildBodyMapInfo
    % 187 196
    % 188 196
    % 189 196
    % 190 196
    % 191 196
    % 192 196
    % 193 196
    % 194 196
    persistent BODYSENSORINFO;
    if isempty(BODYSENSORINFO)
        BODYSENSORINFO.pos.enabled = false;
        BODYSENSORINFO.pos.portlabel = 'p';
        BODYSENSORINFO.pos.param = 'CoordPosition';
        % 200 202
        BODYSENSORINFO.vel.enabled = false;
        BODYSENSORINFO.vel.portlabel = 'v';
        BODYSENSORINFO.vel.param = 'Velocity';
        % 204 206
        BODYSENSORINFO.angleVel.enabled = false;
        BODYSENSORINFO.angleVel.portlabel = 'av';
        BODYSENSORINFO.angleVel.param = 'ArcVelocity';
        % 208 210
        BODYSENSORINFO.pose.enabled = false;
        BODYSENSORINFO.pose.portlabel = '[R]';
        BODYSENSORINFO.pose.param = 'Pose';
        % 212 214
        BODYSENSORINFO.accel.enabled = false;
        BODYSENSORINFO.accel.portlabel = 'a';
        BODYSENSORINFO.accel.param = 'Acceleration';
        % 216 218
        BODYSENSORINFO.angleAccel.enabled = false;
        BODYSENSORINFO.angleAccel.portlabel = 'aa';
        BODYSENSORINFO.angleAccel.param = 'ArcAcceleration';
    end
    info = BODYSENSORINFO;
end
function info = lBuildConstraintMapInfo
    % 224 232
    % 225 232
    % 226 232
    % 227 232
    % 228 232
    % 229 232
    % 230 232
    persistent CONSTRAINTSENSORINFO;
    if isempty(CONSTRAINTSENSORINFO)
        CONSTRAINTSENSORINFO.rtorque.enabled = false;
        CONSTRAINTSENSORINFO.rtorque.portlabel = 'Tr';
        CONSTRAINTSENSORINFO.rtorque.param = 'ReactionMoment';
        % 236 238
        CONSTRAINTSENSORINFO.rforce.enabled = false;
        CONSTRAINTSENSORINFO.rforce.portlabel = 'Fr';
        CONSTRAINTSENSORINFO.rforce.param = 'ReactionForce';
    end
    info = CONSTRAINTSENSORINFO;
end
