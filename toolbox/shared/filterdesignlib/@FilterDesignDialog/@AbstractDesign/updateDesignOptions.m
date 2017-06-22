function updateDesignOptions(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hd = getFDesign(this, this);
    % 8 10
    if isempty(hd)
        return
    end
    dopts = designoptions(hd, getSimpleMethod(this));
    fn = fieldnames(dopts);
    for indx=1.0:mrdivide(length(fn), 2.0)
        if ~(any(strcmpi(fn{indx}, {'FilterStructure','SOSScaleNorm','SOSScaleOpts'})))
            % 16 21
            % 17 21
            % 18 21
            % 19 21
            p = findprop(this, fn{indx});
            if isempty(p)
                if strcmpi(dopts.(fn{indx}), 'bool')
                    dtype = 'bool';
                else
                    dtype = 'string';
                end
                p = schema.prop(this, fn{indx}, dtype);
            end
            % 29 31
            if iscell(dopts.(fn{indx}))
                if strcmpi(fn{indx}, 'halfbanddesignmethod')
                    set(p, 'SetFunction', @set_halfbanddesignmethod);
                    dv = 'Equiripple';
                else
                    set(p, 'SetFunction', cellhorzcat(@set_enum, dopts.(fn{indx})));
                    dv = sentencecase(dopts.(sprintf('Default%s', fn{indx})));
                end
            else
                if strcmpi(dopts.(fn{indx}), 'bool')
                    dv = dopts.(sprintf('Default%s', fn{indx}));
                else
                    dv = dopts.(sprintf('Default%s', fn{indx}));
                    if ischar(dv)
                        dv = horzcat('''', dv, '''');
                    else
                        dv = mat2str(dv);
                    end
                end
            end
            set(this, fn{indx}, dv);
        end
    end % for
end
function e = set_halfbanddesignmethod(this, e)
    % 55 57
    switch e
    case 'equiripple'
        e = 'Equiripple';
    case 'kaiserwin'
        e = 'Kaiser window';
    case 'butterworth'
        e = 'Butterworth';
    case 'ellip'
        e = 'Elliptic';
    case 'iirlinphase'
        e = 'IIR quasi-linear phase';
    otherwise
        if ~(any(strcmpi(e, {'Equiripple','Kaiser window','Butterworth','Elliptic','IIR quasi-linear phase'})))
            % 69 71
            error('Invalid HalfbandDesignMethod');
        end
    end
end
function e = set_enum(this, e, opts)
    % 75 79
    % 76 79
    % 77 79
    if ~(any(strcmpi(e, opts)))
        error(generatemsgid('invalidEnumeration'), 'Invalid Option');
    end
end
function str = sentencecase(str)
    % 83 86
    % 84 86
    str = horzcat(upper(str(1.0)), lower(str(2.0:end)));
end
