function Hcopy = copy(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    for indx=1.0:length(this)
        % 9 10
        Hcopy(indx) = sigdatatypes.parameter;
        % 11 12
        set(Hcopy(indx), 'AllOptions', this(indx).AllOptions, 'ValidValues', this(indx).ValidValues, 'DisabledOptions', this(indx).DisabledOptions, 'Name', this(indx).Name, 'Tag', this(indx).Tag, 'DefaultValue', this(indx).DefaultValue);
        % 13 20
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        createvalue(Hcopy(indx));
        set(Hcopy(indx), 'value', this(indx).Value);
    end % for
end % function
