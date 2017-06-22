function [propseg, pseg1, pseg2, presdiv, sample] = can_bit_timing(fsys, bitrate, nq, sample_point)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    presdiv = mrdivide(fsys, mtimes(nq, bitrate));
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    tolerance = 1e-05;
    if gt(abs(minus(round(presdiv), presdiv)), tolerance)
        nl = sprintf('\n');
        error(horzcat('System_Frequency / ( Number_Of_Quanta * CAN_Bit_Rate ) must equal within ', sprintf('%.5f', tolerance), nl, 'of a whole number, ', 'but the current settings for these values give: ', nl, nl, '  (', num2str(fsys), ' / ( ', num2str(nq), ' * ', num2str(bitrate), ' ) = ', sprintf('%.10f', presdiv), nl, nl, 'You must change one or more of Number_Of_Quanta, CAN_Bit_Rate and System_Frequency', nl, 'such that the result is a whole number.'));
    else
        % 36 44
        % 37 44
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        % 43 46
        % 44 46
        presdiv = round(presdiv);
    end
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    if (le(sample_point, 0.0)) | (ge(sample_point, 1.0))
        error(horzcat('Sample_Point must be greater than 0 and less than 1. You must select bit timing parameters', sprintf('\n'), 'such that the sample point is in the required range. For details of bit timing parameters,', sprintf('\n'), 'see any reference documentation on Controller Area Network.'));
        % 53 58
        % 54 58
        % 55 58
        % 56 58
    end
    % 58 61
    % 59 61
    TSEG1 = 2.0:min(minus(nq, 1.0), 16.0);
    % 61 64
    % 62 64
    SAMPLE = mrdivide(plus(1.0, TSEG1), nq);
    % 64 67
    % 65 67
    [tmp, idx] = min(abs(minus(SAMPLE, sample_point)));
    sample = SAMPLE(idx);
    tseg1 = TSEG1(idx);
    % 69 72
    % 70 72
    propseg = floor(mrdivide(tseg1, 2.0));
    pseg1 = minus(tseg1, propseg);
    pseg2 = minus(minus(minus(nq, 1.0), propseg), pseg1);
end
