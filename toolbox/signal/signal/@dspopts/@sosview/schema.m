function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('dspopts');
    c = schema.class(pk, 'sosview');
    % 9 11
    if isempty(findtype('sosviewtypes'))
        schema.EnumType('sosviewtypes', {'Complete','Individual','Cumulative','UserDefined'});
        % 12 14
    end
    % 14 16
    schema.prop(c, 'View', 'sosviewtypes');
    % 16 18
    p = schema.prop(c, 'UserDefinedSections', 'mxArray');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_soscustomview, 'GetFunction', @get_soscustomview);
    % 19 23
    % 20 23
    % 21 23
    p = schema.prop(c, 'SecondaryScaling', 'mxArray');
    set(p, 'FactoryValue', false, 'GetFunction', @get_secondaryscaling, 'SetFunction', @set_secondaryscaling);
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    p = schema.prop(c, 'cachedFilters', 'mxArray');
    set(p, 'Visible', 'Off', 'AccessFlags.Serialize', 'Off');
    % 31 33
end
function ss = set_secondaryscaling(this, ss)
    % 34 38
    % 35 38
    % 36 38
    if not(islogical(ss))
        error('SecondaryScaling must be set to true or false.');
    end
    % 40 42
    c = get(this, 'cachedFilters');
    if not(isempty(c))
        c.cumulative = [];
        set(this, 'cachedFilters', c);
    end
end
function ss = get_secondaryscaling(this, ss)
    % 48 51
    % 49 51
    if not(strcmpi(this.View, 'cumulative'))
        ss = 'Not used';
    end
end
function sosview = get_soscustomview(this, sosview)
    % 55 58
    % 56 58
    if not(strcmpi(this.View, 'userdefined'))
        sosview = 'Not used';
    end
end
function sosview = set_soscustomview(this, sosview)
    % 62 65
    % 63 65
    if iscell(sosview)
        for indx=1.0:length(sosview)
            % 66 69
            % 67 69
            if not(isnumeric(sosview{indx}))
                error('The UserDefinedSections must be a numeric or a cell array of numerics.');
            end
        end % for
    else
        if not(isnumeric(sosview))
            error('The UserDefinedSections view must be a numeric or a cell array of numerics.');
        end
    end
    c = get(this, 'cachedFilters');
    if not(isempty(c))
        c.userdefined = [];
        set(this, 'cachedFilters', c);
    end
end
