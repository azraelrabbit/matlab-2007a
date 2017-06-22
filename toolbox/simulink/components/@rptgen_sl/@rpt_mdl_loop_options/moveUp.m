function moved = moveUp(this, justTesting)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    moved = false;
    leftComp = this.left;
    while not(isempty(leftComp)) && not(isa(leftComp, class(this)))
        leftComp = left(leftComp);
    end % while
    % 15 17
    if not(isempty(leftComp))
        if ~(gt(nargin, 1.0) && justTesting)
            connect(this, leftComp, 'right');
            this.updateErrorState;
            leftComp.updateErrorState;
            this.setDirty;
        end
        moved = true;
        return
    end
end
