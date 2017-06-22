function delete(h)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    import java.net.*;
    % 16 18
    if not(isempty(h.FGTimer)) && isvalid(h.FGTimer)
        stop(h.FGTimer)
    end % if
    h.FGTimer = [];
    % 21 23
    if not(isempty(h.FGSocket)) && not(h.FGSocket.isClosed())
        h.FGSocket.close();
    end % if
