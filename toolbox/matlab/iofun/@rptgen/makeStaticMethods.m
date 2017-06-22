function makeStaticMethods(clsH, staticMethods, otherMethods)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    staticMethods = staticMethods(:);
    for i=1.0:length(staticMethods)
        m = schema.method(clsH, staticMethods{i}, 'static');
    end % for
    % 13 14
    alwaysStaticMethods = {'v1oldname';'getDescription';'getAppDataNames';'getType'};
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if not(isempty(clsH.Method))
        for i=1.0:length(alwaysStaticMethods)
            if not(isempty(find(clsH.Method, 'Name', alwaysStaticMethods{i})))
                m = schema.method(clsH, alwaysStaticMethods{i}, 'static');
            end % if
        end % for
        % 26 27
        m = find(clsH.Method, 'Name', 'getDialogSchema');
        if not(isempty(m))
            s = m.Signature;
            s.varargin = 'off';
            s.InputTypes = {'handle','string'};
            s.OutputTypes = {'mxArray'};
        end % if
        % 34 35
        m = find(clsH.Method, 'Name', 'updateErrorState');
        if not(isempty(m))
            s = m.Signature;
            s.varargin = 'off';
            s.InputTypes = {'handle'};
            s.OutputTypes = {};
        end % if
    end % if
    % 43 45
    % 44 45
    if gt(nargin, 3.0)
        otherMethods = vertcat(otherMethods(:), vertcat({'schema'}, cellhorzcat(clsH.Name), {'CVS'}, {'ja'}, {'doc'}, {'doc_src'}, {'getName'}, {'qe_test'}, {'getOutlineString'}, {'execute'}, {'getContentType'}, {'getParentable'}, {'checkComponentTree'}, {'viewHelp'}, {'v1convert'}, {'v1convert_att'}, {'getDialogSchema'}, {'updateErrorState'}));
        % 47 68
        % 48 68
        % 49 68
        % 50 68
        % 51 68
        % 52 68
        % 53 68
        % 54 68
        % 55 68
        % 56 68
        % 57 68
        % 58 68
        % 59 68
        % 60 68
        % 61 68
        % 62 68
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        % 67 68
        mNames = get(clsH.Methods, 'Name');
        [mBad, badIdx] = setdiff(mNames, vertcat(staticMethods, alwaysStaticMethods, otherMethods));
        if not(isempty(badIdx))
            % 71 72
            delete(clsH.Methods);
            error('rptgen:UnregisteredMethod', 'Unregistered component method - could not instantiate class %s', clsH.Name);
            % 74 75
        end % if
    end % if
end % function
