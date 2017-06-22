function generateCoderScripts(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if this.getParameter('gen_eda_scripts')
        this.setParameter('hdlcompilescript', true);
        this.setParameter('hdlcompiletb', false);
        this.setParameter('hdlsimscript', false);
        this.setParameter('hdlsimprojectscript', false);
        this.setParameter('hdlsynthscript', true);
    else
        % 16 17
        this.setParameter('hdlcompilescript', false);
        this.setParameter('hdlcompiletb', false);
        this.setParameter('hdlsimscript', false);
        this.setParameter('hdlsimprojectscript', false);
        this.setParameter('hdlsynthscript', false);
    end % if
    % 23 26
    % 24 26
    % 25 26
    this.setParameter('hdlmapfile', true);
    this.makehdlscripts;
end % function
