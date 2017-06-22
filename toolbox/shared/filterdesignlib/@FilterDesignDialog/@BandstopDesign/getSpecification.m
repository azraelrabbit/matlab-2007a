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
        specification = 'fp1,fst1,fst2,fp2,ap1,ast,ap2';
    else
        % 14 16
        freqcons = laState.FrequencyConstraints;
        magcons = laState.MagnitudeConstraints;
        % 17 19
        specification = 'n';
        % 19 21
        switch lower(freqcons)
        case 'passband edges'
            specification = horzcat(specification, ',fp1,fp2');
        case 'stopband edges'
            specification = horzcat(specification, ',fst1,fst2');
        case 'passband and stopband edges'
            specification = horzcat(specification, ',fp1,fst1,fst2,fp2');
        case '3db points'
            specification = horzcat(specification, ',f3db1,f3db2');
        case '6db points'
            specification = horzcat(specification, ',fc1,fc2');
        case '3db points and stopband width'
            specification = horzcat(specification, ',f3db1,f3db2,bws');
        case '3db points and passband width'
            specification = horzcat(specification, ',f3db1,f3db2,bwp');
        end % switch
        % 36 38
        switch lower(magcons)
        case 'passband ripple'
            specification = horzcat(specification, ',ap');
        case 'stopband attenuation'
            specification = horzcat(specification, ',ast');
        case 'passband ripples and stopband attenuation'
            if any(strcmpi(freqcons, {'3db points','passband edges'}))
                specification = horzcat(specification, ',ap,ast');
            else
                specification = horzcat(specification, ',ap1,ast,ap2');
            end % if
        end % switch
    end % if
