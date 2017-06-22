function mCodeInfo = getMCodeInfo(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    laState = get(this, 'LastAppliedState');
    specs = getSpecs(this, laState);
    % 10 13
    % 11 13
    spec = getSpecification(this, laState);
    specCell = textscan(spec, '%s', 'delimiter', ',');
    specCell = specCell{1.0};
    % 15 18
    % 16 18
    vars = cell(plus(length(specCell), 2.0), 1.0);
    vals = vars;
    descs = vars;
    % 20 22
    vars{1.0} = 'delay';
    vals{1.0} = num2str(specs.DifferentialDelay);
    descs{1.0} = 'Differential Delay';
    % 24 26
    vars{2.0} = 'NSecs';
    vals{2.0} = num2str(specs.NumberOfSections);
    descs{2.0} = 'Number of Sections';
    % 28 31
    % 29 31
    for indx=1.0:length(specCell)
        switch lower(specCell{indx})
        case 'n'
            vars{plus(indx, 2.0)} = 'N';
            vals{plus(indx, 2.0)} = num2str(specs.Order);
        case 'ast'
            vars{plus(indx, 2.0)} = 'Astop';
            vals{plus(indx, 2.0)} = num2str(specs.Astop);
        case 'fp'
            vars{plus(indx, 2.0)} = 'Fpass';
            vals{plus(indx, 2.0)} = num2str(specs.Fpass);
        case 'fst'
            vars{plus(indx, 2.0)} = 'Fstop';
            vals{plus(indx, 2.0)} = num2str(specs.Fstop);
        case 'fc'
            vars{plus(indx, 2.0)} = 'F6dB';
            vals{plus(indx, 2.0)} = num2str(specs.F6dB);
        case 'ap'
            vars{plus(indx, 2.0)} = 'Apass';
            vals{plus(indx, 2.0)} = num2str(specs.Apass);
        case 'ast'
            vars{plus(indx, 2.0)} = 'Astop';
            vals{plus(indx, 2.0)} = num2str(specs.Astop);
        end % switch
    end % for
    % 55 57
    mCodeInfo.Variables = vars;
    mCodeInfo.Values = vals;
    mCodeInfo.Inputs = cellhorzcat(vars{1.0:2.0}, sprintf('''%s''', getSpecification(this, laState)), vars{3.0:end});
    % 59 61
    mCodeInfo.Descriptions = descs;
end % function
