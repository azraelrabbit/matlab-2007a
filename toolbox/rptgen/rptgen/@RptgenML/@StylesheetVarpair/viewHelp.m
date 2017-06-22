function viewHelp(this, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    helpview(RptgenML.getHelpMapfile(varargin{:}), horzcat('obj.', class(this), '.', findSuffix(this)));
end % function
function editorType = findSuffix(this)
    % 14 17
    % 15 17
    % 16 17
    if strcmpi(this.Value, '#t') || strcmpi(this.Value, '#t')
        editorType = 'boolean';
    else
        editorType = 'string';
    end % if
end % function
