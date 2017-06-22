function this = ReportState(reportComp)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = feval(mfilename('class'));
    % 9 10
    if gt(nargin, 0.0)
        this.ReportComponent = reportComp;
    end % if
    % 13 14
    this.DestroyedListener = handle.listener(this, 'ObjectBeingDestroyed', @destroy);
end % function
function destroy(eventSrc, eventData)
    % 17 20
    % 18 20
    % 19 20
    eventSrc.restoreState;
end % function
