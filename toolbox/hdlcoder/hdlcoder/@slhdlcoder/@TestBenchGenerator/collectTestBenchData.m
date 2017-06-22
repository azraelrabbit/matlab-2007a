function collectTestBenchData(this, SLdata)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    virtualComp = 'Simulink.TsArray';
    [simulationLength, MinimumRate] = findSimulationLength(this, SLdata);
    for i=1.0:length(this.InportSrc)
        loggingPortName = this.InportSrc(i).loggingPortName;
        if isempty(findstr(virtualComp, class(SLdata.(loggingPortName))))
            [HDLrate, datalength, datawidth, dataIsConstant, loggedData] = findTimeSeriesInfo(SLdata, loggingPortName, simulationLength, MinimumRate);
            % 13 15
            this.InportSrc(i).data = loggedData;
            this.InportSrc(i).HDLSampleTime = HDLrate;
            this.InportSrc(i).datalength = datalength;
            this.InportSrc(i).dataIsConstant = dataIsConstant;
            this.InportSrc(i).VectorPortSize = datawidth;
            this.InportSrc(i).timeseries = SLdata.(loggingPortName).Time;
            this.InportSrc(i).SLSampleTime = SLdata.(loggingPortName).TimeInfo.Increment;
        else
            % 22 31
            % 23 31
            % 24 31
            % 25 31
            % 26 31
            % 27 31
            % 28 31
            % 29 31
        end
    end % for
    % 32 34
    for i=1.0:length(this.OutportSnk)
        loggingPortName = this.OutportSnk(i).loggingPortName;
        if isempty(findstr(virtualComp, class(SLdata.(loggingPortName))))
            [HDLrate, datalength, datawidth, dataIsConstant, loggedData] = findTimeSeriesInfo(SLdata, loggingPortName, simulationLength, MinimumRate);
            % 37 39
            this.OutportSnk(i).data = loggedData;
            this.OutportSnk(i).HDLSampleTime = HDLrate;
            this.OutportSnk(i).datalength = datalength;
            this.OutportSnk(i).dataIsConstant = dataIsConstant;
            this.OutportSnk(i).VectorPortSize = datawidth;
            this.OutportSnk(i).timeseries = SLdata.(loggingPortName).Time;
            this.OutportSnk(i).SLSampleTime = SLdata.(loggingPortName).TimeInfo.Increment;
        else
            % 46 55
            % 47 55
            % 48 55
            % 49 55
            % 50 55
            % 51 55
            % 52 55
            % 53 55
        end
    end % for
end
function [HDLrate, datalength, datawidth, dataIsConstant, loggedData] = findTimeSeriesInfo(SLdata, loggingPortName, simulationLength, MinimumRate)
    % 58 61
    % 59 61
    inValidSampleTime = 'NaN Inf';
    % 61 64
    % 62 64
    if isempty(findstr(num2str(SLdata.(loggingPortName).TimeInfo.Increment), inValidSampleTime))
        HDLrate = SLdata.(loggingPortName).TimeInfo.Increment;
        datalength = SLdata.(loggingPortName).TimeInfo.Length;
    else
        datalength = SLdata.(loggingPortName).TimeInfo.Length;
        if gt(simulationLength, 0.0) && gt(datalength, 0.0)
            HDLrate = MinimumRate;
        else
            HDLrate = MinimumRate;
            datalength = mrdivide(simulationLength, MinimumRate);
        end
    end
    % 75 78
    % 76 78
    loggedData = SLdata.(loggingPortName).data;
    if gt(ndims(loggedData), 2.0)
        [row, colomn, thirdDim] = size(loggedData);
        if eq(row, 1.0) && eq(colomn, 1.0)
            loggedData = squeeze(loggedData);
        else
            loggedData = ctranspose(squeeze(loggedData));
        end
    else
        dSize = size(loggedData);
        if ne(datalength, dSize(1.0))
            loggedData = ctranspose(loggedData);
        end
    end
    % 91 94
    % 92 94
    dataIsConstant = 1.0;
    refData = loggedData(1.0, :);
    % 95 97
    for i=2.0:datalength
        if eq(loggedData(i, :), refData)
            continue;
        else
            dataIsConstant = 0.0;
            break
        end
    end % for
    % 104 107
    % 105 107
    [RowOfData, ColumnOfData] = size(loggedData);
    if eq(datalength, RowOfData)
        datawidth = ColumnOfData;
    else
        datawidth = RowOfData;
    end
end
function [simLength, minSampleTime] = findSimulationLength(this, SLdata)
    simLength = 0.0;
    inValidSampleRate = 'Inf NaN';
    IO = horzcat(this.InportSrc, this.OutportSnk);
    for i=1.0:length(IO)
        loggingName = IO(i).loggingPortName;
        newSimTime = minus(SLdata.(loggingName).TimeInfo.End, SLdata.(loggingName).TimeInfo.Start);
        if gt(newSimTime, simLength)
            simLength = newSimTime;
        end
    end % for
    if eq(simLength, 0.0)
        simLength = 1.0;
        minSampleTime = 1.0;
    else
        minSampleTime = simLength;
        for i=1.0:length(IO)
            if isempty(findstr(num2str(SLdata.(loggingName).TimeInfo.Increment), inValidSampleRate))
                if lt(SLdata.(loggingName).TimeInfo.Increment, minSampleTime)
                    minSampleTime = SLdata.(loggingName).TimeInfo.Increment;
                end
            end
        end % for
        if le(minSampleTime, 0.0)
            minSampleTime = 1.0;
        end
        % 139 141
    end
end
