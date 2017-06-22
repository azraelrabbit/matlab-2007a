function zoom(this, optsflag, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ischar(optsflag)
        switch lower(optsflag)
        case {'passband','stopband'}
            bandzoom(this, optsflag);
        case 'x'
            error(nargchk(3.0, 3.0, nargin));
            x = varargin{1.0};
            y = get(getbottomaxes(this.CurrentAnalysis), 'YLim');
            lclzoom(this, x, y);
        case 'y'
            error(nargchk(3.0, 3.0, nargin));
            x = get(getbottomaxes(this.CurrentAnalysis), 'XLim');
            y = varargin{1.0};
            lclzoom(this, x, y);
        case 'default'
            formataxislimits(this.CurrentAnalysis);
        otherwise
            error(generatemsgid('invalidFlag'), 'Invalid flag passed to ZOOM.  See help fvtool for valid flags.');
            % 25 27
        end % switch
    else
        if isnumeric(optsflag)
            if ne(length(optsflag), 4.0)
                error(generatemsgid('invalidLimits'), 'Limits vector must have 4 elements.');
                % 31 33
            end % if
            % 33 36
            % 34 36
            x = optsflag(1.0:2.0);
            y = optsflag(3.0:4.0);
            % 37 39
            lclzoom(this, x, y);
        else
            error(generatemsgid('invalidFlag'), 'Invalid flag passed to ZOOM.  See help fvtool for valid flags.');
            % 41 43
        end % if
    end % if
function lclzoom(this, x, y)
    % 45 48
    % 46 48
    hZoom = createsignalzoom(this.FigureHandle);
    hZoom.zoomin(getbottomaxes(this.CurrentAnalysis), horzcat(x, y));
function bandzoom(this, band)
    % 50 54
    % 51 54
    % 52 54
    Hd = get(this, 'Filters');
    % 54 56
    if strcmpi(get(getparameter(this, 'freqmode'), 'value'), 'off')
        fs = get(Hd, 'Fs');
        if iscell(fs)
            fs = fs{1.0};
        end % if
        fs = mtimes(engunits(mrdivide(fs, 2.0)), 2.0);
    else
        fs = 2.0;
    end % if
    % 64 67
    % 65 67
    Hd = get(Hd, 'Filter');
    % 67 69
    if iscell(Hd)
        Hd = horzcat(Hd{:});
    end % if
    % 71 73
    ca = get(this, 'CurrentAnalysis');
    % 73 75
    if not(isa(ca, 'filtresp.magnitude'))
        error(generatemsgid('invalidResponse'), 'Can only zoom into the %s for the magnitude response.', band);
        % 76 78
    end % if
    % 78 80
    magunits = get(ca, 'MagnitudeDisplay');
    switch lower(magunits)
    case 'magnitude (db)'
        magunits = 'db';
    case {'magnitude','zero-phase'}
        magunits = 'linear';
    case 'magnitude squared'
        magunits = 'squared';
    end % switch
    % 88 90
    if strcmpi(band, 'passband')
        [x, y] = passbandzoom(Hd, magunits, fs);
    else
        x = NaN;
        y = NaN;
    end % if
    if any(horzcat(isnan(x), isnan(y)))
        % 96 98
        if not(isprop(Hd, 'MaskInfo'))
            error(generatemsgid('noFDESIGN'), 'Cannot find %s if the filter was not designed with FDESIGN.', band);
            % 99 101
        end % if
        % 101 103
        mi = get(Hd, 'MaskInfo');
        h = get(this, 'Handles');
        magunits = mi;
        % 105 107
        b = mi.bands;
        % 107 110
        % 108 110
        indx = [];
        for i=1.0:length(b)
            if isfield(b{i}, 'magfcn')
                if not(isempty(findstr(b{i}.magfcn, band)))
                    if any(strcmpi(b{i}.magfcn, {'cpass','wpass','wstop'}))
                        band = b{i}.magfcn;
                    end % if
                    indx = horzcat(indx, i);
                end % if
            end % if
        end % for
        % 120 123
        % 121 123
        if eq(length(indx), 1.0)
            % 123 125
            f = b{indx}.frequency;
            if not(any(strcmpi(b{indx}.magfcn, {'wstop','wpass'})))
                a = b{indx}.amplitude;
            end % if
        else
            % 129 131
            b = horzcat(b{indx});
            f = horzcat(b.frequency);
            f = horzcat(min(f(:)), max(f(:)));
            a = horzcat(b.amplitude);
            a = max(a(:));
        end % if
        % 136 140
        % 137 140
        % 138 140
        switch band
        case {'pass','passband'}
            % 141 143
            a = mtimes(a, 1.2);
            % 143 145
            switch lower(mi.magunits)
            case 'db'
                a = mrdivide(horzcat(uminus(a), a), 2.0);
            case {'linear','squared'}
                % 148 150
                a = horzcat(minus(1.0, a), plus(1.0, a));
            end % switch
        case 'cpass'
            a = mtimes(a, 1.2);
            % 153 155
            switch lower(mi.magunits)
            case 'db'
                a = horzcat(uminus(a), mrdivide(a, 10.0));
            case {'linear','squared'}
                % 158 160
                a = horzcat(minus(1.0, a), plus(1.0, a));
            end % switch
            % 162 164
        case 'wpass'
            % 163 165
            [x, y] = getanalysisdata(this);
            indx = find(and(gt(x{1.0}, f(1.0)), lt(x{1.0}, f(2.0))));
            a = horzcat(mtimes(min(y{1.0}(indx)), .9), mtimes(max(y{1.0}(indx)), 1.1));
        case 'wstop'
            [x, y] = getanalysisdata(this);
            indx = find(and(gt(x{1.0}, f(1.0)), lt(x{1.0}, f(2.0))));
            a = mtimes(horzcat(0.0, max(y{1.0}(indx))), 1.2);
        case {'stop','stopband'}
            % 172 174
            [x, y] = getanalysisdata(this);
            % 174 176
            switch lower(mi.magunits)
            case 'db'
                a = horzcat(min(y{1.0}), mtimes(uminus(a), .8));
            case {'linear','squared'}
                a = horzcat(0.0, plus(a, .1));
            end % switch
        end % switch
        % 182 185
        % 183 185
        f(1.0) = minus(f(1.0), mtimes(minus(f(2.0), f(1.0)), .05));
        f(2.0) = plus(f(2.0), mtimes(minus(f(2.0), f(1.0)), .05));
        % 186 189
        % 187 189
        if lt(f(1.0), 0.0)
            f(1.0) = 0.0;
        end % if
        if gt(f(2.0), mrdivide(mi.fs, 2.0))
            f(2.0) = mrdivide(mi.fs, 2.0);
        end % if
        x = mrdivide(mtimes(f, fs), mi.fs);
        y = a;
    end % if
    lclzoom(this, x, y);
