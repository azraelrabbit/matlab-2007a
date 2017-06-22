function siggui_prop_listener(this, eventData)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(nargin, 1.0)
        if ischar(eventData)
            prop = lower(eventData);
        else
            prop = lower(get(eventData.Source, 'Name'));
        end
    else
        props = fieldnames(getstate(this));
        for indx=1.0:length(props)
            prop_listener(this, props{indx});
        end % for
        return
    end
    h = get(this, 'Handles');
    if ~(isfield(h, prop))
        return
    end
    uistyle = lower(get(h.(prop), 'style'));
    hprop = findprop(this, prop);
    switch uistyle
    case 'checkbox'
        switch lower(get(hprop, 'DataType'))
        case {'bool','strictbool'}
            val = get(this, prop);
        case 'on/off'
            if strcmpi(get(this, prop), 'on')
                val = 1.0;
            else
                val = 0.0;
            end
        case 'yes/no'
            if strcmpi(get(this, prop), 'yes')
                val = 1.0;
            else
                val = 0.0;
            end
        otherwise
            senderror(generatemsgid('InternalError'), 'Internal error: A checkbox cannot be mapped to a property of datatypes ''%s''.', get(findprop(this, prop), 'DataType'));
        end
        set(h.(prop), 'Value', val);
    case {'edit','text'}
        switch lower(get(hprop, 'DataType'))
        case {'double','double_vector'}
            value = get(this, prop);
            if isreal(value)
                str = sprintf('%g', value);
            else
                if eq(sign(imag(value)), 1.0)
                    signstr = '+';
                else
                    signstr = '';
                end
                str = sprintf('%g%s%gi', real(value), signstr, imag(value));
            end
        case 'string'
            str = get(this, prop);
        case 'string vector'
            str = get(this, prop);
            if isempty(str)
                str = '';
            else
                str = sprintf('%s\n', str{:});
                str(end) = [];
            end
        end
        set(h.(prop), 'String', str);
    case 'popupmenu'
        value = lower(get(this, prop));
        if isnumeric(value)
            value = num2str(value);
        end
        allvs = lower(get(h.(prop), 'String'));
        indx = find(strcmpi(value, allvs));
        if isempty(indx)
            indx = strmatch(value, allvs);
            indx = indx(1.0);
        end
        set(h.(prop), 'Value', indx);
    end
end
