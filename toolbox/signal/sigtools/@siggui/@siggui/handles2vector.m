function h = handles2vector(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = get(this, 'Handles');
    % 9 11
    % 10 11
    if isfield(h, 'java')
        if isfield(h.java, 'controller')
            h.controller = h.java.controller;
        end % if
        h = rmfield(h, 'java');
    end % if
    % 17 18
    h = convert2vector(h);
    % 19 21
    % 20 21
    h(not(ishandle(h))) = [];
end % function
