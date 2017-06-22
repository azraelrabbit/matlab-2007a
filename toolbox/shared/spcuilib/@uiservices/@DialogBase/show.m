function show(hDialogBase, create)
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
    % 17 20
    % 18 20
    titleFull = horzcat(hDialogBase.TitlePrefix, hDialogBase.TitleSuffix);
    % 20 22
    if isempty(hDialogBase.Dialog)
        % 22 24
        if create
            % 24 26
            hDialogBase.Dialog = DAStudio.Dialog(hDialogBase);
            % 26 29
            % 27 29
            if isempty(hDialogBase.DialogPosition)
                % 29 32
                % 30 32
                hDialogBase.DialogPosition = hDialogBase.Dialog.position;
                hDialogBase.Dialog.resetSize(1.0);
            else
                % 34 37
                % 35 37
                if resetSizeWhenNew
                    % 37 41
                    % 38 41
                    % 39 41
                    hDialogBase.Dialog.resetSize(1.0);
                    % 41 43
                    new_position = hDialogBase.Dialog.position;
                    % 43 45
                    new_position(1.0:2.0) = hDialogBase.DialogPosition(1.0:2.0);
                    % 45 47
                    hDialogBase.Dialog.position = new_position;
                else
                    % 48 50
                    hDialogBase.Dialog.position = hDialogBase.DialogPosition;
                end % if
            end % if
            setTitle(hDialogBase.Dialog, titleFull);
            show(hDialogBase.Dialog);
        end % if
    else
        % 56 59
        % 57 59
        hDialogBase.Dialog.refresh;
        if resetSizeWhenUpdated
            % 60 62
            old_position = hDialogBase.Dialog.position;
            hDialogBase.Dialog.resetSize(1.0);
            new_position = hDialogBase.Dialog.position;
            new_position(1.0:2.0) = old_position(1.0:2.0);
            hDialogBase.Dialog.position = new_position;
        end % if
        setTitle(hDialogBase.Dialog, titleFull);
        show(hDialogBase.Dialog);
    end % if
end % function
