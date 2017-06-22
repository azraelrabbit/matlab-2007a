function [success, err] = CheckFrame(jumptoObj, local_frame)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if not(isnumeric(local_frame))
        local_frame = NaN;
    end
    % 13 15
    success = not(isnan(local_frame));
    err = '';
    % 16 18
    if not(success)
        CR = sprintf('\n');
        err = 'Frame number must be a numeric value.';
        return
    end
    success = isreal(local_frame) && not(issparse(local_frame)) && isscalar(local_frame);
    if not(success)
        err = 'Frame must be a real scalar value.';
        return
    end
    success = eq(local_frame, floor(local_frame));
    if not(success)
        err = 'Frame must be an integer.';
        return
    end
    % 32 34
    success = gt(local_frame, 0.0);
    if not(success)
        err = 'Frame must be > 0.';
        return
    end
    success = le(local_frame, jumptoObj.maxframe);
    if not(success)
        err = sprintf('Frame must be <= %d.', jumptoObj.maxframe);
        return
    end
end
