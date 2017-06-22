function t = createTextNode(d, textContent, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isa(textContent, 'org.w3c.dom.Node')
        t = textContent;
    else
        if isempty(varargin)
            varargin = {[0.0]};
        end % if
        % 14 15
        t = javaMethod('createTextNode', java(d), rptgen.toString(textContent, varargin{:}));
        % 16 18
        % 17 18
    end % if
end % function
