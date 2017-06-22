function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siglayout');
    c = schema.class(pk, 'constraints');
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    p = schema.prop(c, 'MinimumWidth', 'double');
    set(p, 'FactoryValue', 20.0);
    % 15 18
    % 16 18
    p = schema.prop(c, 'MinimumHeight', 'double');
    set(p, 'FactoryValue', 20.0);
    % 19 22
    % 20 22
    p = schema.prop(c, 'PreferredWidth', 'mxArray');
    set(p, 'GetFunction', @get_preferredwidth);
    % 23 25
    p = schema.prop(c, 'PreferredHeight', 'mxArray');
    set(p, 'GetFunction', @get_preferredheight);
    % 26 28
    p = schema.prop(c, 'MaximumWidth', 'double');
    set(p, 'FactoryValue', Inf);
    % 29 31
    p = schema.prop(c, 'MaximumHeight', 'double');
    set(p, 'FactoryValue', Inf);
    % 32 35
    % 33 35
    schema.prop(c, 'IPadX', 'double');
    schema.prop(c, 'IPadY', 'double');
    % 36 39
    % 37 39
    schema.prop(c, 'LeftInset', 'double');
    schema.prop(c, 'RightInset', 'double');
    schema.prop(c, 'TopInset', 'double');
    schema.prop(c, 'BottomInset', 'double');
    % 42 44
    if isempty(findtype('ConstraintFillTypes'))
        schema.EnumType('ConstraintFillTypes', {'None','Horizontal','Vertical','Both'});
        % 45 50
        % 46 50
        % 47 50
        % 48 50
    end
    % 50 52
    if isempty(findtype('ConstraintAnchorTypes'))
        schema.EnumType('ConstraintAnchorTypes', {'Center','Northwest','North','Northeast','East','Southeast','South','Southwest','West'});
        % 53 63
        % 54 63
        % 55 63
        % 56 63
        % 57 63
        % 58 63
        % 59 63
        % 60 63
        % 61 63
    end
    % 63 65
    schema.prop(c, 'Fill', 'ConstraintFillTypes');
    schema.prop(c, 'Anchor', 'ConstraintAnchorTypes');
end
function mw = get_minimumwidth(this, mw)
    % 68 71
    % 69 71
    if isempty(mw)
        ext = get(this.Component, 'Extent');
        mw = ext(3.0);
        switch get(this.Component, 'style')
        case {'popup','radio'}
            mw = plus(mw, 20.0);
        case {'pushbutton','togglebutton'}
            mw = plus(mw, 20.0);
        case 'text'
            mw = plus(mw, 2.0);
        end
    end
end
function mh = get_minimumheight(this, mh)
    % 84 87
    % 85 87
    if isempty(mh)
        hComp = get(this, 'Component');
        ext = get(hComp, 'Extent');
        mh = ext(4.0);
        switch get(hComp, 'style')
        case 'edit'
            if isempty(get(hComp, 'String'))
                origUnits = get(hComp, 'FontUnits');
                set(hComp, 'FontUnits', 'pixels');
                mh = plus(9.0, ceil(get(hComp, 'FontSize')));
                set(hComp, 'FontUnits', origUnits);
            end
        case {'pushbutton','togglebutton'}
            if not(isempty(get(this.Component, 'String')))
                mh = plus(mh, 2.0);
            end
        end
    end
end
function pw = get_preferredwidth(this, pw)
    % 106 109
    % 107 109
    mw = get(this, 'MinimumWidth');
    % 109 113
    % 110 113
    % 111 113
    if isempty(pw)
        pw = mw;
    else
        if lt(pw, mw)
            pw = mw;
        end
    end
end
function ph = get_preferredheight(this, ph)
    mh = get(this, 'MinimumHeight');
    % 122 126
    % 123 126
    % 124 126
    if isempty(ph)
        ph = mh;
    else
        if lt(ph, mh)
            ph = mh;
        end
    end
end
