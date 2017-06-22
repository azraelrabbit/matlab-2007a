function rtmAuthoringParams = drive_setparammode(authoringParams)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    rtmAuthoringParams = [];
    authoringEnum = ssc_param('authoring');
    for i=1.0:length(authoringParams)
        rtmAuthoringParams(i).maskName = authoringParams{i};
        rtmAuthoringParams(i).editingMode = authoringEnum;
    end % for
end % function
