function mCodeInfo = getMCodeInfo(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    laState = get(this, 'LastAppliedState');
    % 9 11
    specs = getSpecs(this, laState);
    % 11 13
    switch lower(getSpecification(this, laState))
    case 'n,f,a'
        vars = {'N','F','A'};
        vals = cellhorzcat(num2str(specs.Order), mat2str(specs.Band1.Frequencies), mat2str(specs.Band1.Amplitudes));
    case 'nb,na,f,a'
        % 17 19
        vars = {'Nb','Na','F','A'};
        vals = cellhorzcat(num2str(specs.Order), num2str(specs.DenominatorOrder), mat2str(specs.Band1.Frequencies), mat2str(specs.Band1.Amplitudes));
    case 'n,b,f,a'
        % 21 24
        % 22 24
        vars = cell(plus(2.0, mtimes(specs.NumberOfBands, 2.0)), 1.0);
        vals = vars;
        % 25 27
        vars(1.0:2.0) = {'N','B'};
        vals(1.0:2.0) = cellhorzcat(num2str(specs.Order), num2str(specs.NumberOfBands));
        % 28 30
        for indx=1.0:specs.NumberOfBands
            band = specs.(sprintf('Band%d', indx));
            vars{minus(plus(2.0, mtimes(2.0, indx)), 1.0)} = sprintf('F%d', indx);
            vars{plus(2.0, mtimes(2.0, indx))} = sprintf('A%d', indx);
            vals{minus(plus(2.0, mtimes(2.0, indx)), 1.0)} = mat2str(band.Frequencies);
            vals{plus(2.0, mtimes(2.0, indx))} = mat2str(band.Amplitudes);
        end % for
    case 'nb,na,b,f,a'
        vars = cell(plus(3.0, mtimes(specs.NumberOfBands, 2.0)), 1.0);
        vals = vars;
        % 39 41
        vars(1.0:2.0) = {'Nb','Na','B'};
        vals(1.0:2.0) = cellhorzcat(num2str(specs.Order), num2str(DenominatorOrder), num2str(specs.NumberOfBands));
        % 42 45
        % 43 45
        for indx=1.0:specs.NumberOfBands
            band = specs.(sprintf('Band%d', indx));
            vars{minus(plus(3.0, mtimes(2.0, indx)), 1.0)} = sprintf('F%d', indx);
            vars{plus(3.0, mtimes(2.0, indx))} = sprintf('A%d', indx);
            vals{minus(plus(3.0, mtimes(2.0, indx)), 1.0)} = mat2str(band.Frequencies);
            vals{plus(3.0, mtimes(2.0, indx))} = mat2str(band.Amplitudes);
        end % for
    case 'n,f,h'
        vars = {'N','F','H'};
        vals = cellhorzcat(num2str(specs.Order), mat2str(specs.Band1.Frequencies), mat2str(specs.Band1.FreqResp));
        % 55 57
    case 'nb,na,f,h'
        % 56 58
        vars = {'NB','Na','F','H'};
        vals = cellhorzcat(num2str(specs.Order), num2str(specs.DenominatorOrder), mat2str(specs.Band1.Frequencies), mat2str(specs.Band1.FreqResp));
    case 'n,b,f,h'
        % 60 62
        vars = cell(plus(2.0, mtimes(specs.NumberOfBands, 2.0)), 1.0);
        vals = vars;
        % 63 65
        vars(1.0:2.0) = {'N','B'};
        vals(1.0:2.0) = cellhorzcat(num2str(specs.Order), num2str(specs.NumberOfBands));
        % 66 68
        for indx=1.0:specs.NumberOfBands
            band = specs.(sprintf('Band%d', indx));
            % 69 71
            vars{minus(plus(2.0, mtimes(2.0, indx)), 1.0)} = sprintf('F%d', indx);
            vals{minus(plus(2.0, mtimes(2.0, indx)), 1.0)} = mat2str(band.Frequencies);
            % 72 74
            vars{plus(2.0, mtimes(2.0, indx))} = sprintf('H%d', indx);
            vals{plus(2.0, mtimes(2.0, indx))} = mat2str(band.FreqResp);
        end % for
    end
    % 77 79
    mCodeInfo.Variables = vars;
    mCodeInfo.Values = vals;
end
