function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    mode = this.Block.(horzcat(this.Prefix, 'Mode'));
    if any(strcmp(mode, {'User-defined','Binary point scaling','Slope and bias scaling'}))
        % 11 13
        this.Mode = 'Specify word length';
    else
        if strcmp(mode, 'Same as input') && ~(any(strcmp(this.Entries, 'Same as input')))
            this.Mode = 'Same word length as input';
        else
            this.Mode = mode;
        end
    end
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    this.WordLength = this.Block.(horzcat(this.Prefix, 'WordLength'));
end
