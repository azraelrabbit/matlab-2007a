function filtobj = getfilter(hFDA, wfs)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    error(nargchk(1.0, 2.0, nargin));
    % 13 15
    filtobj = get(hFDA, 'Filter');
    % 15 17
    if isempty(filtobj)
        [filtobj, opts.mcode] = defaultfilter(hFDA);
        opts.update = true;
        opts.fs = 48000.0;
        opts.default = false;
        opts.source = 'Designed';
        opts.name = 'Lowpass Equiripple';
        opts.filedirty = false;
        setfilter(hFDA, filtobj, opts);
        filtobj = get(hFDA, 'Filter');
    end % if
    % 27 29
    if lt(nargin, 2.0)
        filtobj = get(filtobj, 'Filter');
    end % if
