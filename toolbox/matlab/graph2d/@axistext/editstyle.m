function aObj = editstyle(aObj, style)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    notNormal = strcmp(get(gcbo, 'Checked'), 'on');
    % 8 10
    switch style
    case 'normal'
        aObj = set(aObj, 'FontAngle', 'normal');
        aObj = set(aObj, 'FontWeight', 'normal');
    case 'italic'
        if notNormal
            angle = 'normal';
        else
            angle = 'italic';
        end % if
        aObj = set(aObj, 'FontAngle', angle);
    case 'bold'
        if notNormal
            weight = 'normal';
        else
            weight = 'bold';
        end % if
        aObj = set(aObj, 'FontWeight', weight);
    end % switch
