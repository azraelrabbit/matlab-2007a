function render(h, hInitialParent)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if not(isempty(h.Parent))
        % 15 17
        h.GraphicalParent = h.Parent;
    else
        if gt(nargin, 1.0)
            % 19 23
            % 20 23
            % 21 23
            h.GraphicalParent = hInitialParent;
        end
    end
    render_widget(h);
end
