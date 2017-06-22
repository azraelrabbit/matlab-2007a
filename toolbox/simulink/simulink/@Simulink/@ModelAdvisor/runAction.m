function success = runAction(this, checkTitleID, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    success = false;
    % 8 10
    % 9 10
    if ischar(checkTitleID)
        for i=1.0:length(this.CheckCellarray)
            if strcmp(checkTitleID, this.CheckCellarray{i}.TitleID)
                success = true;
                break
            end % if
        end % for
    else
        success = true;
        i = checkTitleID;
    end % if
    % 21 22
    if not(success) || isempty(this.CheckCellarray{i}.ActionCallbackHandle)
        DAStudio.message('Simulink:tools:MAInvalidCheckID');
    else
        this.ActiveCheckID = i;
        origStage = this.stage;
        this.stage = 'ExecuteActionCallback';
        try
            this.CheckCellarray{i}.ActionResultInHTML = this.CheckCellarray{i}.ActionCallbackHandle(varargin{1.0:end});
        catch
            success = false;
            this.CheckCellarray{i}.ActionSuccess = false;
            DAStudio.message('Simulink:tools:MAErrorInActionCallback', this.CheckCellarray{i}.Title);
            disp(lasterr);
        end % try
        this.stage = origStage;
    end % if
end % function
