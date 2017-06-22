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
        specification = 'fp,fst,ap,ast';
    else
        % 14 16
        freqcons = laState.FrequencyConstraints;
        magcons = laState.MagnitudeConstraints;
        % 17 19
        specification = 'n';
        % 19 21
        if not(isempty(strfind(lower(freqcons), 'passband edge')))
            specification = horzcat(specification, ',fp');
        end % if
        % 23 25
        if not(isempty(strfind(lower(freqcons), '6db point')))
            specification = horzcat(specification, ',fc');
        end % if
        % 27 29
        if not(isempty(strfind(lower(freqcons), 'stopband edge')))
            specification = horzcat(specification, ',fst');
        end % if
        % 31 34
        % 32 34
        if not(isempty(strfind(lower(magcons), 'passband ripple')))
            specification = horzcat(specification, ',ap');
        end % if
        % 36 38
        if not(isempty(strfind(lower(magcons), 'stopband attenuation')))
            specification = horzcat(specification, ',ast');
        end % if
    end % if
end % function
