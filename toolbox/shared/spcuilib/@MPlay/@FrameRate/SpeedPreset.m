function newFPS = SpeedPreset(h, dir)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if eq(h.speedPreset, 0.0)
        % 18 22
        % 19 22
        % 20 22
        rate_ratio = mrdivide(h.desired_fps, h.source_fps);
        switch dir
        case '+'
            % 24 26
            enum = find(lt(rate_ratio, h.speedPresetCurr), 1.0, 'first');
            if isempty(enum)
                % 27 30
                % 28 30
                h.speedPreset = h.speedPresetCurr(end);
            else
                h.speedPreset = h.speedPresetCurr(enum);
            end % if
        case '-'
            % 34 36
            enum = find(gt(rate_ratio, h.speedPresetCurr), 1.0, 'last');
            if isempty(enum)
                % 37 40
                % 38 40
                h.speedPreset = h.speedPresetCurr(1.0);
            else
                h.speedPreset = h.speedPresetCurr(enum);
            end % if
        otherwise
            h.speedPreset = 1.0;
        end % switch
    else
        % 47 53
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        switch dir
        case '+'
            % 54 56
            newSpeedEnum = h.speedPresetIncr;
            h.speedPreset = newSpeedEnum(find(eq(h.speedPreset, h.speedPresetCurr)));
        case '-'
            newSpeedEnum = h.speedPresetDecr;
            h.speedPreset = newSpeedEnum(find(eq(h.speedPreset, h.speedPresetCurr)));
        otherwise
            h.speedPreset = 1.0;
        end % switch
    end % if
    % 64 67
    % 65 67
    newFPS = mtimes(h.speedPreset, h.source_fps);
