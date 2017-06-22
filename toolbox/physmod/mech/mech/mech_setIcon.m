function mech_setIcon(image_name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(mech_checklicense('false'), 0.0)
        return;
    end % if
    % 11 13
    % 12 13
    H = gcbh;
    % 14 15
    if mech_compiled(H)
        return;
    end % if
    % 18 20
    % 19 20
    lconn_tags = get_param(H, 'LConnTags');
    rconn_tags = get_param(H, 'RConnTags');
    % 22 24
    % 23 24
    str = horzcat('image(mech_iconLoad(''', image_name, '''),''center'');');
    % 25 27
    % 26 27
    for i=1.0:length(lconn_tags)
        tag = lconn_tags{i};
        % 29 30
        if not(strncmp(tag, '__', 2.0))
            str = horzcat(str, 'port_label(''LConn'',', num2str(i), ',''', tag, ''');');
        end % if
    end % for
    % 34 36
    % 35 36
    for i=1.0:length(rconn_tags)
        tag = rconn_tags{i};
        % 38 39
        if not(strncmp(tag, '__', 2.0))
            str = horzcat(str, 'port_label(''RConn'',', num2str(i), ',''', tag, ''');');
        end % if
    end % for
    % 43 45
    % 44 45
    set_param(H, 'MaskDisplay', str)
end % function
