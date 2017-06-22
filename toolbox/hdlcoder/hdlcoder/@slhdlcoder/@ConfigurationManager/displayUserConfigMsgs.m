function displayUserConfigMsgs(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(this.MergedConfigContainer))
        % 9 10
        nstatements = length(this.MergedConfigContainer.statements);
        hdldisp('Applying HDL Code Generation Control Statements', 1.0);
        if gt(nstatements, 0.0)
            hdldisp(sprintf('  %d Control Statements to be applied', nstatements), 1.0);
        end % if
    end % if
end % function
