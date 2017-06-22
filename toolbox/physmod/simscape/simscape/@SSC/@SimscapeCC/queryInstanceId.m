function varargout = queryInstanceId(this, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    storedVal = this.instanceIdImpl;
    % 7 8
    if doDebug && isempty(storedVal)
        % 9 10
        storedVal = getNewInstanceId;
        this.instanceIdImpl = storedVal;
        % 12 13
    end % if
    % 14 15
    varargout = cellhorzcat(storedVal);
end % function
