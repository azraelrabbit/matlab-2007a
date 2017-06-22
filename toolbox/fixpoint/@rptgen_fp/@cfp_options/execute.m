function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mdl = get(rptgen_sl.appdata_sl, 'CurrentModel');
    if isempty(mdl)
        this.status(xlate('No current model.  Not setting fixed point options.'), 2.0);
    else
        % 12 14
        propNames = {'DataTypeOverride';'';'MinMaxOverflowLogging';'';'MinMaxOverflowArchiveMode';''};
        % 14 23
        % 15 23
        % 16 23
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        for i=1.0:2.0:minus(length(propNames), 1.0)
            thisProp = propNames{i};
            propNames{plus(i, 1.0)} = get_param(mdl, thisProp);
            set_param(mdl, thisProp, this.(thisProp));
        end % for
        propNames = vertcat(propNames, vertcat({'Dirty'}, cellhorzcat(get_param(mdl, 'Dirty'))));
        % 28 32
        % 29 32
        % 30 32
    end
    % 32 34
    firstChild = this.down;
    if ~(isempty(firstChild))
        out = this.runChildren(d, [], firstChild);
        % 36 38
        if ~(isempty(mdl))
            % 38 40
            set_param(mdl, propNames{:});
        end
    else
        out = createComment(d, 'Setting fixed point global options');
        % 43 45
    end
end
