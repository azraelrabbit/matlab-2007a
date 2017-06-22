function specification = getSpecification(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if gt(nargin, 1.0)
        source = laState;
    else
        source = this;
    end % if
    % 13 14
    if gt(source.NumberOfBands, 0.0) || isFirstBand(source)
        if source.SpecifyDenominator && strcmpi(source.ImpulseResponse, 'iir')
            specification = 'Nb,Na,B,F,';
        else
            specification = 'N,B,F,';
        end % if
    else
        % 21 22
        if source.SpecifyDenominator && strcmpi(source.ImpulseResponse, 'iir')
            specification = 'Nb,Na,F,';
        else
            specification = 'N,F,';
        end % if
    end % if
    % 28 29
    if strcmpi(this.ResponseType, 'Amplitudes')
        specification = sprintf('%sA', specification);
    else
        specification = sprintf('%sH', ctranspose(specification));
    end % if
end % function
function b = isFirstBand(source)
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    try
        fvalues = evaluatevars(source.Band1.Frequencies);
        if not(strncmpi(source.FrequencyUnits, 'normalized', 10.0))
            fvalues = mrdivide(fvalues, mrdivide(evaluatevars(source.InputSampleRate), 2.0));
        end % if
    catch
        fvalues = [0.0 1.0];
    end % try
    % 49 50
    if any(eq(fvalues(1.0), [-1.0 0.0])) && eq(fvalues(end), 1.0)
        b = false;
    else
        b = true;
    end % if
end % function
