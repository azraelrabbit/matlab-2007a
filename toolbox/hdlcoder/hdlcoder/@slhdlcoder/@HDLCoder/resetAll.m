function resetAll(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this.initParams(varargin{:});
    % 9 11
    % 10 11
    this.initState;
    % 12 14
    % 13 14
    if not(isempty(this.getStartNodeName))
        this.createConfigManager;
    end % if
end % function
