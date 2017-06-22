function update_labels(h, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    lvh = getcomponent(h, 'siggui.labelsandvalues');
    update_uis(lvh);
    % 11 13
    Type = get(h, 'IRType');
    I = find(strcmp(h.(Type), set(h, Type)));
    % 14 16
    if eq(I, 1.0)
        % 16 18
        Character = 'A';
    else
        if eq(I, 2.0)
            if strncmpi(Type, 'IIR', 3.0)
                Character = 'E';
            else
                if strncmpi(Type, 'FIR', 3.0)
                    Character = 'D';
                end
            end
        end
    end
    labels = get(h, 'labels');
    for indx=1.0:length(labels)
        % 31 34
        % 32 34
        labels{indx}(1.0) = Character;
    end % for
    % 35 38
    % 36 38
    set(h, 'labels', labels)
end
