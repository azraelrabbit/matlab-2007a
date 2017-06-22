function setpixelpos(this, field, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(3.0, Inf, nargin));
    % 8 11
    % 9 11
    if ischar(field)
        field = this.Handles.(field);
        for indx=1.0:minus(length(varargin), 1.0)
            if ischar(varargin{indx})
                field = field.(varargin{indx});
            else
                field = field(varargin{indx});
            end
        end % for
        pos = varargin{end};
    else
        pos = varargin{1.0};
    end
    % 23 25
    origUnits = get(field, 'Units');
    set(field, 'Units', 'Pixels');
    set(field, 'Position', pos);
    if ~(iscell(origUnits))
        origUnits = cellhorzcat(origUnits);
    end
    for indx=1.0:length(origUnits)
        set(field(indx), 'Units', origUnits{indx});
    end % for
end
