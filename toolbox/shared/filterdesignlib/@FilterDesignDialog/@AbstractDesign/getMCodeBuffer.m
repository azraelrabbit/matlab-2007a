function hBuffer = getMCodeBuffer(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    laState = get(this, 'LastAppliedState');
    spec = getSpecification(this, laState);
    % 10 13
    % 11 13
    mCodeInfo = getMCodeInfo(this);
    % 13 15
    variables = mCodeInfo.Variables;
    values = mCodeInfo.Values;
    % 16 18
    if isfield(mCodeInfo, 'Descriptions')
        descriptions = mCodeInfo.Descriptions;
    else
        descriptions = repmat({''}, size(variables));
    end
    % 22 24
    if isfield(mCodeInfo, 'Inputs')
        inputs = mCodeInfo.Inputs;
    else
        inputs = cellhorzcat(sprintf('''%s''', spec), variables{:});
    end
    % 28 30
    if ~(strcmpi(laState.FrequencyUnits, 'normalized (0 to 1)'))
        variables{plus(end, 1.0)} = 'Fs';
        values{plus(end, 1.0)} = num2str(laState.InputSampleRate);
        descriptions{plus(end, 1.0)} = '';
        inputs{plus(end, 1.0)} = 'Fs';
    end
    % 35 37
    hBuffer = sigcodegen.mcodebuffer;
    % 37 40
    % 38 40
    hBuffer.addcr(hBuffer.formatparams(variables, values, descriptions));
    hBuffer.cr;
    % 41 43
    hfdesign = get(this, 'FDesign');
    % 43 46
    % 44 46
    if strcmpi(laState.FilterType, 'single-rate')
        hBuffer.add('h = %s(', class(hfdesign));
    else
        % 48 50
        specs = getSpecs(this, laState);
        % 50 52
        hBuffer.add('h = fdesign.%s(%d, ''%s'', ', lower(laState.FilterType), specs.Factor, get(hfdesign, 'Response'));
        % 52 54
    end
    % 54 57
    % 55 57
    if ~(strcmpi(laState.MagnitudeUnits, 'db'))
        inputs{plus(end, 1.0)} = sprintf('''%s''', laState.MagnitudeUnits);
    end
    % 59 62
    % 60 62
    hBuffer.add('%s', inputs{1.0});
    for indx=2.0:length(inputs)
        hBuffer.add(', %s', inputs{indx});
    end % for
    % 65 67
    hBuffer.addcr(');');
    % 67 70
    % 68 70
    hBuffer.cr;
    % 70 72
    laDOpts = getDesignOptions(this, get(this, 'LastAppliedState'));
    % 72 74
    methodName = getSimpleMethod(this, laState);
    % 74 76
    hBuffer.add('Hd = design(h, ''%s''', methodName);
    % 76 78
    set(hfdesign, 'Specification', spec);
    defaultDOpts = designopts(hfdesign, methodName);
    for indx=1.0:2.0:length(laDOpts)
        % 80 84
        % 81 84
        % 82 84
        if isequal(defaultDOpts.(laDOpts{indx}), laDOpts{plus(indx, 1.0)})
            continue;
        end
        hBuffer.addcr(', ...');
        if isnumeric(laDOpts{plus(indx, 1.0)})
            laDOpts{plus(indx, 1.0)} = num2str(laDOpts{plus(indx, 1.0)});
        else
            if islogical(laDOpts{plus(indx, 1.0)})
                if laDOpts{plus(indx, 1.0)}
                    laDOpts{plus(indx, 1.0)} = 'true';
                else
                    laDOpts{plus(indx, 1.0)} = 'false';
                end
            else
                laDOpts{plus(indx, 1.0)} = horzcat('''', lower(laDOpts{plus(indx, 1.0)}), '''');
            end
        end
        hBuffer.add('    ''%s'', %s', laDOpts{indx}, laDOpts{plus(indx, 1.0)});
    end % for
    hBuffer.add(');');
    if ~(isempty(this.FixedPoint))
        hBuffer.cr;
        hBuffer.cr;
        hBuffer.add(getMCodeBuffer(this.FixedPoint));
    end
end
