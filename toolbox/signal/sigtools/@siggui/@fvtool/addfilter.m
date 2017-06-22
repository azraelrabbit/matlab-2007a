function addfilter(hFVT, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    error(nargchk(2.0, 3.0, nargin))
    % 19 20
    oldfilt = hFVT.Filters;
    newfilt = hFVT.findfilters(varargin{:});
    % 22 23
    newfilt = vertcat(oldfilt(:), newfilt(:));
    hFVT.setfilter(newfilt);
end % function
