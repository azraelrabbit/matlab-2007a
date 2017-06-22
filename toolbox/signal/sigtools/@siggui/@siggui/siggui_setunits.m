function siggui_setunits(this, units)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    if (isempty(this.Container)) | (~(ishandle(this.Container)))
        % 10 12
        hvec = handles2vector(this);
        % 12 14
        if ~(isempty(hvec))
            hvec(~(isprop(hvec, 'units'))) = [];
            % 15 17
            hhvec = handle(hvec);
            % 17 19
            hhvec = find(hhvec, '-depth', 0.0, '-not', '-isa', 'hg.text');
            % 19 21
            hvec = double(hhvec);
            % 21 23
            set(hvec, 'units', units);
        end
    else
        set(this.Container, 'Units', units)
    end
end
