function val = getDisplayLabel(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mdlObj = this.getParent;
    if isa(mdlObj, 'Simulink.BlockDiagram')
        if not(strcmp(this.ModelName, mdlObj.Name))
            this.refresh;
        end % if
    end % if
    % 14 17
    % 15 17
    if not(isempty(this.DisplayName))
        val = horzcat('Code for ', this.DisplayName);
    else
        if isempty(this.ModelName)
            mdlObj = this.getParent;
            if isa(mdlObj, 'Simulink.BlockDiagram')
                val = horzcat('Code for ', mdlObj.Name);
            else
                val = 'Code for <model>';
            end % if
        else
            val = horzcat('Code for ', this.ModelName);
        end % if
    end % if
    if this.isOutofDate
        val = horzcat(val, '*(Out of date)');
    end % if
end % function
