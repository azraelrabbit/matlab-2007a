function varargout = queryInstanceId(this, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    storedVal = this.instanceIdImpl;
    % 7 8
    if isempty(storedVal)
        storedVal = getNewInstanceId;
        this.instanceIdImpl = storedVal;
        % 11 12
    end % if
    % 13 14
    varargout = cellhorzcat(storedVal);
end % function
