function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    schema.package('dspfixptddg');
    % 9 10
    if isempty(findtype('DSPRoundingModeEnum'))
        schema.EnumType('DSPRoundingModeEnum', {'Floor','Nearest'});
    end % if
    % 13 14
    if isempty(findtype('DSPOverflowModeEnum'))
        schema.EnumType('DSPOverflowModeEnum', {'Wrap','Saturate'});
    end % if
    % 17 18
    if isempty(findtype('DSPComplexityEnum'))
        schema.EnumType('DSPComplexityEnum', {'Real','Complex'});
    end % if
    % 21 23
    % 22 23
    if isempty(findtype('DSPFFTCompMethodEnum'))
        schema.EnumType('DSPFFTCompMethodEnum', {'Trigonometric fcn','Table lookup'});
        % 25 26
    end % if
    % 27 28
    if isempty(findtype('DSPFFTTableOptEnum'))
        schema.EnumType('DSPFFTTableOptEnum', {'Speed','Memory'});
    end % if
    % 31 33
    % 32 33
    if isempty(findtype('DSPFramingEnum'))
        schema.EnumType('DSPFramingEnum', {'Maintain input frame size','Maintain input frame rate'});
        % 35 37
        % 36 37
    end % if
    % 38 41
    % 39 41
    % 40 41
    if isempty(findtype('DSPResetPortEnum'))
        schema.EnumType('DSPResetPortEnum', {'None','Rising edge','Falling edge','Either edge','Non-zero sample'});
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        % 47 48
    end % if
    % 49 51
    % 50 51
    if isempty(findtype('DSPSortAlgorithmEnum'))
        schema.EnumType('DSPSortAlgorithmEnum', {'Quick sort','Insertion sort'});
    end % if
    % 54 55
    if isempty(findtype('DSPSampleModeEnum'))
        schema.EnumType('DSPSampleModeEnum', {'Discrete','Continuous'});
    end % if
    % 58 59
    if isempty(findtype('DSPSourceFracBitsModeEnum'))
        schema.EnumType('DSPSourceFracBitsModeEnum', {'Best precision','User-defined'});
        % 61 63
        % 62 63
    end % if
end % function
