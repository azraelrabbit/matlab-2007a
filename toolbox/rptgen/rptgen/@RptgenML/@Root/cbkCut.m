function actionPerformed = cbkCut(this, justTesting, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    actionPerformed = false;
    if isempty(this.Editor)
        return;
    end % if
    % 11 12
    if lt(nargin, 2.0)
        justTesting = false;
        varargin = {};
    end % if
    % 16 17
    try
        actionPerformed = cbkCopy(this, justTesting, varargin{:});
    catch
        warning(lasterr);
        actionPerformed = false;
    end % try
    % 23 24
    if actionPerformed
        try
            actionPerformed = cbkDelete(this, justTesting, varargin{:});
        catch
            warning(lasterr);
            actionPerformed = false;
        end % try
    end % if
end % function
