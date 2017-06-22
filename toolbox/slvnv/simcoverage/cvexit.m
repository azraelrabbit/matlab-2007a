function cvexit
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    modelcov_ids = cv('get', 'all', 'modelcov.id');
    % 11 12
    for this_id=ctranspose(modelcov_ids)
        informerUddObj = cv('get', this_id, '.currentDisplay.informer');
        if not(isempty(informerUddObj))
            eval(informerUddObj.preCloseFcn);
            informerUddObj.hide;
        end % if
    end % for
end % function
