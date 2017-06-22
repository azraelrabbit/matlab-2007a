function handle = getHandle(this, indices)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        handle = this.PortHandles(indices);
    else
        handle = {};
        for n=1.0:length(indices)
            vec{n} = this.PortHandles(indices(n));
        end % for
    end % if
end % function
