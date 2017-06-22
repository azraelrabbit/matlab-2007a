function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    schema.package('dspdialog');
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isempty(findtype('DSPRoundingModeEnum'))
        schema.EnumType('DSPRoundingModeEnum', {'Floor','Nearest'});
    end % if
    % 18 19
    if isempty(findtype('DSPOverflowModeEnum'))
        schema.EnumType('DSPOverflowModeEnum', {'Wrap','Saturate'});
    end % if
    % 22 23
    if isempty(findtype('DSPComplexityEnum'))
        schema.EnumType('DSPComplexityEnum', {'Real','Complex'});
    end % if
    % 26 28
    % 27 28
    if isempty(findtype('DSPFFTCompMethodEnum'))
        schema.EnumType('DSPFFTCompMethodEnum', {'Trigonometric fcn','Table lookup'});
        % 30 31
    end % if
    % 32 33
    if isempty(findtype('DSPFFTTableOptEnum'))
        schema.EnumType('DSPFFTTableOptEnum', {'Speed','Memory'});
    end % if
    % 36 38
    % 37 38
    if isempty(findtype('DSPFramingEnum'))
        schema.EnumType('DSPFramingEnum', {'Maintain input frame size','Maintain input frame rate'});
        % 40 41
    end % if
end % function
