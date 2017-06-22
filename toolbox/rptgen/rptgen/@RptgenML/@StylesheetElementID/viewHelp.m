function viewHelp(this, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    helpview(RptgenML.getHelpMapfile(varargin{:}), horzcat('obj.', class(this), '.', findSuffix(this)));
function editorType = findSuffix(this)
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if strcmp(this.ID, 'generate.toc')
        editorType = this.ID;
    else
        if strcmp(this.ID, 'formal.title.placement')
            editorType = this.ID;
        else
            if com.mathworks.toolbox.rptgen.xml.StylesheetEditor.isParameterNode(this.JavaHandle)
                editorType = 'xml';
            else
                if strcmp(this.DataType, 'boolean')
                    editorType = 'enum';
                else
                    if strncmp(this.DataType, '|', 1.0)
                        editorType = 'enum';
                    else
                        editorType = 'string';
                    end % if
                end % if
            end % if
        end % if
    end % if
