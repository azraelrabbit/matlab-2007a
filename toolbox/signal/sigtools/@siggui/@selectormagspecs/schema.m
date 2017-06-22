function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    % 8 11
    % 9 11
    c = schema.class(pk, 'selectormagspecs', pk.findclass('abstract_specsframe'));
    set(c, 'Description', 'Magnitude Specifications');
    % 12 15
    % 13 15
    if isempty(findtype('string6'))
        schema.UserType('string6', 'string vector', @check_string);
    end % if
    % 17 20
    % 18 20
    p = schema.prop(c, 'AllOptions', 'string6');
    set(p, 'SetFunction', @setalloptions, 'FactoryValue', {'Normal','Nonnegative','Minimum-phase'});
    % 21 25
    % 22 25
    % 23 25
    p = schema.prop(c, 'Comment', 'string vector');
end % function
function check_string(value)
    % 27 31
    % 28 31
    % 29 31
    if gt(length(value), 6.0)
        error('Internal Error:   Cell array must be 6 or less.')
    end % if
end % function
function alloptions = setalloptions(this, alloptions)
    % 35 38
    % 36 38
    delete(findprop(this, 'currentSelection'));
    % 38 42
    % 39 42
    % 40 42
    flag = 0.0;
    indx = -1.0;
        while not(flag)
        indx = plus(indx, 1.0);
        PropName = horzcat('SMSSelection', num2str(indx));
        CT = findtype(PropName);
        if isempty(CT)
            flag = 1.0;
            s = schema.EnumType(PropName, alloptions);
        else
            List = get(CT, 'strings');
            flag = local_isequal(List, alloptions);
        end % if
    end % while
    % 55 57
    p = schema.prop(this, 'currentSelection', PropName);
end % function
function f = local_isequal(List, currOptList)
    % 59 62
    % 60 62
    if not(eq(length(List), length(currOptList)))
        f = false;
    else
        f = all(strcmp(List, currOptList));
    end % if
end % function
