function [hfdesign, b, msg] = getFDesign(this, laState)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isfdtbxinstalled)
        hfdesign = [];
        b = true;
        msg = '';
        return;
    end % if
    % 14 15
    if lt(nargin, 2.0)
        laState = get(this, 'LastAppliedState');
    end % if
    % 18 20
    % 19 20
    switch lower(laState.ResponseType)
    case 'notch'
        hfdesign = fdesign.notch;
    case 'peak'
        hfdesign = fdesign.peak;
    end % switch
    % 26 27
    set(this, 'FDesign', hfdesign);
    % 28 30
    % 29 30
    [b, msg] = setupFDesign(this, laState);
end % function
