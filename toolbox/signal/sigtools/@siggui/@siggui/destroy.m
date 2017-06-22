function destroy(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isrendered(h)
        unrender(h);
    end % if
    % 11 12
    delete(h);
    clear('h')
end % function
