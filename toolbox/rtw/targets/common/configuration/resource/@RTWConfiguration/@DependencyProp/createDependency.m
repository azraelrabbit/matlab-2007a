function h = createDependency(this, propertyName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    h = RTWConfiguration.Dependency(propertyName);
    i_addDependency(this, h);
    return;
end % function
function i_addDependency(this, dependency)
    % 11 12
    tempDependencies = this.Dependencies;
    if isempty(tempDependencies)
        % 14 15
        tempDependencies = dependency;
    else
        tempDependencies(plus(length(tempDependencies), 1.0)) = dependency;
    end % if
    this.Dependencies = tempDependencies;
    return;
end % function
