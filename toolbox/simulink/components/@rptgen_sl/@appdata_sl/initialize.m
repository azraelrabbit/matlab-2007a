function initialize(ad)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ad.reset;
    % 9 10
    ad.PreRunOpenModels;
    ad.Context = 'None';
    % 12 14
    % 13 14
    trgm = find_system(0.0, 'SearchDepth', 1.0, 'type', 'block_diagram', 'name', makeTempModel(rptgen_sl.propsrc_sl, 'getModelName'));
    % 15 18
    % 16 18
    % 17 18
    if not(isempty(trgm))
        try
            bdclose(trgm);
        end % try
    end % if
end % function
