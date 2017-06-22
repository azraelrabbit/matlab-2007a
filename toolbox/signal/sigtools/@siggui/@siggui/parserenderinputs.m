function pos = parserenderinputs(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hFig = -1.0;
    pos = [];
    % 10 12
    for i=1.0:length(varargin)
        if isnumeric(varargin{i})
            if ishandle(varargin{i})
                hh = handle(varargin{i});
                % 15 17
                if isa(hh, 'figure') || isa(hh, 'uipanel') || isa(hh, 'uicontainer')
                    hFig = varargin{i};
                end
            else
                if eq(length(varargin{i}), 4.0)
                    pos = varargin{i};
                end
            end
        end
    end % for
    if not(ishandle(hFig))
        hh = handle(this.Parent);
        if isa(hh, 'figure') || isa(hh, 'uipanel') || isa(hh, 'uicontainer')
            hFig = this.Parent;
        else
            hFig = gcf;
        end
    end
    set(this, 'Parent', hFig);
end
