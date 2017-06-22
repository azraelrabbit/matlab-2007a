function wasClosed = closeReport(this, rpt, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        rpt = this.getCurrentDoc;
    end % if
    % 12 14
    wasClosed = true;
    if isempty(rpt)
    else
        if isa(rpt, 'rptgen.DAObject')
            % 17 19
            nextSelect = rpt.left;
            if isempty(nextSelect)
                nextSelect = rpt.right;
            end % if
            if isempty(nextSelect)
                nextSelect = rpt.up;
            end % if
            % 25 27
            wasClosed = doClose(rpt, varargin{:});
            % 27 29
            if wasClosed && not(isempty(this.Editor))
                ed = DAStudio.EventDispatcher;
                ed.broadcastEvent('HierarchyChangedEvent', this);
                % 31 33
                this.Editor.view(nextSelect);
            end % if
        else
            if ischar(rpt)
                wasClosed = this.closeReport(this.findRptByName(rpt), varargin{:});
            else
                warning('rptgen:ClosingUnknownObject', 'Unrecognized object type "%s".', class(rpt));
            end % if
        end % if
    end % if
end % function
