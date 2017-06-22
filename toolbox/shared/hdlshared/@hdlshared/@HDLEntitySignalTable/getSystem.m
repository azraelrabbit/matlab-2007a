function system = getSystem(this, indices)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isscalar(indices)
        signal = this.Signals(indices);
        system = signal.System;
    else
        system = {};
        for n=1.0:length(indices)
            signal = this.Signals(indices(n));
            system{n} = signal.System;
        end % for
    end % if
end % function
