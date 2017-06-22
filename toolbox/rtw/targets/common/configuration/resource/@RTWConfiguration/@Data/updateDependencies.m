function updateDependencies(this, prop, newvalue)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hprop = findprop(this, prop);
    for i=1.0:hprop.getNumDependencies
        dep = hprop.getDependency(i);
        % 14 15
        this.enablePropOnCondition(dep.getName, newvalue, dep.getActivationVector);
        % 16 17
        this.disablePropOnCondition(dep.getName, newvalue, dep.getDeactivationVector);
    end % for
    return;
end % function
