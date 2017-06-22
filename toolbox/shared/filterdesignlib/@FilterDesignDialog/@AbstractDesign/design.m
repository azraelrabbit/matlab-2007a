function [Hd, same] = design(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    same = false;
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    laState = get(this, 'LastAppliedState');
    % 13 15
    if isempty(laState)
        captureState(this);
        laState = get(this, 'LastAppliedState');
    end % if
    % 18 22
    % 19 22
    % 20 22
    specs = getSpecs(this, laState);
    oldSpecs = get(this, 'LastAppliedSpecs');
    % 23 26
    % 24 26
    designOpts = getDesignOptions(this, laState);
    oldDesignOpts = get(this, 'LastAppliedDesignOpts');
    % 27 31
    % 28 31
    % 29 31
    if isequal(specs, oldSpecs) && isequal(designOpts, oldDesignOpts)
        % 31 34
        % 32 34
        same = true;
        % 34 36
        Hd = get(this, 'LastAppliedFilter');
        % 36 40
        % 37 40
        % 38 40
        if not(isempty(Hd))
            if not(isempty(this.FixedPoint))
                applySettings(this.FixedPoint, Hd);
            end % if
            return;
        end % if
    end % if
    % 46 48
    set(this, 'LastAppliedSpecs', specs, 'LastAppliedDesignOpts', designOpts);
    % 48 51
    % 49 51
    [hfdesign, b, msg] = getFDesign(this, laState);
    % 51 54
    % 52 54
    if not(b)
        error(msg);
    end % if
    method = getSimpleMethod(this, laState);
    % 57 59
    if any(strcmpi(convertStructure(this), {'df1sos','df1tsos','df2sos','df2tsos'}))
        % 59 61
        if specs.Scale
            % 61 68
            % 62 68
            % 63 68
            % 64 68
            % 65 68
            % 66 68
            designOpts = cellhorzcat(designOpts{:}, 'SOSScaleNorm', 'Linf');
        else
            designOpts = cellhorzcat(designOpts{:}, 'SOSScaleNorm', '');
        end % if
    end % if
    % 72 74
    lasterr_info = lasterror;
    % 74 76
    Hd = design(hfdesign, method, designOpts{:});
    % 76 78
    lasterror(lasterr_info);
    % 78 80
    if not(isempty(this.FixedPoint))
        applySettings(this.FixedPoint, Hd);
    end % if
    % 82 84
    set(this, 'LastAppliedFilter', Hd);
end % function
