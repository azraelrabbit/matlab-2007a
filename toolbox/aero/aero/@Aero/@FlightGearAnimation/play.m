function play(h)
    % 1 87
    % 2 87
    % 3 87
    % 4 87
    % 5 87
    % 6 87
    % 7 87
    % 8 87
    % 9 87
    % 10 87
    % 11 87
    % 12 87
    % 13 87
    % 14 87
    % 15 87
    % 16 87
    % 17 87
    % 18 87
    % 19 87
    % 20 87
    % 21 87
    % 22 87
    % 23 87
    % 24 87
    % 25 87
    % 26 87
    % 27 87
    % 28 87
    % 29 87
    % 30 87
    % 31 87
    % 32 87
    % 33 87
    % 34 87
    % 35 87
    % 36 87
    % 37 87
    % 38 87
    % 39 87
    % 40 87
    % 41 87
    % 42 87
    % 43 87
    % 44 87
    % 45 87
    % 46 87
    % 47 87
    % 48 87
    % 49 87
    % 50 87
    % 51 87
    % 52 87
    % 53 87
    % 54 87
    % 55 87
    % 56 87
    % 57 87
    % 58 87
    % 59 87
    % 60 87
    % 61 87
    % 62 87
    % 63 87
    % 64 87
    % 65 87
    % 66 87
    % 67 87
    % 68 87
    % 69 87
    % 70 87
    % 71 87
    % 72 87
    % 73 87
    % 74 87
    % 75 87
    % 76 87
    % 77 87
    % 78 87
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    import java.net.*;
    % 85 87
    if isempty(h.TimeseriesSource)
        error('Aero:FlightGearAnimation:NeedTimeData', 'Set a TimeseriesSource before attempting to update the animation');
        % 88 90
    end % if
    % 90 92
    if isempty(which(func2str(h.TimeseriesReadFcn)))
        error('Aero:FlightGearAnimation:NoReadFcn', 'TimeseriesReadFcn is not on the path.');
    end % if
    % 94 97
    % 95 97
    consistencyCheck(h);
    % 97 100
    % 98 100
    oldTimer = timerfind;
    % 100 102
    if not(isempty(oldTimer))
        oldTimer = oldTimer(and(strcmp(oldTimer.Name, 'FGAnimTimer'), strcmp(oldTimer.Tag, horzcat(num2str(h.DestinationIPAddress), ' ', num2str(h.DestinationPort)))));
        % 103 106
        % 104 106
        while any(isvalid(oldTimer))
            % 106 108
        end % while
    end % if
    % 109 112
    % 110 112
    h.initialize;
    % 112 116
    % 113 116
    % 114 116
    timePace = mrdivide(ceil(mrdivide(1000.0, h.FramesPerSecond)), 1000.0);
    % 116 118
    [tStart, tFinal] = h.TimeseriesReadFcn(h);
    % 118 120
    timeAdvance = mtimes(h.TimeScaling, timePace);
    % 120 123
    % 121 123
    if gt(mrdivide(abs(minus(mrdivide(h.TimeScaling, h.FramesPerSecond), timeAdvance)), timeAdvance), .15)
        warning('Aero:FlightGearAnimation:timeAdvance', 'TimerPeriod has been set to %5.3f. You may wish to modify the FlightGear animation TimeScaling and FramesPerSecond properties to compensate for the millisecond limit of the TimerPeriod.  See documentation for details.', timePace);
        % 124 129
        % 125 129
        % 126 129
        % 127 129
    end % if
    % 129 132
    % 130 132
    h.FGTimer = timer('Name', 'FGAnimTimer', 'Tag', horzcat(num2str(h.DestinationIPAddress), ' ', num2str(h.DestinationPort)));
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    h.FGTimer.BusyMode = 'drop';
    % 139 146
    % 140 146
    % 141 146
    % 142 146
    % 143 146
    % 144 146
    h.FGTimer.ErrorFcn = cellhorzcat(@timerCallbackFcn);
    % 146 150
    % 147 150
    % 148 150
    h.FGTimer.ExecutionMode = 'fixedRate';
    h.FGTimer.Period = timePace;
    h.FGTimer.StartFcn = cellhorzcat(@timerCallbackFcn, h, tStart);
    h.FGTimer.StopFcn = cellhorzcat(@timerCallbackFcn, h, tFinal, h.FGSocket);
    % 153 164
    % 154 164
    % 155 164
    % 156 164
    % 157 164
    % 158 164
    % 159 164
    % 160 164
    % 161 164
    % 162 164
    h.FGTimer.TasksToExecute = plus(ceil(mrdivide(minus(tFinal, tStart), mtimes(h.TimeScaling, timePace))), 1.0);
    h.FGTimer.TimerFcn = cellhorzcat(@timerCallbackFcn, h, tStart, timeAdvance, tFinal);
    % 165 168
    % 166 168
    h.FGTimer.UserData = tStart;
    % 168 172
    % 169 172
    % 170 172
    start(h.FGTimer);
    % 172 176
    % 173 176
    % 174 176
end % function
function timerCallbackFcn(timerObj, event, h, timeIn, timeAdvance, tFinal)
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    switch event.Type
    case 'StartFcn'
    case 'TimerFcn'
        % 184 187
        % 185 187
        t = get(timerObj, 'UserData');
        % 187 189
        if lt(t, tFinal)
            update(h, t);
            % 190 192
            timerObj.UserData = plus(timeIn, mtimes(timerObj.TasksExecuted, timeAdvance));
        else
            % 193 195
            update(h, tFinal);
        end % if
    case 'StopFcn'
        % 197 199
        delete(timerObj)
        % 199 201
        timeAdvance.close()
    case 'ErrorFcn'
        % 202 204
    end % switch
    % 204 206
end % function
function consistencyCheck(h)
    % 207 212
    % 208 212
    % 209 212
    % 210 212
    sourceType = set(h, 'TimeseriesSourceType');
    readType = {'TimeseriesRead','Array6DoFRead','Array3DoFRead','StructTimeRead'};
    sourceDType = {'timeseries','double','double','struct'};
    % 214 216
    if any(strcmpi(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0})))
        % 216 218
        if not(strcmpi(class(h.TimeseriesSource), sourceDType{strmatch(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0}), 'exact')}))
            % 218 220
            error('Aero:FlightGearAnimation:SourceDType', 'TimeseriesSource needs to be updated to work with TimeseriesSourceType');
            % 220 222
        end % if
        if not(strcmpi(func2str(h.TimeseriesReadFcn), readType{strmatch(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0}), 'exact')}))
            % 223 225
            error('Aero:FlightGearAnimation:ReadFcn', 'TimeseriesReadFcn needs to be updated to work with TimeseriesSourceType');
            % 225 227
        end % if
    end % if
    % 228 230
end % function
