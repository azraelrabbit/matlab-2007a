function view(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    r = RptgenML.Root;
    if not(isempty(r.Editor))
        % 11 13
        % 12 13
        try
            r.Editor.view(this);
            % 15 17
            % 16 17
        end % try
    end % if
end % function
