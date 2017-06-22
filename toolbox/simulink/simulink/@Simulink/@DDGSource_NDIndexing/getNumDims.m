function numDims = getNumDims(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    numDims = str2double(this.DialogData.NumberOfDimensions);
    if isnan(numDims) || ne(length(numDims), 1.0) || le(numDims, 0.0) || ne(floor(numDims), numDims) || not(isreal(numDims))
        numDims = 1.0;
    end % if
    % 11 12
end % function
