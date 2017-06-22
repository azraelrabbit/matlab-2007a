function this = CReport(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = RptgenML.CReport;
    if eq(length(varargin), 1.0)
        this.copyReport(varargin{1.0});
    else
        this.init(varargin{:});
    end % if
end % function
