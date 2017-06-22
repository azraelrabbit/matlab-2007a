function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'soscustomreorder', pk.findclass('sigcontainer'));
    % 9 11
    if isempty(findtype('sosreorderspecify'))
        schema.EnumType('sosreorderspecify', {'Use Numerator Order','Specify'});
    end % if
    % 13 15
    schema.prop(c, 'NumeratorOrder', 'string');
    p = schema.prop(c, 'DenominatorOrder', 'string');
    set(p, 'GetFunction', @getdenord, 'SetFunction', @setdenord);
    p = schema.prop(c, 'ScaleValuesOrder', 'string');
    set(p, 'GetFunction', @getsvord, 'SetFunction', @setsvord);
    % 19 21
    p = schema.prop(c, 'DenomOrdSource', 'sosreorderspecify');
    set(p, 'GetFunction', @getdenomordsource, 'SetFunction', @setdenomordsource);
    p = schema.prop(c, 'ScaleVOrdSource', 'sosreorderspecify');
    set(p, 'GetFunction', @getscalevordsource, 'SetFunction', @setscalevordsource);
    % 24 26
    p = schema.prop(c, 'Listeners', 'handle.listener vector');
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function
function do = getdenord(this, do)
    % 29 32
    % 30 32
    hden = getcomponent(this, 'tag', 'denominator');
    if isempty(hden)
        return;
    end % if
    do = get(hden, 'Values');
    do = do{2.0};
end % function
function do = setdenord(this, do)
    hden = getcomponent(this, 'tag', 'denominator');
    if isempty(hden)
        return;
    end % if
    vals = cellhorzcat('', do);
    set(hden, 'Values', vals);
end % function
function sv = getsvord(this, sv)
    hsv = getcomponent(this, 'tag', 'scalevalues');
    if isempty(hsv)
        return;
    end % if
    sv = get(hsv, 'Values');
    sv = sv{2.0};
end % function
function do = setsvord(this, do)
    hsv = getcomponent(this, 'tag', 'scalevalues');
    if isempty(hsv)
        return;
    end % if
    vals = cellhorzcat('', do);
    set(hsv, 'Values', vals);
end % function
function source = getdenomordsource(this, source)
    hden = getcomponent(this, 'tag', 'denominator');
    % 64 66
    source = tag2string(get(hden, 'Selection'));
end % function
function source = setdenomordsource(this, source)
    % 68 71
    % 69 71
    hden = getcomponent(this, 'tag', 'denominator');
    % 71 73
    set(hden, 'Selection', string2tag(source));
end % function
function source = getscalevordsource(this, source)
    % 75 78
    % 76 78
    hsv = getcomponent(this, 'tag', 'scalevalues');
    % 78 80
    source = tag2string(get(hsv, 'Selection'));
end % function
function source = setscalevordsource(this, source)
    % 82 85
    % 83 85
    hsv = getcomponent(this, 'tag', 'scalevalues');
    % 85 87
    set(hsv, 'Selection', string2tag(source));
end % function
function tag = string2tag(str)
    % 89 92
    % 90 92
    if strcmpi(str, 'Specify')
        tag = 'specify';
    else
        tag = 'use';
    end % if
end % function
function str = tag2string(tag)
    % 98 101
    % 99 101
    if strcmpi(tag, 'use')
        str = 'Use Numerator Order';
    else
        str = 'Specify';
    end % if
end % function
