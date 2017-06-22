function tsarrayout = horzcat(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    nargchk(2.0, Inf, nargin)
    % 8 10
    tsarrayout = localHorzcat(varargin{1.0}, varargin{2.0});
    for k=3.0:nargin
        tsarrayout = localHorzcat(tsarrayout, varargin{k});
    end % for
end % function
function tsarrayout = localHorzcat(ts1, ts2)
    % 15 18
    % 16 18
    tsarrayout = Simulink.TsArray;
    % 18 21
    % 19 21
    members1 = get(ts1, 'Members');
    members2 = get(ts2, 'Members');
    commonts = intersect(members1, members2);
    for k=1.0:length(commonts)
        if ne(get(ts1, commonts{k}), get(ts2, commonts{k}))
            errstr = sprintf('%s%s%s', 'The common member time series ', commonts{k}, ' are not identical');
            % 26 28
            error(errstr)
        end % if
    end % for
    % 30 33
    % 31 33
    J = horzcat(ones(1.0, length(members1)), mtimes(2.0, ones(1.0, length(members2))));
    [uniquets, I] = unique(horzcat(members1, members2));
    intimeseriesarrays = cellhorzcat(ts1, ts2);
    % 35 38
    % 36 38
    tsvec = cell(length(uniquets), 1.0);
    for k=1.0:length(uniquets)
        tsvec{k} = get(intimeseriesarrays{J(I(k))}, uniquets{k});
    end % for
    % 41 45
    % 42 45
    % 43 45
    intialize(tsarrayout, horzcat(get(ts1, 'Name'), '_', get(ts2, 'Name')), tsvec{:});
end % function
