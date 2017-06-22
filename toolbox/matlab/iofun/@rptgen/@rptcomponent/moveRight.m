function moved = moveRight(this, justTesting)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    leftComp = this.left;
    while not(isempty(leftComp)) && not(isa(leftComp, 'rptgen.rptcomponent'))
        % 12 15
        % 13 15
        leftComp = left(leftComp);
    end % while
    % 16 18
    if not(isempty(leftComp)) && not(isa(this, 'rptgen.coutline')) && leftComp.getParentable
        % 18 22
        % 19 22
        % 20 22
        if ~(gt(nargin, 1.0) && justTesting)
            connect(this, leftComp, 'up');
            RptgenML.updateErrorStateRecursive(this);
            % 24 26
            this.setDirty;
        end
        moved = true;
        return
    end
    % 30 32
    moved = false;
end
