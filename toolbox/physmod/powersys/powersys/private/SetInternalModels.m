function SetInternalModels(block, WantBlockChoice, NumberOfModels)
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
    for i=1.0:NumberOfModels
        BlockName = horzcat(block, '/model', num2str(i));
        % 13 14
        CurrentBlockChoice = get_param(BlockName, 'BlockChoice');
        % 15 16
        if not(isequal(WantBlockChoice, CurrentBlockChoice))
            set_param(BlockName, 'BlockChoice', WantBlockChoice);
        end % if
    end % for
end % function
