function generateTBScripts(this)
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
        this.setParameter('hdlcompiletb', true);
        this.setParameter('hdlsimscript', true);
        this.setParameter('hdlsimprojectscript', false);
        this.setParameter('hdlsynthscript', false);
        this.setParameter('hdlmapfile', false);
    else
        % 17 18
        this.setParameter('hdlcompilescript', false);
        this.setParameter('hdlcompiletb', false);
        this.setParameter('hdlsimscript', false);
        this.setParameter('hdlsimprojectscript', false);
        this.setParameter('hdlsynthscript', false);
        this.setParameter('hdlmapfile', false);
    end % if
    % 25 26
    this.makehdlscripts;
end % function
