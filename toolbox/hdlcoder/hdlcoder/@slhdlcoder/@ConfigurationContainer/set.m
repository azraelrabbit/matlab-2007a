function set(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if ne(mod(length(varargin), 2.0), 0.0)
        disp(sprintf('Invalid configuration ''set'' statement in file: %s', this.fileName));
        disp(varargin);
    end % if
    % 11 12
    if isempty(this.settings)
        this.settings = varargin;
    else
        this.settings = cellhorzcat(this.settings{:}, varargin{:});
    end % if
end % function
