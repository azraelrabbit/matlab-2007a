function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tf = false;
    % 7 9
    if isempty(dropObjects)
        return
    end
    % 11 13
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.StylesheetEditor') && ~(isempty(dropObjects(i).ID))
            % 14 16
            this.setStylesheetIDAbsolute(dropObjects(i));
            tf = true;
        else
            if isa(dropObjects(i), 'rptgen.coutline')
                setOutput(this, dropObjects(i).Output);
                tf = true;
            else
                if isa(dropObjects(i), 'rpt_xml.db_output')
                    setOutput(this, dropObjects(i).Output);
                    tf = true;
                else
                    if isa(dropObjects(i), 'RptgenML.LibraryFile')
                        this.SrcFileName = fullfile(dropObjects(i).PathName, dropObjects(i).FileName);
                        tf = true;
                    else
                    end
                end
            end
        end
    end % for
    if tf
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('PropertyChangedEvent', this);
        viewChild(RptgenML.Root, this);
    end
end
function setOutput(this, o)
    copyProps = {'Format';'StylesheetHTML';'StylesheetFO';'StylesheetLaTeX';'StylesheetDSSSL';'DstFileName';'SrcFileName'};
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    for i=1.0:length(copyProps)
        pVal = get(o, copyProps{i});
        if ~(isempty(pVal))
            this.(copyProps{i}) = pVal;
        end
    end % for
end
