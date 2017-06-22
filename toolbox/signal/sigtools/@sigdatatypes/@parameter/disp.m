function disp(hPrm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(length(hPrm), 1.0)
        % 8 11
        % 9 11
        disp(horzcat('Name        : ', hPrm.Name));
        disp(horzcat('Tag         : ', hPrm.Tag));
        disp(horzcat('ValidValues : ', validvaluestring(hPrm)));
        % 13 15
        disp(' ');
        % 15 17
        value = hPrm.Value;
        if ischar(hPrm.Value)
            disp(sprintf('Value       : %s', value));
        else
            disp(horzcat('Value       : ', num2str(value)));
        end % if
    else
        % 23 26
        % 24 26
        [r, c] = size(hPrm);
        disp(horzcat(class(hPrm), ': ', num2str(r), '-by-', num2str(c)));
    end % if
    % 28 30
    disp(' ');
end % function
