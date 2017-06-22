function setfilter(hFVT, varargin)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    error(nargchk(2.0, Inf, nargin))
    % 24 27
    % 25 27
    % 26 27
    opts = struct('index', []);
    % 28 29
    if isempty(varargin{1.0})
        filtobj = [];
    else
        % 32 33
        if isstruct(varargin{end})
            % 34 37
            % 35 37
            % 36 37
            error(nargchk(3.0, Inf, nargin));
            opts = setstructfields(opts, varargin{end});
            varargin = varargin(1.0:minus(end, 1.0));
        end % if
        % 41 42
        filtobj = hFVT.findfilters(varargin{:});
    end % if
    % 44 45
    if not(isempty(opts.index))
        oldfilts = get(hFVT, 'Filters');
        % 47 52
        % 48 52
        % 49 52
        % 50 52
        % 51 52
        if lt(length(oldfilts), minus(max(opts.index), 1.0))
            error('Index exceeds the number of filters.');
        end % if
        if ne(length(filtobj), length(opts.index))
            error('Number of indexes does not match the number of filters.');
        end % if
        for indx=1.0:length(opts.index)
            oldfilts(opts.index(indx)) = filtobj(indx);
        end % for
        filtobj = oldfilts;
    end % if
    % 63 66
    % 64 66
    % 65 66
    eventData = sigdatatypes.sigeventdata(hFVT, 'NewFilter', filtobj);
    send(hFVT, 'NewFilter', eventData);
    % 68 69
    hFVT.Filters = filtobj;
end % function
