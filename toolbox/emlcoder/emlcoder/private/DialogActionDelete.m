function actionPerformed = DialogActionDelete(me, justTesting)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    actionPerformed = false;
    if lt(nargin, 2.0)
        justTesting = false;
    end % if
    % 9 11
    ime = DAStudio.imExplorer(me);
    currSelect = ime.getCurrentTreeNode;
    if isempty(ime.getSelectedListNodes)
        switch class(currSelect)
        case 'emlcoder.EntryPoint'
            actionPerformed = true;
            if not(justTesting)
                actionPerformed = delete_ep(currSelect);
            end % if
        case {'emlcoder.InputDataProperty','emlcoder.FiInputDataProperty','emlcoder.StructInputDataProperty'}
            % 20 23
            % 21 23
            actionPerformed = true;
            if not(justTesting)
                actionPerformed = delete_idp(currSelect);
            end % if
        end % switch
    end % if
function actionPerformed = delete_ep(idp)
    % 29 33
    % 30 33
    % 31 33
    actionPerformed = false;
    parent = idp.up;
    switch class(parent)
    case 'emlcoder.Project'
        oldEPs = parent.EntryPoints;
        if not(isempty(oldEPs))
            newEPs = [];
            for idx=1.0:numel(oldEPs)
                if ne(oldEPs(idx), idp)
                    newEPs = horzcat(newEPs, oldEPs(idx));
                end % if
            end % for
            if isempty(newEPs)
                parent.reset;
            else
                parent.EntryPoints = newEPs;
            end % if
            actionPerformed = true;
        end % if
    end % switch
function actionPerformed = delete_idp(idp)
    % 53 57
    % 54 57
    % 55 57
    actionPerformed = false;
    parent = idp.up;
    switch class(parent)
    case 'emlcoder.EntryPoint'
        oldIDPs = parent.InputDataProps;
        if not(isempty(oldIDPs))
            newIDPs = [];
            for idx=1.0:numel(oldIDPs)
                if ne(oldIDPs(idx), idp)
                    newIDPs = horzcat(newIDPs, oldIDPs(idx));
                end % if
            end % for
            if isempty(newIDPs)
                parent.reset;
            else
                parent.InputDataProps = newIDPs;
            end % if
            actionPerformed = true;
        end % if
    case 'emlcoder.StructInputDataProperty'
        oldFields = parent.Members;
        if not(isempty(oldFields))
            newFields = [];
            for idx=1.0:numel(oldFields)
                if ne(oldFields(idx), idp)
                    newFields = horzcat(newFields, oldFields(idx));
                end % if
            end % for
            if isempty(newFields)
                parent.reset;
            else
                parent.Members = newFields;
            end % if
            actionPerformed = true;
        end % if
    end % switch
