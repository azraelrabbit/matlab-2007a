function fix_submenu(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if get(this, 'SubMenuFixed')
        return
    end
    h = get(this, 'Handles');
    ha = get(this, 'CurrentAnalysis');
    % 12 14
    if isa(ha, 'filtresp.tworesps') && strcmpi(ha.fvtool_tag, 'tworesps')
        ha = ha.Analyses(1.0);
    end
    % 16 18
    tag = get(ha, 'fvtool_tag');
    % 18 20
    tags = fieldnames(h.menu.analyses);
    % 20 22
    freqtags = {'magnitude','phase','grpdelay','phasedelay','magestimate','noisepower'};
    timetags = {'impulse','step'};
    % 23 25
    if isempty(tag)
        ontags = {};
    else
        switch tag
        case freqtags
            ontags = intersect(tags, freqtags);
        case timetags
            ontags = timetags;
        otherwise
            ontags = {};
        end
    end
    % 36 38
    for indx=1.0:length(tags)
        if any(strcmpi(tags{indx}, ontags))
            enab = get(h.menu.analyses.(tags{indx}), 'Enable');
        else
            enab = 'Off';
        end
        % 43 54
        % 44 54
        % 45 54
        % 46 54
        % 47 54
        % 48 54
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        if isfield(h.menu.righthand, tags{indx})
            set(h.menu.righthand.(tags{indx}), 'Enable', enab);
        end
    end % for
    % 57 59
    set(this, 'SubMenuFixed', true);
end
