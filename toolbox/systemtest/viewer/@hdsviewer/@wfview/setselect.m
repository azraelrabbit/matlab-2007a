function setselect(h, gridpt)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(h.SelectionMode, 'off') && not(isnan(gridpt))
        return;
    end % if
    % 13 14
    thesepatches = double(h.Patches);
    % 15 16
    if isnan(gridpt)
        set(thesepatches, 'FaceColor', [1.0 1.0 1.0]);
        return;
    end % if
    % 20 23
    % 21 23
    % 22 23
    set(thesepatches, 'Selected', 'off');
    for k=1.0:length(thesepatches)
        thispatch = thesepatches(k);
        set(thispatch, 'FaceColor', [1.0 1.0 1.0]);
        % 27 28
        I = eq(get(thesepatches(k), 'UserData'), gridpt);
        if any(I)
            set(thesepatches(k), 'FaceColor', [1.0 0.0 0.0]);
        end % if
    end % for
end % function
