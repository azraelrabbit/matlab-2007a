function this = designpanel(allowplugins)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    this = siggui.designpanel;
    % 8 10
    if lt(nargin, 1.0)
        allowplugins = true;
    end % if
    % 12 14
    if allowplugins
        addplugins(this);
    end % if
    types = get(this, 'AvailableTypes');
    % 17 19
    if gt(length(types.hp), 1.0)
        hp = horzcat({'hp'}, cellhorzcat(types.hp.tag));
        hpn = cellhorzcat(types.hp.name);
    else
        hp = types.hp.tag;
        hpn = types.hp.name;
    end % if
    % 25 27
    if gt(length(types.bp), 1.0)
        bp = horzcat({'bp'}, cellhorzcat(types.bp.tag));
        bpn = cellhorzcat(types.bp.name);
    else
        bp = types.bp.tag;
        bpn = types.bp.name;
    end % if
    % 33 35
    if gt(length(types.bs), 1.0)
        bs = horzcat({'bs'}, cellhorzcat(types.bs.tag));
        bsn = cellhorzcat(types.bs.name);
    else
        bs = types.bs.tag;
        bsn = types.bs.name;
    end % if
    % 41 43
    hfts = siggui.selector('Response Type', cellhorzcat(horzcat({'lp'}, cellhorzcat(types.lp.tag)), hp, bp, bs, horzcat({'other'}, cellhorzcat(types.other.tag))), cellhorzcat(cellhorzcat(types.lp.name), hpn, bpn, bsn, cellhorzcat(types.other.name)), 'lp', 'lp');
    % 43 47
    % 44 47
    % 45 47
    hdms = siggui.selector('Design Method', cellhorzcat(cellhorzcat('iir', types.lp(1.0).iir.tag), cellhorzcat('fir', types.lp(1.0).fir.tag)), cellhorzcat(cellhorzcat('IIR', types.lp(1.0).iir.name), cellhorzcat('FIR', types.lp(1.0).fir.name)), 'fir', 'filtdes.remez');
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    addcomponent(this, horzcat(hfts, hdms));
    % 52 54
    set(this, 'Version', 1.0);
    settag(this);
end % function
