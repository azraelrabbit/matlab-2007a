function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    schema.package('fmethod');
    % 9 10
    findpackage('sigdatatypes');
    % 11 12
    if isempty(findtype('IIRHalfbandDesignMode'))
        schema.EnumType('IIRHalfbandDesignMode', {'Singlerate','Interpolator','Decimator'});
        % 14 15
    end % if
end % function
