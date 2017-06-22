function editModes = mech_enveditingmodes(handle)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    authoringParams = {'AnalysisType','GravityAsSignal'};
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    authoringEnum = ssc_param('authoring');
    editModes = [];
    for i=1.0:length(authoringParams)
        editModes(i).maskName = authoringParams{i};
        editModes(i).editingMode = authoringEnum;
    end % for
end % function
