function genmcode(this, file)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mcode = get(this, 'MCode');
    % 9 11
    % 10 11
    if isempty(ishandle(mcode))
        [filt, mcode] = defaultfilter(this);
    end % if
    if isempty(mcode)
        error(generatemsgid('noMcode'), 'There is no M code to generate a file.');
    end % if
    % 17 18
    if lt(nargin, 2.0)
        [file, path] = uiputfile('*.m', 'Generate M-file', 'untitled.m');
        if isequal(file, 0.0)
            return;
        end % if
        file = fullfile(path, file);
        if isempty(strfind(file, '.'))
            file = horzcat(file, '.m');
        end % if
    end % if
    % 28 30
    % 29 30
    if isa(getfilter(this), 'mfilt.abstractmultirate')
        opts.H1 = 'Returns a multirate filter object.';
    else
        opts.H1 = 'Returns a discrete-time filter object.';
    end % if
    opts.outputargs = 'Hd';
    % 36 38
    % 37 38
    genmcode(file, mcode, opts);
    % 39 41
    % 40 41
    edit(file);
end % function
