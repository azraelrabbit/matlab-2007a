function createPlaybackSchedule(framerateObj)
    % 1 42
    % 2 42
    % 3 42
    % 4 42
    % 5 42
    % 6 42
    % 7 42
    % 8 42
    % 9 42
    % 10 42
    % 11 42
    % 12 42
    % 13 42
    % 14 42
    % 15 42
    % 16 42
    % 17 42
    % 18 42
    % 19 42
    % 20 42
    % 21 42
    % 22 42
    % 23 42
    % 24 42
    % 25 42
    % 26 42
    % 27 42
    % 28 42
    % 29 42
    % 30 42
    % 31 42
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    framerateObj.sched_counter = 0.0;
    % 42 44
    if framerateObj.sched_enable
        % 44 46
        rateScheduler(framerateObj);
    else
        % 47 49
        sched_Simple(framerateObj);
    end % if
end % function
function rateScheduler(framerateObj)
    % 52 77
    % 53 77
    % 54 77
    % 55 77
    % 56 77
    % 57 77
    % 58 77
    % 59 77
    % 60 77
    % 61 77
    % 62 77
    % 63 77
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    success = sched_Decimate(framerateObj);
    if success
        return;
    end % if
    % 80 83
    % 81 83
    maxSkip = 2.0;
    for Nskip=1.0:maxSkip
        success = sched_Burst(framerateObj, Nskip);
        if success
            return;
        end % if
    end % for
    sched_Simple(framerateObj);
    msg = sprintf(sprintf('Failed to find a playback schedule for\ntimer rates in the range %g to %g frames/sec.\n\nUsing a simple schedule with %g frames/sec.\nPlayback performance may be compromised.\n\n', framerateObj.sched_rateMin, framerateObj.sched_rateMax, framerateObj.desired_fps));
    % 91 98
    % 92 98
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    warndlg(msg, 'Frame Rate');
end % function
function success = sched_Simple(framerateObj)
    % 100 106
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    framerateObj.sched_fps = framerateObj.desired_fps;
    framerateObj.sched_showCount = 1.0;
    framerateObj.sched_skipCount = 0.0;
    success = true;
    % 109 112
    % 110 112
    if framerateObj.sched_verbose
        fprintf('sched_Simple: show=%d, skip=%d, f_act=%g\n', 1.0, 0.0, framerateObj.desired_fps);
        % 113 115
    end % if
end % function
function success = sched_Decimate(framerateObj)
    % 117 124
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    fo = framerateObj.desired_fps;
    fi_min = framerateObj.sched_rateMin;
    fi_max = framerateObj.sched_rateMax;
    if le(fo, fi_max)
        % 127 130
        % 128 130
        success = sched_Simple(framerateObj);
        return;
    end % if
    % 132 135
    % 133 135
    Nmin = ceil(mrdivide(minus(fo, fi_max), fi_max));
    Nmax = floor(mrdivide(minus(fo, fi_min), fi_min));
    if eq(Nmax, 0.0)
        % 137 139
        success = false;
        return;
    end % if
    % 141 143
    Nrange = max(1.0, Nmin):Nmax;
    % 143 145
    fi_actual = rdivide(fo, plus(Nrange, 1.0));
    % 145 149
    % 146 149
    % 147 149
    idx = find(and(ge(fi_actual, fi_min), le(fi_actual, fi_max)));
    if lt(numel(idx), numel(fi_actual))
        fprintf('\nAssertion: decimation scheduler\nComputed candidate rate outside desired range\nfo=%g, rateRange=[%g %g]\n\n', fo, fi_min, fi_max);
        % 151 154
        % 152 154
    end % if
    success = not(isempty(idx));
    if success
        % 156 163
        % 157 163
        % 158 163
        % 159 163
        % 160 163
        % 161 163
        nidx = numel(idx);
        nidx = floor(plus(1.0, mrdivide(nidx, 2.0)));
        idx = idx(nidx);
        framerateObj.sched_fps = fi_actual(idx);
        framerateObj.sched_skipCount = Nrange(idx);
        framerateObj.sched_showCount = 1.0;
        % 168 171
        % 169 171
        if framerateObj.sched_verbose
            fprintf('sched_Decimate: show=%d, skip=%d, f_act=%g\n', 1.0, Nrange(idx), fi_actual(idx));
            % 172 174
        end % if
    end % if
end % function
function success = sched_Burst(framerateObj, Nskip)
    % 177 184
    % 178 184
    % 179 184
    % 180 184
    % 181 184
    % 182 184
    fo = framerateObj.desired_fps;
    fi_min = framerateObj.sched_rateMin;
    fi_max = framerateObj.sched_rateMax;
    if le(fo, fi_max)
        % 187 193
        % 188 193
        % 189 193
        % 190 193
        % 191 193
        success = sched_Simple(framerateObj);
        return;
    end % if
    % 195 198
    % 196 198
    Nmax = floor(mrdivide(mtimes(Nskip, fi_max), minus(fo, fi_max)));
    Nmin = ceil(mrdivide(mtimes(Nskip, fi_min), minus(fo, fi_min)));
    % 199 201
    if eq(Nmax, 0.0)
        % 201 203
        success = false;
        return;
    end % if
    % 205 207
    Nrange = max(1.0, Nmin):Nmax;
    % 207 209
    fi_actual = rdivide(times(fo, Nrange), plus(Nrange, Nskip));
    % 209 213
    % 210 213
    % 211 213
    idx = find(and(ge(fi_actual, fi_min), le(fi_actual, fi_max)));
    if lt(numel(idx), numel(fi_actual))
        fprintf('\nAssertion: burst scheduler\nComputed candidate rate outside desired range\nfo=%g, rateRange=[%g %g]\n\n', fo, fi_min, fi_max);
        % 215 218
        % 216 218
    end % if
    success = not(isempty(idx));
    if success
        % 220 227
        % 221 227
        % 222 227
        % 223 227
        % 224 227
        % 225 227
        nidx = numel(idx);
        nidx = floor(plus(1.0, mrdivide(nidx, 2.0)));
        idx = idx(nidx);
        framerateObj.sched_fps = fi_actual(idx);
        framerateObj.sched_skipCount = Nskip;
        framerateObj.sched_showCount = Nrange(idx);
        % 232 235
        % 233 235
        if framerateObj.sched_verbose
            fprintf('sched_Burst: show=%d, skip=%d, f_act=%g\n', Nrange(idx), Nskip, fi_actual(idx));
            % 236 238
        end % if
    end % if
end % function
