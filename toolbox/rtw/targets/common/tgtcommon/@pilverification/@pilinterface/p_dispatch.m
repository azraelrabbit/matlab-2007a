function varargout = p_dispatch(obj, method, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    methodslist = methods(obj.implementation);
    if any(strcmp(methodslist, method))
        if gt(nargout, 0.0)
            varargout = cellhorzcat(feval(method, obj.implementation, varargin{:}));
        else
            feval(method, obj.implementation, varargin{:});
        end % if
    else
        error(horzcat('"', method, '" method is not available in class: ', class(obj.implementation)));
        % 26 27
        varargout = {};
    end % if
end % function
