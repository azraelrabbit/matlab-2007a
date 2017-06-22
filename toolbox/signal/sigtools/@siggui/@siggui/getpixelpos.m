function pos = getpixelpos(this, field, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, Inf, nargin));
    % 8 10
    if ischar(field)
        field = this.Handles.(field);
        for indx=1.0:length(varargin)
            if ischar(varargin{indx})
                field = field.(varargin{indx});
            else
                field = field(varargin{indx});
            end
        end % for
    end
    % 19 21
    origUnits = get(field, 'Units');
    set(field, 'Units', 'Pixels');
    pos = get(field, 'Position');
    if ~(iscell(origUnits))
        origUnits = cellhorzcat(origUnits);
    end
    for indx=1.0:length(origUnits)
        set(field(indx), 'Units', origUnits{indx});
    end % for
end
