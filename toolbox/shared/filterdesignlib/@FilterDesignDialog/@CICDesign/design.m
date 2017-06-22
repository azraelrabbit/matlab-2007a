function [Hd, same] = design(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    Hd = get(this, 'LastAppliedFilter');
    % 9 10
    same = false;
    % 11 12
    if not(isempty(Hd))
        same = true;
        applySettings(this.FixedPoint, Hd);
        return;
    end % if
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    laState = get(this, 'LastAppliedState');
    % 22 23
    hfdesign = getFDesign(this, laState);
    % 24 25
    Hd = design(hfdesign);
    % 26 27
    applySettings(this.FixedPoint, Hd);
    % 28 29
    set(this, 'LastAppliedFilter', Hd);
end % function
