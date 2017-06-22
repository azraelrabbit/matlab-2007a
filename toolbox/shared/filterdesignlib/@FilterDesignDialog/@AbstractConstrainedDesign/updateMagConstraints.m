function updateMagConstraints(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validMagConstraints = getValidMagConstraints(this);
    % 9 12
    % 10 12
    % 11 12
    if isempty(find(strcmpi(this.MagnitudeConstraints, validMagConstraints)))
        set(this, 'MagnitudeConstraints', validMagConstraints{1.0});
    else
        updateMethod(this);
    end % if
end % function
