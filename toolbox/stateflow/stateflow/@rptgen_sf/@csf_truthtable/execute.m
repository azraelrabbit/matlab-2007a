function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(isempty(this.RuntimeTruthTable))
        out = this.makeTable(d);
    else
        ttHandles = rptgen_sf.csf_truthtable.findTruthTables;
        out = d.createDocumentFragment;
        % 13 15
        for i=1.0:length(ttHandles)
            this.RuntimeTruthTable = ttHandles(i);
            out.appendChild(makeTable(this, d));
        end % for
        this.RuntimeTruthTable = [];
    end % if
