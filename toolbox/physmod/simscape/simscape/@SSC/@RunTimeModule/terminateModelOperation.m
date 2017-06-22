function terminateModelOperation(this, block, operation_id)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if not(this.isLibraryBlock(block))
        % 13 15
        mdl = getBlockModel(block);
        % 15 26
        % 16 26
        % 17 26
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        if this.blockIsTriggeringModelOperation(block)
            % 26 32
            % 27 32
            % 28 32
            % 29 32
            % 30 32
            SSC.SimscapeCC.postSave_restoreProducts(mdl);
            % 32 38
            % 33 38
            % 34 38
            % 35 38
            % 36 38
            this.setBlockCheckedModelOperation(block, operation_id);
            % 38 40
        end % if
        % 40 42
    end % if
