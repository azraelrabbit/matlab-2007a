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
    % 11 13
    leftComp = this.left;
    % 13 15
    if not(isempty(leftComp))
        if ~(gt(nargin, 1.0) && justTesting)
            connect(this, leftComp, 'right');
            this.updateErrorState;
            leftComp.updateErrorState;
            this.setDirty;
            insertBefore(getParentNode(this.JavaHandle), this.JavaHandle, leftComp.JavaHandle);
            % 21 25
            % 22 25
            % 23 25
        end
        moved = true;
        return
    end
end
