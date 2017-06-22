function updateFracLengthsFromSlope(this, value)
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
        str = num2str(uminus(log2(slope)));
        this.FracLength = str;
        this.FracLengthEdit = str;
    catch
        str = horzcat('-log2(', value, ')');
        this.FracLength = str;
        this.FracLengthEdit = str;
    end % try
end % function
