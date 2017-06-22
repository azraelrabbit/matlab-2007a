function varargout = feval(d, methodName, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if any(strcmp(methods(d), methodName))
        if eq(nargout, 0.0)
            builtin('feval', methodName, d, varargin{:});
        else
            varargout{1.0} = builtin('feval', methodName, d, varargin{:});
        end % if
    else
        if eq(nargout, 0.0)
            javaMethod(methodName, d.Document, varargin{:});
        else
            varargout{1.0} = javaMethod(methodName, d.Document, varargin{:});
        end % if
    end % if
end % function
