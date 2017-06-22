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
        % 16 18
        specification = 'n';
        % 18 20
        if not(isempty(strfind(lower(freqcons), 'passband edge')))
            specification = horzcat(specification, ',fp');
        end % if
        % 22 24
        if not(isempty(strfind(lower(freqcons), 'stopband edge')))
            specification = horzcat(specification, ',fst');
        end % if
    end % if
end % function
