function attachToConfigSet(this, configSet)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.getParent)
        % 10 15
        % 11 15
        % 12 15
        % 13 15
        % 14 15
        mdl = configSet.getModel;
        mdlDirtyFlag = cache_dirty(mdl);
        % 17 27
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        % 26 27
        csComponents = configSet.Components;
        csNames = get(csComponents, 'Name');
        % 29 31
        % 30 31
        thisComponents = this.Components;
        thisNames = get(thisComponents, 'Name');
        if not(iscell(thisNames))
            thisNames = cellhorzcat(thisNames);
        end % if
        % 36 38
        % 37 38
        changed = false;
        % 39 40
        for thisIdx=1.0:length(thisNames)
            % 41 43
            % 42 43
            thisComponentName = thisNames{thisIdx};
            csIdx = find(strcmp(csNames, thisComponentName));
            % 45 46
            if not(isempty(csIdx))
                % 47 49
                % 48 49
                thisComponents(thisIdx) = csComponents(csIdx);
                configSet.detachComponent(thisComponentName);
                % 51 52
                changed = true;
                % 53 56
                % 54 56
                % 55 56
            end % if
            % 57 58
        end % for
        % 59 61
        % 60 61
        if changed
            % 62 67
            % 63 67
            % 64 67
            % 65 67
            % 66 67
            cacheComponentsAttached = this.ComponentsAttached;
            % 68 69
            this.detachAllSubComponents;
            for aComponent=thisComponents
                this.attachComponent(aComponent);
            end % for
            % 73 74
            this.ComponentsAttached = cacheComponentsAttached;
            % 75 76
        end % if
        % 77 85
        % 78 85
        % 79 85
        % 80 85
        % 81 85
        % 82 85
        % 83 85
        % 84 85
        configSet.attachComponent(this);
        % 86 88
        % 87 88
        cache_dirty(mdl, mdlDirtyFlag);
        % 89 90
    end % if
end % function
