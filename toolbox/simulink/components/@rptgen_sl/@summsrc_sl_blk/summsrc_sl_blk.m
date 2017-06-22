function h = summsrc_sl_blk(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    h = rptgen_sl.summsrc_sl_blk;
    % 12 15
    % 13 15
    if eq(length(varargin), 3.0)
        varargin = cellhorzcat('type', varargin{1.0}, 'propsrc', varargin{2.0}, 'loopcomp', varargin{3.0});
    else
        % 17 19
        if eq(length(varargin), 5.0)
            varargin = cellhorzcat('type', varargin{1.0}, 'propsrc', varargin{2.0}, 'loopcomp', varargin{3.0}, 'properties', varargin{4.0}, 'anchor', varargin{5.0});
            % 20 25
            % 21 25
            % 22 25
            % 23 25
        end
    end
    set(h, varargin{:});
end
