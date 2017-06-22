function this = filter_string(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this = hdsviewer.filter_string;
    if eq(nargin, 0.0)
        return;
    end % if
    % 12 14
    % 13 14
    for k=1.0:mrdivide(nargin, 2.0)
        switch lower(varargin{minus(mtimes(2.0, k), 1.0)})
        case 'name'
            this.hdsvariable = varargin{mtimes(2.0, k)};
            this.name = varargin{mtimes(2.0, k)};
        otherwise
            set(this, varargin{minus(mtimes(2.0, k), 1.0)}, varargin{mtimes(2.0, k)});
            % 21 22
        end % switch
    end % for
    if not(isfield(this.parent.DataSet.testvector, this.hdsvariable)) && not(isfield(this.parent.DataSet.variable, this.hdsvariable))
        % 25 26
        error('Result or test vector doesn''t exist in the dataset')
    end % if
    % 28 30
    % 29 30
    initialize(this);
end % function
