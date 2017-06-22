function this = createLibrary(ss)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    copyProps = {'Registry';'ID';'TransformType';'Description';'Filename';'DisplayName'};
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    if isa(ss, 'com.mathworks.toolbox.rptgencore.tools.StylesheetMaker')
        this = RptgenML.StylesheetEditor;
        % 20 22
        for i=1.0:length(copyProps)
            ssVal = feval(horzcat('get', copyProps{i}), ss);
            if isa(ssVal, 'java.io.File')
                ssVal = getAbsolutePath(ssVal);
            end
            set(this, copyProps{i}, char(ssVal));
        end % for
    else
        if isa(ss, 'RptgenML.StylesheetEditor')
            this = RptgenML.StylesheetEditor;
            for i=1.0:length(copyProps)
                set(this, copyProps{i}, get(ss, copyProps{i}));
            end % for
        else
            if ischar(ss)
                % 36 38
                if strncmp(ss, '-NEW_', 5.0)
                    ssEd = eval(horzcat('com.mathworks.toolbox.rptgen.xml.StylesheetEditor.', ss(2.0:end)));
                    ssEd = com.mathworks.toolbox.rptgen.xml.StylesheetEditor(ssEd);
                    % 40 42
                    ssEd.setID(ss);
                    this = RptgenML.StylesheetEditor.createLibrary(ssEd);
                else
                    ss = com.mathworks.toolbox.rptgen.xml.StylesheetEditor(ss, which('rptstylesheets.xml', '-all'));
                    % 45 47
                    this = RptgenML.StylesheetEditor.createLibrary(ss);
                end
                % 48 50
            end
        end
    end
end
