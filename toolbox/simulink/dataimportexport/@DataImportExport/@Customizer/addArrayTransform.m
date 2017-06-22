function addArrayTransform(hCustomizer, ReadWriteName, ReadWriteFunction)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ~(strcmp('function_handle', class(ReadWriteFunction)) && isequal(size(ReadWriteFunction, 1.0), 1.0))
        % 8 10
        error('DataImportExport:Customizer:addArrayTransform', sprintf('Function specifiers must be 1D function handles'));
        % 10 12
    end
    % 12 15
    % 13 15
    switch lower(ReadWriteName)
    case 'read'
        % 16 18
        hCustomizer.ReadFunction = ReadWriteFunction;
    case 'write'
        % 19 22
        % 20 22
        hCustomizer.WriteFunction = ReadWriteFunction;
    otherwise
        % 23 25
        error('DataImportExport:Customizer:addArrayTransformWhich', sprintf('The function type must be either "read" or "write"'));
        % 25 27
    end
    % 27 29
end
