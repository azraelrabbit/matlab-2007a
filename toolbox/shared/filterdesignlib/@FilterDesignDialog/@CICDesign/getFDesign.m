function hfdesign = getFDesign(this, laState)
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
    setupFDesign(this, laState);
    % 14 16
    % 15 16
    hfdesign = get(this, 'FDesign');
end % function
