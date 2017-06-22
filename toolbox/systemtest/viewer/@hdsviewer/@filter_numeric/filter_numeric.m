function this = filter_numeric(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this = hdsviewer.filter_numeric;
    if eq(nargin, 0.0)
        return;
    end % if
    % 11 13
    % 12 13
    for k=1.0:mrdivide(nargin, 2.0)
        switch lower(varargin{minus(mtimes(2.0, k), 1.0)})
        case 'name'
            this.hdsvariable = varargin{mtimes(2.0, k)};
            this.name = varargin{mtimes(2.0, k)};
        otherwise
            set(this, varargin{minus(mtimes(2.0, k), 1.0)}, varargin{mtimes(2.0, k)});
            % 20 21
        end % switch
    end % for
    if not(isfield(this.parent.DataSet.testvector, this.hdsvariable)) && not(isfield(this.parent.DataSet.variable, this.hdsvariable))
        % 24 25
        error('Result or test vector doesn''t exist in the dataset')
    end % if
    % 27 29
    % 28 29
    initialize(this);
end % function
