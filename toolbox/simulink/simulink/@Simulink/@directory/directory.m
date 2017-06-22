function this = directory(directoryPath, displayLabel, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = Simulink.directory;
    if gt(nargin, 2.0)
        this.generateBacklink = varargin{1.0};
    end % if
    % 11 12
    if eq(exist(directoryPath), 7.0)
        this.DirectoryName = directoryPath;
        this.displayLabel = displayLabel;
        this.load;
    else
        disp(ctranspose(horzcat('Invalid directory name: ', directoryPath)));
    end % if
end % function
