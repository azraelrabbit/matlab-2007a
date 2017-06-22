function setstate(this, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    set(this, 'PreviousState', s, 'isLoading', true);
    % 10 12
    try
        set(this, lclconvertstatestruct(this, s));
    catch
        set(this, 'isLoading', false);
        errstr = 'The session you are loading appears to be from a MATLAB that has the Filter Design Toolbox.  Not all settings can be loaded.';
        % 16 18
        error(errstr);
    end % try
    % 19 21
    for hindx=allchild(this)
        setcomponentstate(this, s, hindx);
    end % for
    % 23 27
    % 24 27
    % 25 27
    hFO = find(this, '-class', 'siggui.filterorder');
    send(hFO, 'UserModifiedSpecs', handle.EventData(hFO, 'UserModifiedSpecs'));
    % 28 30
    if isfield(s, 'isDesigned')
        set(this, 'isDesigned', s.isDesigned);
    end % if
    % 32 34
    set(this, 'isLoading', false);
function sout = lclconvertstatestruct(this, sin)
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    if isfield(sin, 'type')
        % 43 45
        sout.ResponseType = sin.type;
        sout.DesignMethod = processmethod(sin.method);
        sout.StaticResponse = sin.StaticResponse;
    else
        fout = {'Tag','Version','Components'};
        if isfield(sin, 'FilterType')
            sin.ResponseType = sin.FilterType;
            fout = cellhorzcat(fout{:}, 'FilterType');
        end % if
        sout = rmfield(sin, fout);
    end % if
    % 55 57
    if not(isfield(sout, 'SubType'))
        % 57 59
        hFT = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Response Type');
        % 59 61
        sout.SubType = sout.ResponseType;
        filtertypes = getallselections(hFT);
        for indx=1.0:length(filtertypes)
            subs = getsubselections(hFT, filtertypes{indx});
            % 64 66
            idx = find(strcmpi(subs, sout.SubType));
            % 66 68
            if not(isempty(idx))
                sout.ResponseType = filtertypes{indx};
                break
            end % if
        end % for
    end % if
    sout = reorderstructure(sout, 'ResponseType', 'SubType');
function method = processmethod(method)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    switch method
    case 'cheb2'
        method = 'filtdes.cheby2';
    case 'cheb1'
        method = 'filtdes.cheby1';
    otherwise
        % 85 87
        if isempty(findstr(method, '.'))
            method = horzcat('filtdes.', method);
        end % if
    end % switch
