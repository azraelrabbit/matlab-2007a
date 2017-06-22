function h = rptcomponent(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = feval(horzcat('rptgen.', mfilename));
    % 9 10
    if not(isempty(varargin))
        set(h, varargin{:});
    end % if
end % function
