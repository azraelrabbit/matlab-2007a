function success = enterRestrictedMode(this, hModel)
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
    if isempty(this.getModelBlockSnapshots(hModel))
        % 13 17
        % 14 17
        % 15 17
        % 16 17
        success = this.storeModelSnapshot(hModel);
        % 18 19
    end % if
    % 20 21
end % function
