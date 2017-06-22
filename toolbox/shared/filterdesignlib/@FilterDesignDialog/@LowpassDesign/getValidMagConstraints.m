function availableconstraints = getValidMagConstraints(this, fconstraints)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isminorder(this)
        availableconstraints = {'Passband ripple and stopband attenuation'};
        return;
    end % if
    % 11 13
    if lt(nargin, 2.0)
        fconstraints = get(this, 'FrequencyConstraints');
    end % if
    % 15 17
    switch lower(fconstraints)
    case 'passband edge and stopband edge'
        if isfir(this)
            availableconstraints = {'Passband ripple','Stopband attenuation','Unconstrained'};
        else
            % 21 23
            availableconstraints = {'Passband ripple','Unconstrained'};
            % 23 25
        end % if
    case 'passband edge'
        if isfir(this)
            availableconstraints = {'Passband ripple and stopband attenuation'};
        else
            availableconstraints = {'Passband ripple','Passband ripple and stopband attenuation'};
            % 30 32
        end % if
    case 'stopband edge'
        if isfir(this)
            availableconstraints = {'Passband ripple and stopband attenuation'};
        else
            availableconstraints = {'Stopband attenuation'};
        end % if
    case '6db point'
        availableconstraints = {'Passband ripple and stopband attenuation','Unconstrained'};
    case '3db point'
        availableconstraints = {'Passband ripple','Stopband attenuation','Passband ripple and stopband attenuation','Unconstrained'};
    case '3db point and stopband edge'
        % 43 45
        availableconstraints = {'Unconstrained'};
    case 'passband edge and 3db point'
        availableconstraints = {'Unconstrained'};
    end % switch
