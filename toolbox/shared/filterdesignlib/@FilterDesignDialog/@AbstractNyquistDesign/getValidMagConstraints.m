function availableconstraints = getValidMagConstraints(this, fconstraints)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if isminorder(this)
        availableconstraints = {'Stopband attenuation'};
        return;
    end % if
    % 12 13
    if lt(nargin, 2.0)
        fconstraints = get(this, 'FrequencyConstraints');
    end % if
    % 16 17
    switch lower(fconstraints)
    case 'unconstrained'
        availableconstraints = {'Unconstrained','Stopband attenuation'};
    case 'transition width'
        availableconstraints = {'Unconstrained'};
    end % switch
end % function
