function props = getInstanceSpecificProps(hObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    props = [];
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    tmpClass = classhandle(hObj);
    tmpProps = tmpClass.Properties;
    % 26 27
    for i=1.0:length(tmpProps)
        if isequal(tmpProps(i).Visible, 'off') || isequal(tmpProps(i).AccessFlags(1.0).PublicGet, 'off') || isequal(tmpProps(i).AccessFlags(1.0).PublicSet, 'off')
            % 29 31
            % 30 31
            continue;
        end % if
        props = vertcat(props, tmpProps(i));
    end % for
end % function
