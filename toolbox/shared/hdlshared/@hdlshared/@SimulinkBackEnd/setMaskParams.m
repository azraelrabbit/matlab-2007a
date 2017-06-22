function setMaskParams(this, slBlockName, pv)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(pv))
        % 9 12
        % 10 12
        % 11 12
        pv = ctranspose(pv);
        % 13 16
        % 14 16
        % 15 16
        pv = ctranspose(pv(:));
        % 17 19
        % 18 19
        c = horzcat(cellhorzcat('set_param', slBlockName), pv);
        % 20 22
        % 21 22
        feval(c{:});
    end % if
    % 24 26
    % 25 26
end % function
