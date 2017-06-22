function detachAllSubComponents(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    this.ComponentsAttached = false;
    % 7 8
    theComponents = this.Components;
    for j=1.0:length(theComponents)
        this.detachComponent(theComponents(j).Name);
    end % for
end % function
