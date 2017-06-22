function [hfdesign, b, msg] = getFDesign(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        laState = get(this, 'LastAppliedState');
    end % if
    % 11 13
    % 12 13
    hfdesign = get(this, 'FDesign');
    if isempty(hfdesign)
        b = true;
        msg = '';
        return;
    end % if
    % 19 21
    % 20 21
    [b, msg] = setupFDesign(this, laState);
    hfdesign = get(this, 'FDesign');
    % 23 24
    if not(isempty(laState))
        factor = laState.Factor;
        secondfactor = laState.SecondFactor;
        ftype = laState.FilterType;
    else
        factor = this.Factor;
        secondfactor = this.SecondFactor;
        ftype = this.FilterType;
    end % if
    % 33 35
    % 34 35
    switch lower(ftype)
    case 'decimator'
        hfdesign = fdesign.decimator(evaluatevars(factor), hfdesign);
    case 'interpolator'
        hfdesign = fdesign.interpolator(evaluatevars(factor), hfdesign);
    case 'sample-rate converter'
        hfdesign = fdesign.rsrc(evaluatevars(factor), evaluatevars(secondfactor), hfdesign);
        % 42 43
    end % switch
end % function
