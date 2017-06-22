function idpDlgCBRedirect(dlg, idp, val, tag)
    switch tag
    case 'Size'
        % 3 5
        if ischar(val)
            ok = idp.setSize(val);
        else
            ok = false;
        end % if
        size = idp.Size;
        if isempty(size)
            size = [1.0 1.0];
        end % if
        size = horzcat('[', num2str(size), ']');
        dlg.setWidgetValue(tag, size)
        if not(ok)
            error(horzcat('String ', val, ' is not a valid size specification'));
        end % if
    otherwise
        error(horzcat('Unknown tag ', tag));
    end % switch
