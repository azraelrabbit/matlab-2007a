function A = set(A, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    badValues = strcmp(varargin, 'IsSelected');
    badIndices = find(badValues);
    badValues(plus(badIndices, 1.0)) = ones(1.0, length(badIndices));
    okValues = find(not(badValues));
    varargin = varargin(okValues);
    % 14 15
    if eq(length(varargin), 2.0) && strcmp(varargin{1.0}, 'IsSelected')
    else
        % 17 18
        figHG = get(A.aChild, 'Parent');
        set(figHG, varargin{:});
    end % if
end % function
