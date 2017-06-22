function success = setInvalidActionObject(this, ObjectsCellarray)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    success = false;
    % 11 12
    if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteCheckCallback')
        for i=1.0:length(ObjectsCellarray)
            ObjectsCellarray{i} = get_param(ObjectsCellarray{i}, 'handle');
        end % for
        this.CheckCellArray{this.ActiveCheckID}.InvalidActionObject = ObjectsCellarray;
        success = true;
    else
        DAStudio.error('Simulink:tools:MACanOnlyCallWhileExecuteCheckCallback', 'setInvalidActionObject');
    end % if
end % function
