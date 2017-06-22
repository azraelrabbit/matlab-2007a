function FileSelect(this, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if exist(this.inputFilename, 'file')
        theFile = which(this.inputFilename);
    else
        theFile = this.inputFilename;
    end
    % 14 16
    if ispc
        selections = {'*.avi;*.wmv;*.asf;*.asx;*.rmi;*.wav;*.wma;*.wax','Windows Media Files (*.wmv,*.asf,*.wma,...)';'*.mpg;*.mpeg;*.mpe;*.mlv;*.mpe;*.mp2;*.mp3;*.mpa','MPEG Files (*.mpg,*.mpeg,*.mpe,*.mp3,...)';'*.qt;*.mov','Apple QuickTime Files (*.qt,*.mov)';'*.aif;*.aifc;*.aiff','AIFF Files (*.aif,*.aifc,*.aiff)';'*.au;*.snd','UNIX Audio Files (*.au,*.snd)';'*.mid;*.rmi','MIDI Files (*.mid,*.rmi)';'*.*','All Files (*.*)'};
    else
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        % 25 27
        selections = {'*.avi','AVI (*.avi)';'*.*','All Files (*.*)'};
        % 27 29
    end
    % 29 31
    [filename, pathname] = uigetfile(selections, 'Pick an input file', theFile);
    % 31 33
    if ~(isequal(filename, 0.0) || isequal(pathname, 0.0))
        this.inputFilename = horzcat(pathname, filename);
        dialog.setWidgetValue('inputFilename', horzcat(pathname, filename));
    end
end
