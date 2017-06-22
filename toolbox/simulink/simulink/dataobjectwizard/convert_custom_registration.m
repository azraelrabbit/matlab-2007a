function convert_custom_registration(varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    custom_user_type_registration;
    udType = rtwprivate('rtwattic', 'AtticData', 'userTypes');
    % 14 17
    % 15 17
    objType = custom_user_object_type_info;
    % 17 19
    if ~(isempty(udType)) || ~(isempty(objType))
        % 19 23
        % 20 23
        % 21 23
        if ~(isempty(varargin)) && eq(varargin{1.0}, 1.0) && exist(horzcat(pwd, filesep, 'sl_customization'))
            % 23 25
            copyfile('sl_customization.m', 'sl_customization_old.m');
        end
        % 26 29
        % 27 29
        hw = waitbar(0.0, 'Generating sl_customization.m. Please wait...');
        % 29 32
        % 30 32
        strFunc = 'function sl_customization(cm)';
        % 32 34
        strCopyRight = sprintf(strrep(horzcat('\n', '% Copyright 1990-', datestr(now, 10.0), ' The MathWorks, Inc.\n'), '%', '%%'));
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        fid = fopen('sl_customization.m', 'w');
        % 39 41
        fprintf(fid, '%s\n', strFunc);
        fprintf(fid, '%s\n', '%Register user customizations');
        fprintf(fid, '%s\n\n', strCopyRight);
        % 43 45
        fprintf(fid, '%s\n\n', 'hObj = cm.slDataObjectCustomizer; ');
        if ~(isempty(udType))
            % 46 48
            fprintf(fid, '%s\n', '%%%%%% Register user data types %%%%%%%%%%');
            % 48 50
            for i=1.0:length(udType)
                fprintf(fid, '%s\n', horzcat('hObj.addUserDataType(''', udType{i}.userName, ''', ''', udType{i}.tmwName, ''',''', udType{i}.userTypeDepend, ''');'));
                % 51 53
                waitbar(mrdivide(i, plus(length(udType), length(objType))), hw);
            end % for
        end
        if ~(isempty(objType))
            % 56 58
            fprintf(fid, '\n');
            fprintf(fid, '%s\n', '%%%%%% Register mpt object types %%%%%%%%%%');
            % 59 61
            for i=1.0:length(objType)
                fnames = fieldnames(objType{i});
                props = setxor({'Name','Type'}, fnames);
                % 63 65
                fprintf(fid, '%s\n', horzcat('hObj.addMPTObjectType(''', objType{i}.Name, ''', ''', objType{i}.Type, ''');'));
                % 65 67
                for j=1.0:length(props)
                    prop = props{j};
                    switch props{j}
                    case {'Units'}
                        prop = 'DocUnits';
                    case 'Level'
                        prop = 'PersistenceLevel';
                    otherwise
                    end
                    if isnumeric(objType{i}.(props{j}))
                        value = num2str(objType{i}.(props{j}));
                        fprintf(fid, '%s\n', horzcat('hObj.addMPTObjectType(''', objType{i}.Name, ''', ''', prop, ''',', value, ');'));
                    else
                        % 79 81
                        value = objType{i}.(props{j});
                        fprintf(fid, '%s\n', horzcat('hObj.addMPTObjectType(''', objType{i}.Name, ''', ''', prop, ''',''', value, ''');'));
                        % 82 84
                    end
                end % for
                waitbar(mrdivide(plus(i, length(udType)), plus(length(udType), length(objType))), hw);
            end % for
        end
        % 88 90
        fclose(fid);
        close(hw);
    end
end
