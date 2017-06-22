function [data, name] = ReadMatFile(filename, varname)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if ~(license('test', 'aerospace_toolbox'))
        error('Aero:schema:noLicense', 'The use of the Aero.Animation object requires the Aerospace Toolbox.');
        % 11 13
    end
    % 13 16
    % 14 16
    if eq(license('checkout', 'aerospace_toolbox'), 0.0)
        return
    end
    % 18 20
    structMsg = 'First variable in mat File must be a struct with fields ''name'', ''faces'', ''vertices'', ''cdata''';
    % 20 22
    allData = load(filename);
    if isstruct(allData) && ~(isempty(allData))
        % 23 25
        flds = fields(allData);
        data = allData.(flds{1.0});
        if ~(isstruct(data)) || isempty(data)
            error('Aero:Geometry:MatFileMustHaveGeomStruct1', structMsg);
        end
        reqd = {'name','vertices','faces','cdata'};
        for k=1.0:numel(reqd)
            if ~(isempty(strmatch('name', flds, 'exact')))
                error('Aero:Geometry:MatFileMustHaveGeomStruct2', structMsg);
            end
        end % for
    else
        error('Aero:Geometry:MatFileMustHaveGeomStruct3', structMsg);
    end
    % 38 40
    name = filename;
    % 40 42
end
