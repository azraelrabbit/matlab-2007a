function nesl_error(errorQueue, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    errorInfo = lErrorInfo(varargin{:});
    % 14 16
    errorQueue.addError(errorInfo.Object, errorInfo.MessageId, errorInfo.Message);
    nesl_lastexception(errorInfo);
    % 17 19
end % function
function errorInfo = lErrorInfo(varargin)
    % 20 23
    % 21 23
    messageId = '';
    message = '';
    object = '';
    % 25 27
    if eq(nargin, 1.0)
        exception = varargin{1.0};
        messageId = exception.MessageId;
        message = exception.Message;
        object = exception.Object;
        if not(isempty(object))
            object = get_param(object.Description, 'Handle');
        else
            object = [];
        end % if
    else
        if isstruct(varargin{2.0})
            object = varargin{1.0};
            errStruct = varargin{2.0};
            messageId = errStruct.identifier;
            message = errStruct.message;
        else
            object = varargin{1.0};
            messageId = varargin{2.0};
            message = pm_message(messageId, varargin{3.0:end});
        end % if
        % 47 49
    end % if
    if isempty(object)
        object = [];
    else
        object = get_param(object, 'Handle');
    end % if
    errorInfo = struct('MessageId', messageId, 'Message', message, 'Object', object);
    % 55 58
    % 56 58
end % function
