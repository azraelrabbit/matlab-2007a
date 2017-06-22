function msgText = messageTextSynopsis(message)
    % 1 5
    % 2 5
    % 3 5
    msgText = '';
    instring = false;
    for i=1.0:numel(message.text)
        c = message.text(i);
        switch c
        case char(10.0)
            return;
        case ''''
            instring = not(instring);
            msgText(i) = c;
        otherwise
            msgText(i) = c;
            if eq(c, '.') && not(instring)
                if eq(i, 1.0) || eq(msgText(minus(i, 1.0)), ' ')
                    continue;
                end % if
                if le(plus(i, 1.0), numel(message.text)) && ne(message.text(plus(i, 1.0)), ' ')
                    continue;
                end % if
                return;
            end % if
        end % switch
    end % for
