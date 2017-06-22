function h = ComponentMaker(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    h = feval(mfilename('class'));
    % 8 9
    if eq(length(varargin), 1.0)
        if isa(varargin{1.0}, 'rptgen.rptcomponent')
            h.loadComponent(varargin{1.0});
        else
            h.v1convert(varargin{1.0});
        end % if
    else
        set(h, varargin{:});
    end % if
end % function
