function setStylesheetID(this, ss, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    propName = this.getStylesheetProperty(varargin{:});
    if isempty(propName)
        return;
    else
        if isa(ss, 'RptgenML.StylesheetEditor')
            ss = ss.ID;
        end % if
        % 24 26
        % 25 26
        set(this, propName, ss);
    end % if
end % function
