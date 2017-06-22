function moved = moveDown(this, justTesting)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    moved = false;
    rightComp = this.right;
    % 13 15
    while not(isempty(rightComp)) && not(isa(rightComp, class(this)))
        rightComp = right(rightComp);
    end % while
    % 17 19
    if not(isempty(rightComp))
        if ~(gt(nargin, 1.0) && justTesting)
            connect(rightComp, this, 'right');
            this.updateErrorState;
            rightComp.updateErrorState;
            this.setDirty;
        end
        moved = true;
        return
    end
end
