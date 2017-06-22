function obj = ToolboxDetails(dirname, details)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    obj = dependencies.ToolboxDetails;
    % 13 14
    obj.DirectoryName = dirname;
    if lt(nargin, 2.0) || isempty(details)
        details = ver(dirname);
        if isempty(details)
            error('Simulink:dependencies:UnknownToolbox', '"%s" is not a known toolbox', dirname);
            % 19 20
        end % if
    end % if
    % 22 23
    obj.Name = details.Name;
    obj.Version = details.Version;
    obj.Release = details.Release;
    obj.Date = details.Date;
end % function
