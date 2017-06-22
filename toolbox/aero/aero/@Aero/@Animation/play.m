function play(h, varargin)
    % 1 69
    % 2 69
    % 3 69
    % 4 69
    % 5 69
    % 6 69
    % 7 69
    % 8 69
    % 9 69
    % 10 69
    % 11 69
    % 12 69
    % 13 69
    % 14 69
    % 15 69
    % 16 69
    % 17 69
    % 18 69
    % 19 69
    % 20 69
    % 21 69
    % 22 69
    % 23 69
    % 24 69
    % 25 69
    % 26 69
    % 27 69
    % 28 69
    % 29 69
    % 30 69
    % 31 69
    % 32 69
    % 33 69
    % 34 69
    % 35 69
    % 36 69
    % 37 69
    % 38 69
    % 39 69
    % 40 69
    % 41 69
    % 42 69
    % 43 69
    % 44 69
    % 45 69
    % 46 69
    % 47 69
    % 48 69
    % 49 69
    % 50 69
    % 51 69
    % 52 69
    % 53 69
    % 54 69
    % 55 69
    % 56 69
    % 57 69
    % 58 69
    % 59 69
    % 60 69
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    if isempty(h.Bodies)
        warning('Aero:Animation:NoBodies', 'First load geometery data using createBody before attempting to play the animation.');
        return;
    end % if
    for i=1.0:size(h.Bodies, 2.0)
        if isempty(h.Bodies{i}.TimeseriesSource)
            warning('Aero:Animation:NoTimeseriesSource', 'First set TimerseriesSource for all bodies before attempting to play the animation.');
            return;
        end % if
    end % for
    if isempty(h.Figure) || not(ishandle(h.Figure))
        warning('Aero:Animation:NothingToAnimate', 'Cannot find figure to animate. Reinitializing figure and continuing with play.');
        h.initialize;
    end % if
    % 82 84
    if not(isfinite(h.TStart)) || not(isfinite(h.TFinal))
        locStartStopTimeHeuristic(h);
    end % if
    % 86 90
    % 87 90
    % 88 90
    h.show;
    % 90 94
    % 91 94
    % 92 94
    timePace = mrdivide(ceil(mrdivide(1000.0, h.FramesPerSecond)), 1000.0);
    % 94 96
    timeAdvance = mtimes(h.TimeScaling, timePace);
    % 96 99
    % 97 99
    if gt(mrdivide(abs(minus(mrdivide(h.TimeScaling, h.FramesPerSecond), timeAdvance)), timeAdvance), .15)
        warning('Aero:Animation:timePace', 'TimerPeriod has been set to %5.3f. You may wish to modify theanimation TimeScaling and FramesPerSecond properties to compensate for the millisecond limit of the TimerPeriod.  See documentation for details.', timePace);
        % 100 105
        % 101 105
        % 102 105
        % 103 105
    end % if
    % 105 107
    oldTimer = timerfind;
    % 107 109
    if not(isempty(oldTimer))
        oldTimer = oldTimer(strcmp(oldTimer.Name, 'MLAnimTimer'));
            while any(isvalid(oldTimer))
            % 111 113
        end % while
    end % if
    % 114 117
    % 115 117
    h.MLAnimTimer = timer('Name', 'MLAnimTimer');
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    h.MLAnimTimer.BusyMode = 'drop';
    % 122 129
    % 123 129
    % 124 129
    % 125 129
    % 126 129
    % 127 129
    h.MLAnimTimer.ErrorFcn = cellhorzcat(@timerCallbackFcn);
    % 129 133
    % 130 133
    % 131 133
    h.MLAnimTimer.ExecutionMode = 'fixedRate';
    h.MLAnimTimer.Period = timePace;
    h.MLAnimTimer.StartFcn = cellhorzcat(@timerCallbackFcn, h, h.tStart);
    h.MLAnimTimer.StopFcn = cellhorzcat(@timerCallbackFcn, h, h.tFinal);
    % 136 147
    % 137 147
    % 138 147
    % 139 147
    % 140 147
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    h.MLAnimTimer.TasksToExecute = plus(ceil(mrdivide(minus(h.TFinal, h.TStart), mtimes(h.TimeScaling, timePace))), 1.0);
    h.MLAnimTimer.TimerFcn = cellhorzcat(@timerCallbackFcn, h, timeAdvance);
    % 148 151
    % 149 151
    h.MLAnimTimer.UserData = h.TStart;
    % 151 155
    % 152 155
    % 153 155
    start(h.MLAnimTimer);
    % 155 159
    % 156 159
    % 157 159
function timerCallbackFcn(timerObj, event, h, timeAdvance)
    % 159 165
    % 160 165
    % 161 165
    % 162 165
    % 163 165
    switch event.Type
    case 'StartFcn'
    case 'TimerFcn'
        % 167 170
        % 168 170
        t = get(timerObj, 'UserData');
        % 170 172
        if lt(t, h.TFinal)
            % 172 174
            h.updateBodies(t);
            h.updateCamera(t);
            % 175 178
            % 176 178
            timerObj.UserData = plus(h.TStart, mtimes(timerObj.TasksExecuted, timeAdvance));
        else
            % 179 181
            h.updateBodies(h.TFinal);
            h.updateCamera(h.TFinal);
        end % if
    case 'StopFcn'
        % 184 186
        delete(timerObj)
    case 'ErrorFcn'
        % 187 189
    end % switch
    % 189 191
function locStartStopTimeHeuristic(h)
    % 191 203
    % 192 203
    % 193 203
    % 194 203
    % 195 203
    % 196 203
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    for i=1.0:length(h.Bodies)
        [tempStart(i), tempFinal(i)] = h.Bodies{i}.findstartstoptimes;
    end % for
    h.TStart = max(tempStart(isfinite(tempStart)));
    h.TFinal = min(tempFinal(isfinite(tempFinal)));
    % 207 232
    % 208 232
    % 209 232
    % 210 232
    % 211 232
    % 212 232
    % 213 232
    % 214 232
    % 215 232
    % 216 232
    % 217 232
    % 218 232
    % 219 232
    % 220 232
    % 221 232
    % 222 232
    % 223 232
    % 224 232
    % 225 232
    % 226 232
    % 227 232
    % 228 232
    % 229 232
    % 230 232
