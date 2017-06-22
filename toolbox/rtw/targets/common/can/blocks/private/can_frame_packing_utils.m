function varargout = can_frame_packing_utils(util, message_in, varargin)
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
    persistent originalString;
    persistent resolvedString;
    % 14 16
    switch lower(util)
    case 'preprocessmessage'
        % 17 19
        originalString = message_in.getDbFilePath;
        % 19 21
        message_out = i_preProcessMessage(message_in);
        % 21 23
        resolvedString = message_out.getDbFilePath;
        varargout{1.0} = message_out;
    case 'postprocessmessage'
        varargout{1.0} = i_postProcessMessage(message_in, originalString, resolvedString);
    otherwise
        disp('Unknown utility.');
    end
    return
end
function message_out = i_preProcessMessage(message_in)
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    message_out = message_in.clone;
    dbfilePath = message_out.getDbFilePath;
    if not(isempty(dbfilePath))
        token = java.lang.String('$MATLABROOT$');
        if dbfilePath.startsWith(token)
            % 42 44
            newPath = java.lang.String(matlabroot);
            newPath = newPath.concat(dbfilePath.substring(token.length));
            message_out.setDbFilePath(newPath);
        end
    end
    return
end
function message = i_postProcessMessage(message, originalString, resolvedString)
    % 51 54
    % 52 54
    newString = message.getDbFilePath;
    if eq(strcmp(resolvedString, newString), 1.0)
        % 55 59
        % 56 59
        % 57 59
        newString = originalString;
    end
    message.setDbFilePath(newString);
    return
end
