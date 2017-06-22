function addActivation(this, activation)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    this.ActivationVector{plus(length(this.ActivationVector), 1.0)} = activation;
    return;
end % function
