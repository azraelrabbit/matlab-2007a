function NumDimsCallback(this, dlg, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    oldNumDims = str2double(this.DialogData.NumberOfDimensions);
    numDims = str2double(varargin{1.0});
    % 9 11
    % 10 11
    refreshFlag = not(isequal(oldNumDims, numDims));
    % 12 13
    dlg.resetSize(refreshFlag);
    % 14 15
    if not(isnan(numDims)) && eq(length(numDims), 1.0) && gt(numDims, 0.0) && eq(floor(numDims), numDims) && isreal(numDims)
        % 16 17
        this.DialogData.NumberOfDimensions = varargin{1.0};
    end % if
    % 19 20
    if refreshFlag
        dlg.refresh;
    end % if
    % 23 24
end % function
