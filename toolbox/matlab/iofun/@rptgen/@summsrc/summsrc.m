function this = summsrc(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    this = rptgen.summsrc;
    % 9 11
    if eq(length(varargin), 3.0)
        varargin = cellhorzcat('type', varargin{1.0}, 'propsrc', varargin{2.0}, 'loopcomp', varargin{3.0});
    else
        % 13 15
        if eq(length(varargin), 5.0)
            varargin = cellhorzcat('type', varargin{1.0}, 'propsrc', varargin{2.0}, 'loopcomp', varargin{3.0}, 'properties', varargin{4.0}, 'anchor', varargin{5.0});
            % 16 21
            % 17 21
            % 18 21
            % 19 21
        end
    end
    set(this, varargin{:});
end
