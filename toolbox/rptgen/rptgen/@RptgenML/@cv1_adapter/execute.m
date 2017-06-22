function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(isempty(this.OldComponent))
        out = execute(this.OldComponent);
    else
        out = [];
    end
    % 13 15
    if isa(out, 'sgmltag')
        out = java(out, java(d));
    else
        if iscell(out)
            out = java(sgmltag(out), java(d));
        end
    end
end
