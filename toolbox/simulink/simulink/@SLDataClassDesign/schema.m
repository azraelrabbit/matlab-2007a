function schema
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    schema.package('SLDataClassDesign');
    % 19 21
    % 20 21
    if isempty(findtype('SLDataClassDesign_CSCHandlingMode'))
        schema.EnumType('SLDataClassDesign_CSCHandlingMode', {'v1 - Manually defined';'v2 - CSC Registration File'});
    else
        % 24 25
        % 25 26
        warning('A type named ''SLDataClassDesign_CSCHandlingMode'' already exists.');
    end % if
end % function
