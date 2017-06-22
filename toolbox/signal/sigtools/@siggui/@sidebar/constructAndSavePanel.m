function hPanel = constructAndSavePanel(hSB, index)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hPanel = getpanelhandle(hSB, index);
    % 11 12
    if isempty(hPanel)
        % 13 15
        % 14 15
        if ischar(index)
            tag = index;
            index = string2index(hSB, index);
        else
            tag = index2string(hSB, index);
        end % if
        % 21 23
        % 22 23
        constructors = get(hSB, 'Constructors');
        % 24 26
        % 25 26
        hPanel = feval(constructors{index}, hSB);
        % 27 28
        p = schema.prop(hPanel, 'sidebar_tag', 'string');
        set(hPanel, 'sidebar_tag', tag);
        set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
        % 31 32
        addcomponent(hSB, hPanel);
        % 33 34
    end % if
end % function
