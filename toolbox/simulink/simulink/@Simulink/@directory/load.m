function load(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
        while not(isempty(this.down))
        this.down.disconnect;
    end % while
    % 10 11
    documents = dir(this.DirectoryName);
    filterList = {'.c','.cpp','.C','.h','.mk','.a2l','.rtw'};
    % 13 14
    for i=1.0:length(documents)
        if not(documents(i).isdir)
            [pathstr, name, extension] = fileparts(documents(i).name);
            if ismember(extension, filterList)
                adsFullDocumentName = fullfile(this.DirectoryName, documents(i).name);
                curDocument = Simulink.document(adsFullDocumentName, '', this.generateBacklink);
                curDocument.connect(this, 'Up');
                this.Documents = vertcat(horzcat(this.Documents), curDocument);
            end % if
        end % if
    end % for
end % function
