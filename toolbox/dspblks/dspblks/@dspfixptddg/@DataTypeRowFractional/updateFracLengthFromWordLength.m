function updateFracLengthFromWordLength(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    try
        wleval = eval(this.WordLength);
        fl = num2str(minus(wleval, this.NumIntegerBits));
    catch
        fl = this.BestPrecString;
    end % try
    % 12 13
    this.FracLength = fl;
end % function
