function setVhdlPackageName(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if this.getParameter('isvhdl')
        % 8 9
        this.setParameter('vhdl_package_required', this.PirInstance.vhdlPackageGenerated);
        % 10 11
        topName = this.getEntityTop;
        % 12 13
        this.setParameter('vhdl_package_name', horzcat(topName, this.getParameter('package_suffix')));
        % 14 16
        % 15 16
    end % if
end % function
