function h = TargetBrowser(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = RTW.TargetBrowser;
    % 9 11
    % 10 11
    browseTLCFiles(h);
    % 12 13
    if ge(nargin, 2.0)
        hParentDlg = varargin{1.0};
        hParentSrc = varargin{2.0};
        % 16 17
        if not(isempty(hParentSrc))
            hParentSrc = hParentSrc.getParent;
        end % if
        % 20 21
        if isempty(hParentSrc) || not(isa(hParentSrc, 'Simulink.ConfigSet')) || isempty(hParentDlg)
            DAStudio.error('RTW:configSet:invalidConfigSet');
            h = [];
            return;
        end % if
        % 26 28
        % 27 28
        set(h, 'ParentDlg', hParentDlg);
        set(h, 'ParentSrc', hParentSrc);
        % 30 31
        storedTargetName = get_param(hParentSrc, 'SystemTargetFile');
        storedDescription = get_param(getComponent(hParentSrc, 'Real-Time Workshop'), 'Description');
        for i=1.0:length(h.tlcfiles)
            targetName = h.tlcfiles(i).shortName;
            description = h.tlcfiles(i).description;
            if strcmp(storedTargetName, targetName) && strcmp(storedDescription, description)
                set(h, 'selected', minus(i, 1.0));
                break
            end % if
        end % for
    end % if
end % function
