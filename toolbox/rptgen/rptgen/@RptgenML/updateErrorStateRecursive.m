function updateErrorStateRecursive(dao, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dao.updateErrorState(varargin{:});
    % 8 9
    dao = dao.down;
        while not(isempty(dao))
        dao.updateErrorState(varargin{:});
        dao = dao.right;
    end % while
end % function
