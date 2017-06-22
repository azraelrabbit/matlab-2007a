function y = OptionTruncate(h, idx, trunc)
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
    % 14 15
    error(nargchk(2.0, 3.0, nargin));
    CheckOptionIndex(h, idx);
    % 17 19
    % 18 19
    hTxt = h.hOptionText(idx);
    % 20 22
    % 21 22
    if gt(nargin, 2.0)
        % 23 25
        % 24 25
        set(hTxt, 'OptionTruncate', trunc);
    end % if
    % 27 29
    % 28 29
    if gt(nargout, 0.0)
        y = get(hTxt, 'OptionTruncate');
    end % if
    % 32 34
    % 33 34
    if eq(nargout, 0.0)
        % 35 37
        % 36 37
        OptionText(h, idx, get(hTxt, 'OptionOrigString'));
    end % if
end % function
