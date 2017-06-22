function values = getControlFileParam(this, param)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    values = [];
    % 11 12
    if not(isempty(this.controlFileParams)) && iscell(this.controlFileParams)
        if ne(mod(length(this.controlFileParams), 2.0), 0.0)
            warning(hdlcodermessageid('oddnumparams'), 'Asked to parse a cell array with an odd number of elements');
            % 15 16
            this.controlFileParams(end) = [];
        end % if
        % 18 19
        if not(isempty(this.controlFileParams))
            % 20 21
            properties = this.controlFileParams(1.0:2.0:end);
            values = this.controlFileParams(2.0:2.0:end);
            notstrings = not(cellfun(@ischar, properties));
            if not(isempty(find(notstrings, 1.0)))
                warning(hdlcodermessageid('nonstringproperty'), 'Ignoring non-string properties found in pvpair list.');
                % 26 27
                properties(notstrings) = [];
                values(notstrings) = [];
            end % if
            matches = not(cellfun(@isempty, regexpi(properties, param, 'once')));
            values = values(matches);
        end % if
    end % if
end % function
