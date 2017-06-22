function this = filter_expression(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = hdsviewer.filter_expression;
    if eq(nargin, 0.0)
        return;
    end % if
    % 13 15
    % 14 15
    for k=1.0:mrdivide(nargin, 2.0)
        switch lower(varargin{minus(mtimes(2.0, k), 1.0)})
        case 'name'
            this.expression = varargin{mtimes(2.0, k)};
            this.name = varargin{mtimes(2.0, k)};
        otherwise
            set(this, varargin{minus(mtimes(2.0, k), 1.0)}, varargin{mtimes(2.0, k)});
            % 22 23
        end % switch
    end % for
    % 25 27
    % 26 27
    success = initialize(this);
    if not(success)
        error('Invalid expression')
    end % if
end % function
