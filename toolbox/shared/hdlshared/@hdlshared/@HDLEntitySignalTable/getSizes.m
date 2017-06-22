function sizes = getSizes(this, indices)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isscalar(indices)
        sltype = this.Signals(indices).SLType;
        [size, bp, signed] = hdlwordsize(sltype);
        sizes = horzcat(size, bp, signed);
    else
        sizes = zeros(length(indices), 3.0);
        for n=1.0:length(indices)
            sltype = this.Signals(indices(n)).SLType;
            [size, bp, signed] = hdlwordsize(sltype);
            sizes(n, :) = horzcat(size, bp, signed);
        end % for
    end % if
end % function
