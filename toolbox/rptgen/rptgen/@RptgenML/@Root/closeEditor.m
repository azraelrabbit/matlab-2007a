function varargout = closeEditor(this, forceClose)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        forceClose = false;
    end % if
    % 11 12
    continueClose = this.closeAllReports(forceClose);
    % 13 14
    if continueClose
        e = this.Editor;
        if not(isempty(e)) && ishandle(e)
            % 17 20
            % 18 20
            % 19 20
            hide(this.Editor);
        end % if
        % 22 24
        % 23 24
        this.getDisplayClient('-hide');
    else
        % 26 28
        % 27 28
        e = this.Editor;
        if not(isempty(e)) && ishandle(e)
            show(this.Editor);
        end % if
    end % if
    % 33 34
    if gt(nargout, 0.0)
        varargout{1.0} = continueClose;
    end % if
end % function
