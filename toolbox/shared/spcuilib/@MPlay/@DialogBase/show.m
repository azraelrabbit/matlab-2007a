function show(this, create)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 2.0)
        create = true;
    end % if
    % 12 16
    % 13 16
    % 14 16
    resetSizeWhenNew = true;
    resetSizeWhenUpdated = true;
    % 17 19
    if isempty(this.dialog)
        % 19 21
        if create
            % 21 23
            this.dialog = DAStudio.Dialog(this);
            % 23 26
            % 24 26
            if isempty(this.DialogPosition)
                % 26 29
                % 27 29
                this.DialogPosition = this.dialog.position;
                this.dialog.resetSize(1.0);
            else
                % 31 34
                % 32 34
                if resetSizeWhenNew
                    % 34 38
                    % 35 38
                    % 36 38
                    this.dialog.resetSize(1.0);
                    % 38 40
                    new_position = this.dialog.position;
                    % 40 42
                    new_position(1.0:2.0) = this.DialogPosition(1.0:2.0);
                    % 42 44
                    this.dialog.position = new_position;
                else
                    % 45 47
                    this.dialog.position = this.DialogPosition;
                end % if
            end % if
            setTitle(this.dialog, this.fullTitleStr);
            show(this.dialog);
        end % if
    else
        % 53 56
        % 54 56
        this.dialog.refresh;
        if resetSizeWhenUpdated
            % 57 59
            old_position = this.dialog.position;
            this.dialog.resetSize(1.0);
            new_position = this.dialog.position;
            new_position(1.0:2.0) = old_position(1.0:2.0);
            this.dialog.position = new_position;
        end % if
        setTitle(this.dialog, this.fullTitleStr);
        show(this.dialog);
    end % if
end % function
