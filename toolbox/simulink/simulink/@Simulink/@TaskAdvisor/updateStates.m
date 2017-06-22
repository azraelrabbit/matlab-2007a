function updateStates(this, state, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if strcmp(state, 'refreshME')
        loc_refreshME(this);
        return
    end
    % 13 16
    % 14 16
    oldstate = this.State;
    this.State = state;
    % 17 19
    if strcmp(this.State, 'WaivedPass')
        this.InternalState = oldstate;
    end
    % 21 25
    % 22 25
    % 23 25
    if not(strcmp(state, oldstate))
        if strcmp(state, 'Pass') || strcmp(state, 'WaivedPass')
            for i=1.0:length(this.ReverseDependencyObj)
                if not(this.ReverseDependencyObj{i}.Selected)
                    canEnable = true;
                    for j=1.0:length(this.ReverseDependencyObj{i}.DependencyObj)
                        if not(strcmp(this.ReverseDependencyObj{i}.DependencyObj{j}.State, 'Pass')) && not(strcmp(this.ReverseDependencyObj{i}.DependencyObj{j}.State, 'WaivedPass'))
                            % 31 33
                            canEnable = false;
                            break
                        end
                    end % for
                    if canEnable
                        this.ReverseDependencyObj{i}.changeSelectionStatus(true);
                    end
                end
            end % for
        else
            if strcmp(state, 'Fail')
                for i=1.0:length(this.ReverseDependencyObj)
                    this.ReverseDependencyObj{i}.changeSelectionStatus(false);
                end % for
            end
        end
    end
    % 49 59
    % 50 59
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    if isa(this.up, 'Simulink.TaskAdvisor') && not(strcmp(this.up.ID, 'SysRoot'))
        % 59 61
        ch = this.up.getChildren;
        active_children = find(ch, '-depth', 0.0, 'Selected', true);
        % 62 64
        if not(isempty(find(active_children, '-depth', 0.0, 'State', 'Fail')))
            % 64 66
            parent_state = 'Fail';
        else
            if not(isempty(find(active_children, '-depth', 0.0, 'State', 'None')))
                parent_state = 'None';
            else
                if not(isempty(find(active_children, '-depth', 0.0, 'State', 'Pass'))) || not(isempty(find(active_children, '-depth', 0.0, 'State', 'WaivedPass')))
                    parent_state = 'Pass';
                else
                    % 73 76
                    % 74 76
                    % 75 78
                    % 76 78
                    parent_state = 'None';
                end
            end
        end
        this.up.updateStates(parent_state, varargin);
    else
        % 83 85
        if le(nargin, 2.0)
            loc_refreshME(this);
        end
    end
end
function loc_refreshME(this)
    % 90 92
    fptme_WF = this.MAObj.MAExplorer;
    % 92 95
    % 93 95
    ed = DAStudio.EventDispatcher;
    ed.broadcastEvent('HierarchyChangedEvent', fptme_WF.getRoot);
    ed.broadcastEvent('PropertyChangedEvent', fptme_WF.getRoot);
    % 97 100
    % 98 100
    if not(isempty(fptme_WF))
        if not(isempty(fptme_WF.getDialog))
            fptme_WF.getDialog.refresh;
        end
    end
end
