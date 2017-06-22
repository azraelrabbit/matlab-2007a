function psberror(Erreur, errortype, Option)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(exist('Option'))
        Option = 'uiwait';
    end % if
    if isstruct(Erreur)
        % 13 14
        showSPSerror(Erreur);
        disp('---> Error detected during SimPowerSystems analysis.')
        error(Erreur.identifier, '%s', Erreur.message);
    else
        Err.msg = Erreur;
        Err.id = errortype;
        showSPSerror(Err);
        if strcmp(Option, 'Replace')
            h = errordlg(Erreur, errortype, 'replace');
        else
            h = errordlg(Erreur, errortype);
        end % if
        if strcmp(Option, 'uiwait')
            uiwait(h);
        end % if
        % 29 30
    end % if
end % function
