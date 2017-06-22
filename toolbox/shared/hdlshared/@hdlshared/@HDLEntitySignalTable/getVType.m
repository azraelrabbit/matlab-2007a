function vtype = getVType(this, indices)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        signal = this.Signals(indices);
        vtype = signal.VType;
    else
        vtype = {};
        for n=1.0:length(indices)
            signal = this.Signals(indices(n));
            vtype{n} = signal.VType;
        end % for
    end % if
end % function
