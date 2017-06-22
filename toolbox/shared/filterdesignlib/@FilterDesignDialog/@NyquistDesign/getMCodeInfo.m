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
    vars = cell(plus(length(specCell), 1.0), 1.0);
    vals = vars;
    % 19 21
    vars{1.0} = 'B';
    vals{1.0} = num2str(specs.Band{1.0});
    % 22 24
    for indx=1.0:length(specCell)
        switch lower(specCell{indx})
        case 'tw'
            vars{plus(indx, 1.0)} = 'TW';
            vals{plus(indx, 1.0)} = num2str(specs.TransitionWidth);
        case 'n'
            vars{plus(indx, 1.0)} = 'N';
            vals{plus(indx, 1.0)} = num2str(specs.Order);
        case 'ast'
            vars{plus(indx, 1.0)} = 'Astop';
            vals{plus(indx, 1.0)} = num2str(specs.Astop);
        end % switch
    end % for
    % 36 38
    mCodeInfo.Variables = vars;
    mCodeInfo.Values = vals;
    mCodeInfo.Inputs = cellhorzcat(vars{1.0}, sprintf('''%s''', getSpecification(this, laState)), vars{2.0:end});
end % function
