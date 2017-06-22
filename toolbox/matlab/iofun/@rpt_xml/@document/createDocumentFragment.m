function df = createDocumentFragment(d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    df = javaMethod('createDocumentFragment', java(d));
    % 10 12
    % 11 12
    for i=1.0:length(varargin)
        df.appendChild(d.createTextNode(varargin{i}));
        % 14 15
    end % for
end % function
