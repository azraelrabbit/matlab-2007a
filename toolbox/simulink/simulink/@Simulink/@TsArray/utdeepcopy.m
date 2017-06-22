function utdeepcopy(h, hout)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    c = classhandle(h);
    % 19 20
    props = c.Properties;
    % 21 22
    for k=1.0:length(props)
        axflags = get(props(k), 'AccessFlags');
        if strcmp(axflags.Serialize, 'on')
            propval = get(h, props(k).Name);
            newpropval = propval;
            for j=1.0:length(propval)
                if any(strcmp(props(k).DataType, {'handle','handle vector'})) || strcmpi(props(k).Name, 'Events')
                    % 29 30
                    newpropval(j) = copy(propval(j));
                end % if
            end % for
            set(hout, props(k).Name, newpropval)
        end % if
    end % for
end % function
