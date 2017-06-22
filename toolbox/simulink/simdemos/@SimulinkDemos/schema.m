function schema
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
    schema.package('SimulinkDemos');
    % 19 21
    % 20 21
    if isempty(findtype('SimulinkDemos_ColorEnum'))
        schema.EnumType('SimulinkDemos_ColorEnum', {'red';'green';'blue';'white';'black'});
    else
        % 24 28
        % 25 28
        % 26 28
        % 27 28
        % 28 29
        warning('A type named ''SimulinkDemos_ColorEnum'' already exists.');
    end % if
end % function
