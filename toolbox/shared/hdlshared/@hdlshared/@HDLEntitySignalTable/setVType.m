function setVType(this, indices, vtypes)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        % 8 9
        signal = this.Signals(indices);
        signal.VType = vtypes;
    else
        % 12 14
        % 13 14
        for n=1.0:length(indices)
            signal = this.Signals(indices(n));
            signal(indices(n)).VType(vtypes{n});
        end % for
        % 18 19
    end % if
end % function
