function specification = getSpecification(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 2.0)
        laState = this;
    end % if
    % 10 12
    if isminorder(this, laState)
        specification = 'tw,ast';
    else
        % 14 16
        freqcons = laState.FrequencyConstraints;
        magcons = laState.MagnitudeConstraints;
        % 17 19
        specification = 'n';
        % 19 21
        if strcmpi(freqcons, 'transition width')
            specification = horzcat(specification, ',tw');
        end % if
        % 23 25
        if strcmpi(magcons, 'stopband attenuation')
            specification = horzcat(specification, ',ast');
        end % if
    end % if
end % function
