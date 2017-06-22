function [success, err] = CheckFPS(framerateObj, local_fps)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    err = '';
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if not(isnumeric(local_fps))
        local_fps = NaN;
    end
    % 15 17
    success = not(isnan(local_fps));
    if not(success)
        CR = sprintf('\n');
        err = horzcat('Frame rate must be a numeric value.', CR, 'MATLAB expressions are not allowed.');
        return
    end
    success = isreal(local_fps) && not(issparse(local_fps)) && isscalar(local_fps);
    if not(success)
        err = 'Frame rate must be a real scalar value.';
        return
    end
    success = gt(local_fps, 0.0);
    if not(success)
        err = 'Frame rate must be > 0.';
        return
    end
    success = not(isinf(local_fps));
    if not(success)
        err = horzcat('Frame rate cannot be set to "inf".', sprintf('\n\n'), 'We''re fast, but we''re not THAT fast.');
        % 35 37
        return
    end
end
