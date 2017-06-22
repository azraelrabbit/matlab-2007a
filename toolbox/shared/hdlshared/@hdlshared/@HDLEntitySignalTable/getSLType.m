function sltype = getSLType(this, indices)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        signal = this.Signals(indices);
        sltype = signal.SLType;
    else
        sltype = {};
        for n=1.0:length(indices)
            signal = this.Signals(indices(n));
            sltype{n} = signal.SLType;
        end % for
    end % if
end % function
