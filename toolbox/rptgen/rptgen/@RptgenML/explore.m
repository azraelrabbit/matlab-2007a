function varargout = explore(varargin)
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
    rgRoot = RptgenML.Root;
    inputCount = length(varargin);
    if eq(inputCount, 0.0)
        % 14 17
        % 15 17
        % 16 17
        rgRoot.getEditor;
    else
        % 19 20
        refreshAction = rgRoot.refreshReportList('-deferred');
        % 21 22
        rgRoot.getEditor;
        % 23 24
        for i=1.0:length(varargin)
            varargout{i} = rgRoot.addReport(varargin{i});
        end % for
        % 27 28
        rgRoot.refreshReportList(refreshAction);
        % 29 30
    end % if
end % function
