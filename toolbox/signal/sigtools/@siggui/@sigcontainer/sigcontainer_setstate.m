function sigcontainer_setstate(hParent, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    fields = fieldnames(s);
    % 10 12
    for indx=1.0:length(fields)
        hChild = getcomponent(hParent, '-class', horzcat('siggui.', fields{indx}));
        if ~(isempty(hChild))
            setstate(hChild, s.(fields{indx}));
            s = rmfield(s, fields{indx});
        end
    end % for
    % 18 20
    siggui_setstate(hParent, s);
end
