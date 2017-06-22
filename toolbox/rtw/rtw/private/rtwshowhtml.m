function rtwshowhtml(htmlFileName, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    mlock;
    persistent IEBrowserObj;
    persistent supportIEBrowser;
    if rtwinbat
        return
    end
    if not(isa(supportIEBrowser, 'logical'))
        dasRoot = DAStudio.Root;
        if dasRoot.hasWebBrowser
            supportIEBrowser = true;
        else
            supportIEBrowser = false;
        end
    end
    if gt(nargin, 1.0) && strcmp(varargin{1.0}, 'UseWebBrowserWidget') && supportIEBrowser
        if isa(IEBrowserObj, 'DAStudio.Dialog')
            docObj = IEBrowserObj.getDialogSource;
            if isa(docObj, 'Simulink.document') && strcmp(docObj.documentName, htmlFileName)
                IEBrowserObj.refresh;
            else
                htmlrptObj = Simulink.document(htmlFileName, 'HTML Report');
                IEBrowserObj.setSource(htmlrptObj);
            end
        else
            % 36 38
            htmlrptObj = Simulink.document(htmlFileName, 'HTML Report');
            % 38 40
            IEBrowserObj = DAStudio.Dialog(htmlrptObj);
            IEBrowserObj.position = [50.0 50.0 700.0 900.0];
            IEBrowserObj.show;
        end
    else
        web(htmlFileName);
    end
end
