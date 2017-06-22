function val = getDisplayIcon(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    switch this.Type
    case 'Container'
        % 7 12
        % 8 12
        % 9 12
        % 10 12
        switch this.State
        case 'None'
            val = 'toolbox/simulink/simulink/modeladvisor/private/icon_folder.png';
        case {'WaivedPass','Pass'}
            val = 'toolbox/simulink/simulink/modeladvisor/private/folder_pass.png';
        case 'Fail'
            ch = this.getChildren;
            active_children = find(ch, '-depth', 0.0, 'Selected', true);
            if not(isempty(find(active_children, '-depth', 0.0, 'State', 'Fail', 'Severity', 'Required')))
                val = 'toolbox/simulink/simulink/modeladvisor/private/folder_failed.png';
            else
                val = 'toolbox/simulink/simulink/modeladvisor/private/folder_warning.png';
            end % if
        otherwise
            val = 'toolbox/simulink/simulink/modeladvisor/private/icon_folder.png';
        end % switch
    case 'Task'
        if not(this.Selected)
            val = 'toolbox/simulink/simulink/modeladvisor/private/icon_task_disabled.png';
            return;
        end % if
        switch this.State
        case 'None'
            if not(this.Enable)
                val = 'toolbox/simulink/simulink/modeladvisor/private/icon_task_pselected.png';
                return;
            end % if
            if strcmp(this.Severity, 'Advisory')
                val = 'toolbox/simulink/simulink/modeladvisor/private/icon_task.png';
            else
                val = 'toolbox/simulink/simulink/modeladvisor/private/icon_task_required.png';
            end % if
        case 'WaivedPass'
            if strcmp(this.Severity, 'Advisory')
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_forcepass.png';
            else
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_req_forcepassed.png';
            end % if
        case 'Pass'
            if strcmp(this.Severity, 'Advisory')
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_passed.png';
            else
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_req_passed.png';
            end % if
        case 'Fail'
            if strcmp(this.Severity, 'Advisory')
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_warning.png';
            else
                val = 'toolbox/simulink/simulink/modeladvisor/private/task_failed.png';
            end % if
        otherwise
            val = 'toolbox/simulink/simulink/modeladvisor/private/icon_task.png';
        end % switch
    end % switch
