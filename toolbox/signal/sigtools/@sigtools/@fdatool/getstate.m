function s = getstate(hFDA)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    error(nargchk(1.0, 1.0, nargin));
    % 10 12
    hComps = allchild(hFDA);
    % 12 14
    s = [];
    % 14 16
    for indx=1.0:length(hComps)
        % 16 18
        if ismethod(hComps(indx), 'getstate')
            % 18 20
            lbl = get(hComps(indx).classhandle, 'name');
            sc = getstate(hComps(indx));
            if ~(isempty(sc))
                s.(lbl) = sc;
            end
        end
    end % for
    % 26 28
    s.current_filt = getfilter(hFDA);
    % 28 32
    % 29 32
    % 30 32
    s.filterMadeBy = get(hFDA, 'filterMadeBy');
    s.currentFs = get(getfilter(hFDA, 'wfs'), 'Fs');
    s.currentName = get(getfilter(hFDA, 'wfs'), 'Name');
    s.version = get(hFDA, 'version');
    s.mcode = copy(get(hFDA, 'MCode'));
end
