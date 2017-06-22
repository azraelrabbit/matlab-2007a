function y = FitToView(mplayObj, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if gt(nargout, 0.0)
        if gt(nargin, 1.0)
            error('Cannot get and set fit-to-view at the same time.');
        end % if
        y = mplayObj.widgetsObj.FitToViewState;
    else
        mplayObj.widgetsObj.FitToViewToggle(varargin{:});
    end % if
end % function
