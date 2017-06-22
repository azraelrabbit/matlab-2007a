function h = destroy(h, destroyData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    models = get(h, 'Models');
    nmodels = length(models);
    for i=1.0:nmodels
        model = models{i};
        if isa(model, 'rfbbequiv.linear')
            delete(model);
        end % if
    end % for
    ckt = get(h, 'OriginalCkt');
    if isa(ckt, 'rfckt.cascade')
        delete(ckt);
    end % if
end % function
