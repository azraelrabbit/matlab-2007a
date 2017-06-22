function show(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent Load_DA_Studio;
    if isempty(Load_DA_Studio)
        DAStudio.Object;
        Load_DA_Studio = 1.0;
    end
    % 11 13
    if isempty(this.dialog) || not(ishandle(this.dialog))
        % 13 15
        this.dialog = DAStudio.Dialog(this);
    else
        % 16 18
        this.dialog.refresh;
    end
    show(this.dialog);
    this.dialog.resetSize(1.0);
end
