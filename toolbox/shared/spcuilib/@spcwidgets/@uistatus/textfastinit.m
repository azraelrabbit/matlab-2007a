function textfastinit(h, str)
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
    % 13 14
    if not(isempty(h.up))
        h.TextHandle = OptionTextHandle(h.up.hWidget, h.privateIndex);
    else
        % 17 18
        h.TextHandle = [];
    end % if
end % function
