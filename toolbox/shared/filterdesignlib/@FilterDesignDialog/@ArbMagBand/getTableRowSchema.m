function tableRowSchema = getTableRowSchema(this, responseType, index)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    frequencies.Type = 'edit';
    frequencies.ObjectProperty = 'Frequencies';
    frequencies.Source = this;
    frequencies.Tag = sprintf('Frequencies%d', index);
    % 12 13
    tableRowSchema = cellhorzcat(frequencies);
    % 14 15
    switch lower(responseType)
    case 'amplitudes'
        amplitudes.Type = 'edit';
        amplitudes.ObjectProperty = 'Amplitudes';
        amplitudes.Source = this;
        amplitudes.Mode = true;
        amplitudes.Tag = sprintf('Amplitudes%d', index);
        % 22 23
        tableRowSchema{plus(end, 1.0)} = amplitudes;
    case 'magnitudes and phases'
        magnitudes.Type = 'edit';
        magnitudes.ObjectProperty = 'Magnitudes';
        magnitudes.Source = this;
        magnitudes.Mode = true;
        magnitudes.Tag = sprintf('Magnitudes%d', index);
        % 30 31
        tableRowSchema{plus(end, 1.0)} = magnitudes;
        % 32 33
        phases.Type = 'edit';
        phases.ObjectProperty = 'Phases';
        phases.Source = this;
        phases.Mode = true;
        phases.Tag = sprintf('Phases%d', index);
        % 38 39
        tableRowSchema{plus(end, 1.0)} = phases;
    case 'frequency response'
        fresp.Type = 'edit';
        fresp.ObjectProperty = 'FreqResp';
        fresp.Source = this;
        fresp.Mode = true;
        fresp.Tag = sprintf('FreqResp%d', index);
        % 46 47
        tableRowSchema{plus(end, 1.0)} = fresp;
    end % switch
end % function
