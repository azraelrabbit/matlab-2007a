function obj = LibraryCategory(catName, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if gt(nargin, 0.0)
        obj = feval(mfilename('class'));
        % 15 18
        % 16 18
        % 17 18
        obj.CategoryName = catName;
        if not(isempty(varargin))
            set(obj, varargin{:});
        end % if
    end % if
end % function
