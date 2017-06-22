function [actualSource, lineInfo] = find_all_line_s_and_d(modelName, o)
    % 1 41
    % 2 41
    % 3 41
    % 4 41
    % 5 41
    % 6 41
    % 7 41
    % 8 41
    % 9 41
    % 10 41
    % 11 41
    % 12 41
    % 13 41
    % 14 41
    % 15 41
    % 16 41
    % 17 41
    % 18 41
    % 19 41
    % 20 41
    % 21 41
    % 22 41
    % 23 41
    % 24 41
    % 25 41
    % 26 41
    % 27 41
    % 28 41
    % 29 41
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    actualSource = [];
    lineInfo = [];
    i = 0.0;
    cr = sprintf('\n');
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    try
        % 54 61
        % 55 61
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        % 60 61
        l = find_system(modelName, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'functional', 'Type', 'line');
        index = 1.0;
        dstPort = [];
        actualSourceHandle = [];
        actualSourceName = [];
        actualDestHandle = [];
        actualPortInfo = [];
        d = [];
        ind = 1.0;
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        % 74 75
        for i=1.0:length(l)
            % 76 77
            lineObj = get_param(l(i), 'Object');
            name = lineObj.Name;
            % 79 82
            % 80 82
            % 81 82
            name = strrep(name, '>', '');
            name = strrep(name, '<', '');
            name = strrep(name, cr, '');
            name = strrep(name, ' ', '');
            % 86 88
            % 87 88
            if gt(length(name), 0.0)
                lineInfo{ind}.handle = l(i);
                lineInfo{ind}.name = [];
                lineInfo{ind}.source = [];
                lineInfo{ind}.dest = [];
                lineInfo{ind}.sourceType = [];
                lineInfo{ind}.sourceScale = [];
                lineInfo{ind}.lineObj = [];
                lineInfo{ind}.dstPortHandle = [];
                lineInfo{ind}.actualSourceHandle = [];
                % 98 99
                lineInfo{ind}.lineObj = lineObj;
                % 100 101
                lineInfo{ind}.name = name;
                lineInfo{ind}.dstPortHandle = lineObj.dstPortHandle;
                % 103 109
                % 104 109
                % 105 109
                % 106 109
                % 107 109
                % 108 109
                p = i;
                % 110 116
                % 111 116
                % 112 116
                % 113 116
                % 114 116
                % 115 116
                if gt(lineObj.SrcPortHandle, 0.0)
                    % 117 118
                    dstPort{plus(end, 1.0)} = lineObj.dstPortHandle;
                    % 119 122
                    % 120 122
                    % 121 122
                    objD = get_param(dstPort{end}, 'Object');
                    obj = [];
                    if lt(length(objD), 2.0)
                        obj{1.0} = objD;
                    else
                        obj = objD;
                    end % if
                    % 129 137
                    % 130 137
                    % 131 137
                    % 132 137
                    % 133 137
                    % 134 137
                    % 135 137
                    % 136 137
                    for j=1.0:length(obj)
                        % 138 139
                        destCompiledPortDataType = obj{j}.CompiledPortDataType;
                        % 140 142
                        % 141 142
                        if eq(strcmp(destCompiledPortDataType, 'fcn_call'), 0.0)
                            % 143 145
                            % 144 145
                            h = obj{j}.getActualSrc;
                            [len, wid] = size(h);
                            if lt(len, 2.0)
                                portInfo = [];
                                lineInfo{ind}.actualSourceHandle = h;
                                % 150 151
                                ho = get_param(h(1.0), 'Object');
                                % 152 153
                                compiledRTWStorageClass = ho.CompiledRTWStorageClass;
                                % 154 161
                                % 155 161
                                % 156 161
                                % 157 161
                                % 158 161
                                % 159 161
                                % 160 161
                                try
                                    parent = get_param(h(1.0), 'Parent');
                                    h = get_param(parent, 'Handle');
                                    ooo = get_param(h, 'Object');
                                    % 165 168
                                    % 166 168
                                    % 167 168
                                    lineInfo{ind}.CompiledPortDataType = ooo.CompiledPortDataType;
                                    actualSourceHandle(index) = h;
                                    % 170 175
                                    % 171 175
                                    % 172 175
                                    % 173 175
                                    % 174 175
                                    portInfo.compiledRTWStorageClass = compiledRTWStorageClass;
                                    portInfo.destCompiledPortDataType = destCompiledPortDataType;
                                    portInfo.CompiledPortDataType = obj{j}.CompiledPortDataType;
                                    % 178 180
                                    % 179 180
                                    sourcePortHandle = lineInfo{ind}.actualSourceHandle(1.0);
                                    dstPortHandle = obj{j}.handle;
                                    valid = check_sfun(dstPortHandle, sourcePortHandle);
                                    if eq(valid, 1.0)
                                        match = ismember(ooo.PortHandles.Outport, sourcePortHandle);
                                        wIndex = find(match);
                                        if eq(isempty(wIndex), 0.0)
                                            portInfo.dataType = ooo.CompiledPortDataType.Outport{wIndex};
                                            portInfo.width = ooo.CompiledPortWidth.Outport(wIndex);
                                            do = get_param(ooo.PortHandles.Outport(wIndex), 'Object');
                                            d = do.getActualDst;
                                            if eq(isempty(d), 0.0)
                                                [len, wid] = size(d);
                                                for q=1.0:len
                                                    actualDestHandle{index}(q) = d(q, 1.0);
                                                    lineInfo{ind}.actualDesthandle(q) = d(q, 1.0);
                                                end % for
                                                actualPortInfo{plus(end, 1.0)} = portInfo;
                                                actualSourceName{plus(end, 1.0)} = name;
                                                index = plus(index, 1.0);
                                            end % if
                                        end % if
                                    end % if
                                    % 203 204
                                end % try
                            end % if
                        end % if
                    end % for
                end % if
                ind = plus(ind, 1.0);
            end % if
        end % for
    catch
        disp(horzcat('Engine Interface problem on ', num2str(i)));
    end % try
    % 215 218
    % 216 218
    % 217 218
    actualSource.name = '';
    actualSource.handle = [];
    actualSource.destHandle = '';
    actualSource.actualPortInfo = '';
    % 222 223
    for j=1.0:length(actualSourceName)
        if eq(isempty(actualSourceName{j}), 0.0)
            actualSource.name{plus(end, 1.0)} = actualSourceName{j};
            actualSource.handle(plus(end, 1.0)) = actualSourceHandle(j);
            actualSource.destHandle{plus(end, 1.0)} = actualDestHandle{j};
            actualSource.actualPortInfo{plus(end, 1.0)} = actualPortInfo{j};
        end % if
    end % for
end % function
function valid = check_sfun(dstPortHandle, sourcePortHandle)
    % 233 234
    dstObj = get_param(dstPortHandle, 'Object');
    srcObj = get_param(sourcePortHandle, 'Object');
    dstBlockType = get_param(dstObj.Parent, 'BlockType');
    srcBlockType = get_param(srcObj.Parent, 'BlockType');
    valid = 1.0;
end % function
