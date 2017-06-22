function specification = getSpecification(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isminorder(this, varargin{:})
        specification = 'TW,Ap';
    else
        specification = 'N,TW';
    end % if
end % function
