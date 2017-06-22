function cinfo = slport_get_compiled_info(pHandle)
    % 1 40
    % 2 40
    % 3 40
    % 4 40
    % 5 40
    % 6 40
    % 7 40
    % 8 40
    % 9 40
    % 10 40
    % 11 40
    % 12 40
    % 13 40
    % 14 40
    % 15 40
    % 16 40
    % 17 40
    % 18 40
    % 19 40
    % 20 40
    % 21 40
    % 22 40
    % 23 40
    % 24 40
    % 25 40
    % 26 40
    % 27 40
    % 28 40
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    cinfo = [];
    % 41 42
    dtypeName = get_param(pHandle, 'CompiledPortDataType');
    % 43 44
    aliasThruDtypeName = get_param(pHandle, 'CompiledPortAliasedThruDataType');
    % 45 46
    compDims = get_param(pHandle, 'CompiledPortDimensions');
    if ge(compDims(1.0), 2.0)
        nDims = compDims(1.0);
        dimsStr = '';
        spcVal = '';
        for k=1.0:nDims
            if gt(k, 1.0)
                spcVal = ' ';
            end % if
            dimsStr = sprintf('%s%s%d', dimsStr, spcVal, compDims(plus(k, 1.0)));
        end % for
        dimsStr = horzcat('[', dimsStr, ']');
        dims = compDims(2.0:end);
    else
        dimsStr = sprintf('%d', compDims(2.0));
        dims = compDims(2.0);
    end % if
    % 63 64
    compComplex = get_param(pHandle, 'CompiledPortComplexSignal');
    if eq(compComplex, 0.0)
        complexity = 'real';
    else
        complexity = 'complex';
    end % if
    % 70 72
    % 71 72
    compFrame = get_param(pHandle, 'CompiledPortFrameData');
    if eq(compFrame, 0.0)
        frame = 'Sample based';
    else
        frame = 'Frame based';
    end % if
    % 78 79
    isStruct = get_param(pHandle, 'IsCompiledStructureBus');
    % 80 81
    [ts, tsStr, isTriggered] = get_compiled_sampletime_l(pHandle);
    % 82 83
    rtwSignalIdentifier = get_param(pHandle, 'CompiledRTWSignalIdentifier');
    rtwUDInterface = get_param(pHandle, 'CompiledRTWUDInterface');
    rtwStorageClass = get_param(pHandle, 'CompiledRTWStorageClass');
    rtwStorageTypeQualifier = get_param(pHandle, 'CompiledRTWStorageTypeQualifier');
    % 87 90
    % 88 90
    % 89 90
    cinfo.DataType = dtypeName;
    cinfo.AliasThruDataType = aliasThruDtypeName;
    cinfo.Dimensions = dims;
    cinfo.DimensionStr = dimsStr;
    cinfo.SamplingMode = frame;
    cinfo.Complexity = complexity;
    cinfo.SampleTime = ts;
    cinfo.SampleTimeStr = tsStr;
    cinfo.IsTriggered = isTriggered;
    cinfo.IsStructBus = logical(isStruct);
    % 100 101
    cinfo.RTWSignalIdentifier = rtwSignalIdentifier;
    cinfo.RTWUDInterface = rtwUDInterface;
    cinfo.RTWStorageClass = rtwStorageClass;
    cinfo.RTWStorageTypeQualifier = rtwStorageTypeQualifier;
end % function
function [ts, tsStr, isTriggered] = get_compiled_sampletime_l(pHandle)
    % 107 116
    % 108 116
    % 109 116
    % 110 116
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    % 115 116
    isTriggered = false;
    compTs = get_param(pHandle, 'CompiledPortSampleTime');
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    if isinf(compTs(1.0))
        % 125 126
        tsStr = 'inf';
        ts = Inf;
    else
        if eq(length(compTs), 2.0) && eq(compTs(1.0), 0.0) && eq(compTs(2.0), 0.0)
            % 130 131
            tsStr = '0';
            ts = 0.0;
        else
            % 134 135
            if eq(compTs(1.0), -1.0) && eq(compTs(2.0), -1.0)
                isTriggered = true;
                ts = compTs(3.0:4.0);
            else
                ts = compTs;
            end % if
            % 141 142
            tsStr = horzcat('[', sprintf('%.17g', ts(1.0)), ',', sprintf('%.17g', ts(2.0)), ']');
        end % if
    end % if
end % function
