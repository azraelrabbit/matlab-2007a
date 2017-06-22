function updateFracLengthFromSlope(this, value)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    try
        slope = eval(value);
        this.FracLength = num2str(uminus(log2(slope)));
    catch
        this.FracLength = horzcat('-log2(', value, ')');
    end % try
end % function
