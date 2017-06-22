function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'dontshowagaindlg', pk.findclass('siggui'));
    % 9 11
    schema.prop(c, 'Name', 'string');
    p = schema.prop(c, 'Text', 'string vector');
    set(p, 'SetFunction', @settext);
    % 13 15
    schema.prop(c, 'HelpLocation', 'string');
    schema.prop(c, 'PrefTag', 'string');
    schema.prop(c, 'DontShowAgain', 'on/off');
function text = settext(this, text)
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    indx = 1.0;
        while le(indx, length(text))
        idx = strfind(text{indx}, char(10.0));
        if not(isempty(idx))
            text = cellhorzcat(text{1.0:minus(indx, 1.0)}, text{indx}(1.0:minus(idx, 1.0)), text{indx}(plus(idx, 1.0):end), text{plus(indx, 1.0):end});
        end % if
        indx = plus(indx, 1.0);
    end % while
