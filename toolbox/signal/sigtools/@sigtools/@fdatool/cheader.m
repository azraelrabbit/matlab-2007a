function varargout = cheader(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    Hd = getfilter(this);
    % 8 10
    if not(issupported(Hd))
        error('Only single-stage single-rate and non-coupled-allpass lattice and non-delay filters can be exported to C.');
    end
    % 12 14
    hEH = getcomponent(this, '-class', 'siggui.exportheader');
    % 14 17
    % 15 17
    if isempty(hEH)
        % 17 19
        hFig = get(this, 'FigureHandle');
        % 19 22
        % 20 22
        hEH = siggui.exportheader(Hd);
        addcomponent(this, hEH);
        % 23 25
        s = get(this, 'LastLoadState');
        if isfield(s, 'exportheader')
            setstate(hEH, s.exportheader);
        end
        % 28 31
        % 29 31
        render(hEH);
        hEH.centerdlgonfig(hFig);
        % 32 34
        addlistener(this, 'FilterUpdated', cellhorzcat(@filterlistener, hEH));
    end
    % 35 38
    % 36 38
    set(hEH, 'Visible', 'On');
    figure(hEH.FigureHandle);
    % 39 41
    if nargout
        varargout = cellhorzcat(hEH);
    end
end
function filterlistener(this, eventData, hEH)
    % 45 47
    Hd = getfilter(this);
    % 47 49
    if issupported(Hd)
        % 49 53
        % 50 53
        % 51 53
        hEH.Filter = getfilter(this);
        enab = this.Enable;
    else
        enab = 'off';
    end
    % 57 59
    set(hEH, 'Enable', enab);
end
function b = issupported(Hd)
    % 61 64
    % 62 64
    b = isa(Hd, 'dfilt.singleton') && not(isa(Hd, 'dfilt.calattice')) && not(isa(Hd, 'dfilt.delay'));
end
