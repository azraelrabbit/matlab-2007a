function set_impulseresponse(this, oldImpulseResponse)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    impulseresponse = get(this, 'ImpulseResponse');
    % 9 11
    % 10 11
    if strcmpi(impulseresponse, 'iir')
        if not(strcmpi(this.FilterType, 'single-rate')) && not(allowsMultirate(this))
            % 13 14
            set(this, 'FilterType', 'single-rate')
        end % if
        % 16 19
        % 17 19
        % 18 19
        if gt(this.NumberOfBands, 0.0) && not(strcmp(this.ResponseType, 'amplitudes'))
            % 20 21
            set(this, 'ResponseType', 'Amplitudes');
        end % if
    end % if
    % 24 25
    updateMethod(this);
end % function
