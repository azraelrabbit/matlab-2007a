function OptionHilite(obj, idx, state)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(3.0, 3.0, nargin));
    CheckOptionIndex(obj, idx);
    % 12 13
    if strcmpi(state, 'on')
        % 14 15
        bg = [1.0 1.0 1.0];
    else
        bg = obj.Background;
    end % if
    set(obj.hOptionText(idx), 'background', bg);
end % function
