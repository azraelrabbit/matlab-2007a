function availableconstraints = getValidMagConstraints(this, fconstraints)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isminorder(this)
        availableconstraints = {'Stopband attenuation and Passband ripple'};
        return;
    end % if
    % 11 13
    if lt(nargin, 2.0)
        fconstraints = get(this, 'FrequencyConstraints');
    end % if
    % 15 17
    switch lower(fconstraints)
    case 'stopband edge and passband edge'
        if isfir(this)
            availableconstraints = {'Unconstrained','Passband ripple','Stopband attenuation'};
        else
            % 21 23
            availableconstraints = {'Unconstrained','Passband ripple'};
        end % if
    case 'passband edge'
        if isfir(this)
            availableconstraints = {'Stopband attenuation and passband ripple'};
        else
            availableconstraints = {'Passband ripple','Stopband attenuation and passband ripple'};
            % 29 31
        end % if
    case 'stopband edge'
        if isfir(this)
            availableconstraints = {'Stopband attenuation and passband ripple'};
        else
            availableconstraints = {'Stopband attenuation'};
        end % if
    case '6db point'
        availableconstraints = {'Stopband attenuation and passband ripple','Unconstrained'};
    case '3db point'
        % 40 42
        availableconstraints = {'Unconstrained','Passband ripple','Stopband attenuation','Stopband attenuation and passband ripple'};
    case 'stopband edge and 3db point'
        % 43 45
        availableconstraints = {'Unconstrained'};
    case '3db point and passband edge'
        availableconstraints = {'Unconstrained'};
    end % switch
