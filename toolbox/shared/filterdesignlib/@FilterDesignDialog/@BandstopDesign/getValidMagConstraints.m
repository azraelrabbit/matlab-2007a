function availableconstraints = getValidMagConstraints(this, fconstraints)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isminorder(this)
        availableconstraints = {'Passband ripples and stopband attenuation'};
        return;
    end % if
    % 11 13
    if lt(nargin, 2.0)
        fconstraints = get(this, 'FrequencyConstraints');
    end % if
    % 15 17
    switch lower(fconstraints)
    case 'passband and stopband edges'
        if isfir(this)
            availableconstraints = {'Unconstrained'};
        else
            availableconstraints = {'Passband ripple','Unconstrained'};
            % 22 24
        end % if
    case 'passband edges'
        % 25 27
        availableconstraints = {'Passband ripple','Passband ripples and stopband attenuation'};
    case 'stopband edges'
        % 28 31
        % 29 31
        availableconstraints = {'Stopband attenuation'};
    case '6db points'
        availableconstraints = {'Unconstrained'};
    case '3db points'
        availableconstraints = {'Passband ripple','Stopband attenuation','Passband ripples and stopband attenuation','Unconstrained'};
    case {'3db points and stopband width','3db points and passband width'}
        % 36 38
        availableconstraints = {'Unconstrained'};
    end % switch
