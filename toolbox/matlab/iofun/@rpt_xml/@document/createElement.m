function rgElement = createElement(d, tagName, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    rgElement = javaMethod('createElement', java(d), tagName);
    % 12 15
    % 13 15
    % 14 15
    if gt(length(varargin), 0.0)
        for i=1.0:length(varargin)
            rgElement.appendChild(createTextNode(d, varargin{i}));
        end % for
    end % if
end % function
