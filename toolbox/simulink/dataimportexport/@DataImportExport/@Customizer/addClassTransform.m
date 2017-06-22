function addClassTransform(hCustomizer, ClassName, NewClassName)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    if ~(ischar(ClassName) && isequal(size(ClassName, 1.0), 1.0) && ischar(NewClassName) && isequal(size(NewClassName, 1.0), 1.0))
        % 12 14
        error('DataImportExport:Customizer:addClassTransform', sprintf('Class names must be 1D character array rows'));
        % 14 16
    end
    % 16 19
    % 17 19
    if not(isempty(hCustomizer.ClassTransform))
        % 19 21
        ClassDupIndex = find(strcmp(ClassName, hCustomizer.ClassTransform(:, 1.0)));
    else
        ClassDupIndex = [];
    end
    % 24 27
    % 25 27
    if isempty(ClassDupIndex)
        % 27 29
        hCustomizer.ClassTransform = vertcat(horzcat(hCustomizer.ClassTransform), cellhorzcat(ClassName, NewClassName));
    else
        % 30 33
        % 31 33
        hCustomizer.ClassTransform(ClassDupIndex, :) = cellhorzcat(ClassName, NewClassName);
        % 33 35
    end
    % 35 37
end
