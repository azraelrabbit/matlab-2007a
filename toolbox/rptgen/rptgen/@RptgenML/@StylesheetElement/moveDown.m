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
    % 12 14
    rightComp = this.right;
    if not(isempty(rightComp))
        if ~(gt(nargin, 1.0) && justTesting)
            connect(rightComp, this, 'right');
            this.updateErrorState;
            rightComp.updateErrorState;
            this.setDirty;
            % 20 22
            insertBefore(getParentNode(rightComp.JavaHandle), rightComp.JavaHandle, this.JavaHandle);
            % 22 25
            % 23 25
        end
        moved = true;
    end
end
