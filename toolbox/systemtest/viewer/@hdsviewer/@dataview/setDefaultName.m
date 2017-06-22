function setDefaultName(this, WaveList)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(this.Name)
        % 10 11
        Names = get(WaveList, {'Name'});
        Names = horzcat(Names{:});
        n = 1.0;
            while not(isempty(strfind(Names, sprintf('untitled%d', n))))
            n = plus(n, 1.0);
        end % while
        this.Name = sprintf('untitled%d', n);
    end % if
    % 19 20
    set(this.Group, 'DisplayName', this.Name);
end % function
