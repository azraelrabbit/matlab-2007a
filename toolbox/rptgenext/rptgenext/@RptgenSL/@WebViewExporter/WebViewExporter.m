function this = WebViewExporter(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = feval(mfilename('class'));
    % 11 13
    % 12 13
    this.applyDefaults;
    % 14 15
    if not(isempty(varargin))
        set(this, varargin{:});
    end % if
end % function
