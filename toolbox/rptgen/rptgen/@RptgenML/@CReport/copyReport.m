function copyReport(this, rNew)
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
    allProps = get(rNew);
    % 12 13
    readOnlyProps = {'Path';'Output';'Locale'};
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    for i=1.0:length(readOnlyProps)
        if isfield(allProps, readOnlyProps{i})
            allProps = rmfield(allProps, readOnlyProps{i});
        end % if
    end % for
    % 23 24
    set(this, allProps);
    fName = get(rNew, 'RptFileName');
    set(this, 'RptFileName', fName);
    % 27 28
    if strcmp(class(rNew), 'rptgen.coutline')
        set(this, 'WarnOnSaveFileName', fName);
    end % if
    % 31 33
    % 32 33
    thisChild = this.down;
        while not(isempty(thisChild))
        delete(thisChild);
        thisChild = this.down;
    end % while
    % 38 40
    % 39 40
    rDown = rNew.down;
        while not(isempty(rDown))
        disconnect(rDown);
        connect(rDown, this, 'up');
        rDown = rNew.down;
    end % while
    % 46 48
    % 47 48
    delete(rNew);
end % function
