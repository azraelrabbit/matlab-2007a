function moved = moveLeft(this, justTesting)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    upComp = this.up;
    if not(isempty(upComp)) && not(isa(upComp, 'RptgenML.Root')) && not(isa(upComp, 'rptgen.coutline'))
        % 16 19
        % 17 19
        if ~(gt(nargin, 1.0) && justTesting)
            connect(this, upComp, 'left');
            RptgenML.updateErrorStateRecursive(this);
            % 21 23
            this.setDirty;
        end
        moved = true;
        return
    end
    % 27 29
    moved = false;
end
