function tf = getDirty(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tf = not(isempty(find(this, 'Dirty', true)));
end % function
