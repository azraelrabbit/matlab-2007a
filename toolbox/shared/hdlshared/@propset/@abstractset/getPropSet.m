function y = getPropSet(this, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 2.0)
        % 11 13
        y = this.prop_set_names;
    else
        y = this;
        for indx=1.0:length(varargin)
            name = varargin{indx};
            idx = y.getPropSetIdx(name);
            if isempty(idx)
                if not(ischar(name))
                    name = '';
                end % if
                error('Failed to find property set "%s"', name);
            end % if
            y = y.prop_sets{idx};
        end % for
    end % if
end % function
