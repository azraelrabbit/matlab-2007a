function this = appdata_hg(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock;
    % 9 11
    persistent RPTGEN_APPDATA_PERSISTENT;
    % 11 13
    if eq(length(varargin), 1.0)
        if isa(varargin{1.0}, mfilename('class'))
            % 14 17
            % 15 17
            RPTGEN_APPDATA_PERSISTENT = varargin{1.0};
        else
            % 18 20
            RPTGEN_APPDATA_PERSISTENT = [];
        end
        varargin = {};
    end
    % 23 25
    if isempty(RPTGEN_APPDATA_PERSISTENT)
        RPTGEN_APPDATA_PERSISTENT = feval(mfilename('class'));
    end
    this = RPTGEN_APPDATA_PERSISTENT;
    % 28 30
    if not(isempty(varargin))
        set(this, varargin{:});
    end
end
